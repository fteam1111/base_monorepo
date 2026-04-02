import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:local_storage/storage/token_storage.dart';

/// Interceptor thêm authentication token vào các request
class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;

  AuthInterceptor([TokenStorage? tokenStorage])
    : _tokenStorage = tokenStorage ?? TokenStorage();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _tokenStorage.getAccessToken();

      // Chỉ thêm Authorization header nếu token tồn tại
      if (token != null && token.isNotEmpty) {
        final accessToken = JWT(token);

        if (accessToken.isValid()) {
          options.headers['Authorization'] =
              'Bearer ${accessToken.getOrCrash()}';
        }
      }

      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }
}
