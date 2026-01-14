import 'package:core/config/base_config.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:network/interceptor/auth_interceptor.dart';
import 'package:network/interceptor/base_interceptor.dart';
import 'package:network/interceptor/custom_log_interceptor.dart';
import 'package:network/interceptor/refresh_token_interceptor.dart';
import 'package:network/interceptor/retry_interceptor.dart';

class DioHttpClientBuilder {
  final BaseConfig config;
  final List<Interceptor> Function(Dio dio)? interceptorsBuilder;

  late final Dio _dio;

  DioHttpClientBuilder({
    required this.config,
    this.interceptorsBuilder,
    bool autoBuild = true,
  }) {
    if (autoBuild) {
      build();
    }
  }

  Dio get dio => _dio;

  /// Build Dio mặc định
  Dio build({BaseOptions? options}) {
    _dio = _createDio(
      options: options,
      contentType: options?.contentType ?? config.contentType,
    );
    return _dio;
  }

  /// Build Dio với form-urlencoded
  Dio buildFormUrlencoded({BaseOptions? options}) {
    _dio = _createDio(
      options: options,
      contentType: options?.contentType ?? config.contentTypeFormUrlEncoded,
    );
    return _dio;
  }

  Dio _createDio({BaseOptions? options, required String contentType}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        contentType: contentType,
        receiveTimeout:
            options?.receiveTimeout ??
            Duration(milliseconds: config.httpSendTimeout),
        connectTimeout:
            options?.connectTimeout ??
            Duration(milliseconds: config.httpConnectTimeout),
        sendTimeout:
            options?.sendTimeout ??
            Duration(milliseconds: config.httpSendTimeout),
      ),
    );

    final sortedInterceptors =
        <Interceptor>[
            AuthInterceptor(),
            // Note: RefreshTokenInterceptor requires a callback, add it manually when needed
            RetryInterceptor(dio),
            CustomLogInterceptor(),
            ...?interceptorsBuilder?.call(dio),
          ]
          ..distinct()
          ..sortedByDescending((e) => e is BaseInterceptor ? e.priority : -1);

    dio.interceptors.addAll(sortedInterceptors);
    return dio;
  }

  /// Add refresh token interceptor (gọi SAU build)
  void addRefreshTokenInterceptor({
    required Future<Map<String, dynamic>> Function(String refreshToken)
    onRefresh,
  }) {
    _dio.interceptors.removeWhere((i) => i is RefreshTokenInterceptor);

    final authIndex = _dio.interceptors.indexWhere((i) => i is AuthInterceptor);

    final interceptor = RefreshTokenInterceptor(
      dio: _dio,
      refreshTokenCallback: onRefresh,
    );

    if (authIndex != -1) {
      _dio.interceptors.insert(authIndex + 1, interceptor);
    } else {
      _dio.interceptors.add(interceptor);
    }
  }
}
