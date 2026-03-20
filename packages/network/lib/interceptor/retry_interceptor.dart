import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:network/interceptor/base_interceptor.dart';

/// Interceptor dùng để tự động retry các request bị lỗi
/// Áp dụng cơ chế exponential backoff + jitter
class RetryInterceptor extends Interceptor {
  /// Dio instance dùng để thực hiện lại request
  final Dio _dio;

  /// Số lần retry tối đa cho mỗi request
  final int maxRetries;

  /// Thời gian delay cơ bản cho exponential backoff
  final Duration baseDelay;

  RetryInterceptor(this._dio, {int? maxRetries, Duration? baseDelay})
    : maxRetries = maxRetries ?? BaseInterceptor.maxRetriesDefault,
      baseDelay =
          baseDelay ??
          const Duration(
            milliseconds: BaseInterceptor.retryDelayMillisecondsDefault,
          );

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;

    // Lấy số lần retry hiện tại từ extra
    final currentRetries = requestOptions.extra['retries'] as int? ?? 0;

    // Nếu không đủ điều kiện retry hoặc đã vượt quá số lần retry tối đa
    if (!_shouldRetry(err) || currentRetries >= maxRetries) {
      return handler.next(err);
    }

    // Tăng số lần retry
    final nextRetry = currentRetries + 1;

    // Tính toán thời gian delay theo exponential backoff + jitter
    final delay = _calculateDelay(nextRetry);

    // Đợi trước khi thực hiện retry
    await Future.delayed(delay);

    // Lưu lại số lần retry vào extra để dùng cho lần sau
    requestOptions.extra['retries'] = nextRetry;

    try {
      // Thực hiện lại request với cấu hình cũ
      final response = await _dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        cancelToken: requestOptions.cancelToken,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
          extra: requestOptions.extra,
          responseType: requestOptions.responseType,
          contentType: requestOptions.contentType,
          validateStatus: requestOptions.validateStatus,
          receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
          followRedirects: requestOptions.followRedirects,
          maxRedirects: requestOptions.maxRedirects,
          persistentConnection: requestOptions.persistentConnection,
          requestEncoder: requestOptions.requestEncoder,
          responseDecoder: requestOptions.responseDecoder,
          listFormat: requestOptions.listFormat,
        ),
        onSendProgress: requestOptions.onSendProgress,
        onReceiveProgress: requestOptions.onReceiveProgress,
      );

      // Nếu retry thành công → trả response
      handler.resolve(response);
    } catch (_) {
      // Nếu retry vẫn thất bại → chuyển lỗi cho interceptor tiếp theo
      handler.next(err);
    }
  }

  /// Xác định request có nên retry hay không
  bool _shouldRetry(DioException error) {
    // Retry khi gặp lỗi kết nối hoặc timeout
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return true;
    }

    // Retry dựa theo HTTP status code
    final statusCode = error.response?.statusCode;
    if (statusCode != null) {
      // Retry khi lỗi server (5xx) hoặc một số lỗi đặc biệt
      return statusCode >= 500 ||
          statusCode == 408 || // Request Timeout - Hết thời gian chờ
          statusCode == 429; // Too Many Requests - Quá nhiều request
    }

    return false;
  }

  /// Tính toán thời gian delay cho retry
  /// Công thức: baseDelay * 2^(retryCount - 1) + jitter
  Duration _calculateDelay(int retryCount) {
    // Exponential backoff - Tăng delay theo cấp số nhân
    final exponentialDelayMs =
        baseDelay.inMilliseconds * pow(2, retryCount - 1);

    // Thêm jitter ngẫu nhiên (0–100ms) để tránh retry đồng loạt
    final jitterMs = Random().nextInt(100);

    final totalDelayMs = exponentialDelayMs.toInt() + jitterMs;

    // Giới hạn thời gian delay tối đa là 30 giây
    return Duration(milliseconds: min(totalDelayMs, 30000));
  }
}
