import 'dart:async';

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:local_storage/storage/token_storage.dart';

/// Interceptor xử lý refresh token khi nhận được 401
/// Queue các request trong khi đang refresh để tránh gọi refresh nhiều lần
class RefreshTokenInterceptor extends Interceptor {
  final Dio _dio;
  final TokenStorage _tokenStorage;
  final Future<Map<String, dynamic>> Function(String refreshToken)
  _refreshTokenCallback;

  bool _isRefreshing = false;
  final List<_QueuedRequest> _requestQueue = [];

  RefreshTokenInterceptor({
    required Dio dio,
    TokenStorage? tokenStorage,
    required Future<Map<String, dynamic>> Function(String refreshToken)
    refreshTokenCallback,
  }) : _dio = dio,
       _tokenStorage = tokenStorage ?? TokenStorage(),
       _refreshTokenCallback = refreshTokenCallback;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final requestOptions = err.requestOptions;

    // Chỉ xử lý lỗi 401 (unauthorized)
    if (statusCode != 401) {
      return handler.next(err);
    }

    // Bỏ qua refresh cho chính endpoint refresh token
    if (requestOptions.path.contains('ApiRoutes.refreshToken')) {
      return handler.next(err);
    }

    // Nếu chưa đang refresh, bắt đầu quá trình refresh
    if (!_isRefreshing) {
      _isRefreshing = true;

      try {
        // Lấy refresh token từ storage
        final refreshToken = await _tokenStorage.getRefreshToken();

        // Validate refresh token bằng JWT để đảm bảo tính chất DDD
        if (refreshToken == null || refreshToken.isEmpty) {
          throw const ApiFailure.authenticationFailed();
        }

        final refreshTokenJWT = JWT(refreshToken);
        if (!refreshTokenJWT.isValid()) {
          throw const ApiFailure.refreshTokenInvalid();
        }

        // Gọi callback refresh token (được implement bởi app)
        final tokens = await _refreshTokenCallback(
          refreshTokenJWT.getOrDefaultValue(''),
        );

        // Lưu token mới
        await _tokenStorage.saveAccessToken(tokens['accessToken'] as String);
        if (tokens['refreshToken'] != null) {
          await _tokenStorage.saveRefreshToken(
            tokens['refreshToken'] as String,
          );
        }

        _isRefreshing = false;

        // Retry request gốc với token mới
        final response = await _retryRequest(requestOptions);
        handler.resolve(response);

        // Xử lý các request đã được queue
        await _processQueue();
      } catch (e) {
        _isRefreshing = false;

        // Xóa tokens khi refresh thất bại
        await _tokenStorage.clearTokens();

        // Reject tất cả các request đã được queue
        _rejectQueue(const ApiFailure.authenticationFailed());

        // Tiếp tục với error
        handler.next(err);
      }
    } else {
      // Queue request này trong khi đang refresh
      _queueRequest(requestOptions, handler);
    }
  }

  /// Retry một request thất bại với token đã được cập nhật
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final token = await _tokenStorage.getAccessToken();

    // Validate token bằng JWT trước khi set vào header
    String? authorizationHeader;
    if (token != null && token.isNotEmpty) {
      final accessToken = JWT(token);
      if (accessToken.isValid()) {
        authorizationHeader = 'Bearer ${accessToken.getOrCrash()}';
      }
    }

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        if (authorizationHeader != null) 'Authorization': authorizationHeader,
      },
    );

    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
    );
  }

  /// Thêm request vào queue
  void _queueRequest(RequestOptions request, ErrorInterceptorHandler handler) {
    final completer = Completer<Response>();
    _requestQueue.add(_QueuedRequest(request, completer, handler));

    completer.future.then(
      (response) => handler.resolve(response),
      onError: (error) => handler.reject(
        error is DioException
            ? error
            : DioException(requestOptions: request, error: error),
      ),
    );
  }

  /// Process all queued requests
  Future<void> _processQueue() async {
    final queue = List<_QueuedRequest>.from(_requestQueue);
    _requestQueue.clear();

    for (final item in queue) {
      try {
        final response = await _retryRequest(item.request);
        item.completer.complete(response);
      } catch (e) {
        item.completer.completeError(e);
      }
    }
  }

  /// Reject all queued requests with an error
  void _rejectQueue(ApiFailure error) {
    final queue = List<_QueuedRequest>.from(_requestQueue);
    _requestQueue.clear();

    for (final item in queue) {
      item.completer.completeError(error);
    }
  }
}

/// Internal class to hold queued requests
class _QueuedRequest {
  final RequestOptions request;
  final Completer<Response> completer;
  final ErrorInterceptorHandler handler;

  _QueuedRequest(this.request, this.completer, this.handler);
}
