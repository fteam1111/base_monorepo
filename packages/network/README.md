# Network Package

Package cung cấp HTTP client và các interceptor cho Flutter app, được xây dựng trên Dio với hỗ trợ đầy đủ cho authentication, token refresh, retry logic và logging.

## Tính năng

- ✅ **HTTP Client Builder**: Tạo Dio instance với cấu hình tùy chỉnh
- ✅ **Auth Interceptor**: Tự động thêm JWT token vào request headers
- ✅ **Refresh Token Interceptor**: Tự động refresh token khi nhận 401, queue requests trong khi refresh
- ✅ **Retry Interceptor**: Tự động retry request với exponential backoff + jitter
- ✅ **Custom Log Interceptor**: Logging đẹp mắt cho request/response
- ✅ **DDD Support**: Sử dụng Value Objects (JWT) để validate tokens

## Cài đặt

Thêm vào `pubspec.yaml`:

```yaml
dependencies:
  network:
    path: ../network
```

## Sử dụng

### 1. Khởi tạo HTTP Client

```dart
import 'package:network/network.dart';
import 'package:core/core.dart';

final dio = Dio();
final config = BaseConfig(); // Your config implementation

final builder = DioHttpClientBuilder(
  dio: dio,
  config: config,
);

// Tạo Dio instance với content-type mặc định
final httpClient = builder.build();

// Hoặc tạo với content-type form-urlencoded
final formClient = builder.buildFormUrlencoded();
```

### 2. Thêm Refresh Token Interceptor

```dart
builder.addRefreshTokenInterceptor(
  onRefresh: (String refreshToken) async {
    // Gọi API refresh token của bạn
    final response = await refreshTokenApi(refreshToken);
    
    // Trả về map chứa accessToken và refreshToken (optional)
    return {
      'accessToken': response.accessToken,
      'refreshToken': response.refreshToken, // Optional
    };
  },
);
```

### 3. Sử dụng Custom Interceptors

```dart
final builder = DioHttpClientBuilder(
  dio: dio,
  config: config,
  interceptorsBuilder: (Dio dio) => [
    // Thêm các interceptor tùy chỉnh của bạn
    AuthInterceptor(),
    RetryInterceptor(dio, maxRetries: 3),
  ],
);
```

## Interceptors

### AuthInterceptor

Tự động thêm JWT token vào request headers. Chỉ thêm token khi token hợp lệ (được validate qua JWT Value Object).

```dart
final interceptor = AuthInterceptor(
  tokenStorage, // Optional, mặc định sẽ tạo mới
);
```

**Tính năng:**
- Validate token bằng JWT Value Object (DDD pattern)
- Chỉ thêm Authorization header khi token hợp lệ
- Tự động bỏ qua nếu token null/empty/invalid

### RefreshTokenInterceptor

Tự động refresh token khi nhận 401, queue các request trong khi refresh để tránh gọi refresh nhiều lần.

```dart
final interceptor = RefreshTokenInterceptor(
  dio: dio,
  tokenStorage: tokenStorage, // Optional
  refreshTokenCallback: (String refreshToken) async {
    // Implement refresh logic
    return {
      'accessToken': newAccessToken,
      'refreshToken': newRefreshToken, // Optional
    };
  },
);
```

**Tính năng:**
- Validate refresh token bằng JWT trước khi dùng
- Queue requests trong khi refresh
- Retry tất cả queued requests sau khi refresh thành công
- Clear tokens và reject queued requests nếu refresh thất bại

### RetryInterceptor

Tự động retry request với exponential backoff + jitter.

```dart
final interceptor = RetryInterceptor(
  dio,
  maxRetries: 3, // Mặc định: 3
  baseDelay: Duration(milliseconds: 500), // Mặc định: 500ms
);
```

**Tính năng:**
- Retry khi gặp lỗi connection/timeout
- Retry khi HTTP status code là 5xx, 408, 429
- Exponential backoff: delay tăng theo công thức `baseDelay * 2^(retryCount - 1)`
- Jitter: thêm delay ngẫu nhiên 0-100ms để tránh retry đồng loạt
- Giới hạn delay tối đa: 30 giây

**Công thức delay:**
```
delay = baseDelay * 2^(retryCount - 1) + jitter(0-100ms)
maxDelay = 30 seconds
```

### CustomLogInterceptor

Logging đẹp mắt cho request/response sử dụng `pretty_dio_logger`.

```dart
final interceptor = CustomLogInterceptor();
```

**Tính năng:**
- Log request headers và body
- Log response body
- Log errors
- Compact format, max width 90 characters

## Kiến trúc

Package này tuân theo **Domain-Driven Design (DDD)** principles:

- **Value Objects**: Sử dụng `JWT` Value Object để validate tokens
- **Separation of Concerns**: Mỗi interceptor có trách nhiệm riêng biệt
- **Error Handling**: Sử dụng `ApiFailure` từ core package

## Dependencies

- `dio`: HTTP client
- `core`: Core utilities, Value Objects, Error handling
- `local_storage`: Token storage interface
- `pretty_dio_logger`: Logging
- `connectivity_plus`: Network connectivity (nếu cần)

## Ví dụ đầy đủ

```dart
import 'package:network/network.dart';
import 'package:core/core.dart';
import 'package:local_storage/local_storage.dart';

void setupNetwork() {
  final dio = Dio();
  final config = BaseConfig(); // Your implementation
  final tokenStorage = TokenStorage(); // Your implementation

  final builder = DioHttpClientBuilder(
    dio: dio,
    config: config,
    interceptorsBuilder: (Dio dio) => [
      AuthInterceptor(tokenStorage),
      RetryInterceptor(dio, maxRetries: 3),
    ],
  );

  final httpClient = builder.build();

  // Thêm refresh token interceptor
  builder.addRefreshTokenInterceptor(
    onRefresh: (String refreshToken) async {
      final response = await refreshTokenApi(refreshToken);
      return {
        'accessToken': response.accessToken,
        'refreshToken': response.refreshToken,
      };
    },
  );

  // Sử dụng httpClient cho các API calls
  // ...
}
```

## Lưu ý

1. **Token Validation**: Tất cả tokens đều được validate qua JWT Value Object trước khi sử dụng
2. **Interceptor Order**: Interceptors được sắp xếp theo priority (cao → thấp)
3. **Refresh Token**: Refresh token interceptor nên được thêm sau AuthInterceptor
4. **Error Handling**: Sử dụng `ApiFailure` từ core package để xử lý errors

## License

[Your License Here]
