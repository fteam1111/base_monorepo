# Gói `share`

Gói nội bộ chứa các tiện ích, hằng số và các service được chia sẻ dùng chung trong toàn bộ dự án.

## Giới thiệu

Gói `share` đóng vai trò là một lớp dùng chung (shared layer), cung cấp các chức năng cốt lõi và tiện ích mà các feature-package khác hoặc ứng dụng chính có thể tái sử dụng. Mục đích là để tránh lặp code và quản lý các chức năng chung tại một nơi duy nhất.

**Lưu ý:** Đây là một gói nội bộ (internal package) và không dành cho việc publish ra `pub.dev`.

## Các tính năng chính

Gói này bao gồm các module chức năng sau:

### 1. Tích hợp Firebase

Cung cấp các lớp service để tương tác với các dịch vụ của Firebase:

-   **Analytics**: `FirebaseAnalyticsService` - Ghi lại sự kiện.
-   **Crashlytics**: `FirebaseCrashlyticsService` - Báo cáo lỗi và crash.
-   **Performance Monitoring**: `FirebasePerformanceMonitor` - Theo dõi hiệu năng.
-   **Push Notifications**: `LocalNotificationService` - Xử lý thông báo đẩy.
-   **Remote Config**: `RemoteConfigService` - Quản lý cấu hình từ xa.

### 2. Tiện ích thiết bị (Device Utilities)

Các service để lấy thông tin và tương tác với phần cứng của thiết bị:

-   **Device Info**: Lấy thông tin về thiết bị (model, OS version...).
-   **File Picker**: Mở trình chọn file của hệ thống.
-   **Permission Service**: Yêu cầu và kiểm tra quyền (ví dụ: camera, storage).
-   **Connectivity Service**: Kiểm tra trạng thái kết nối mạng (online/offline).

### 3. Hằng số (Constants)

Nơi tập trung các giá trị không đổi được sử dụng trong toàn bộ ứng dụng:

-   `ApiRoutes`: Các đường dẫn API.
-   `AppRoutes`: Các route cho navigation (sử dụng với GoRouter).
-   `RegexPatterns`: Các mẫu regular expression để validation.
-   `RemoteConfigConstants`: Các hằng số/keys cho Remote Config.

## Cách sử dụng

Các service trong gói này được thiết kế để inject vào ứng dụng thông qua Dependency Injection (ví dụ: `get_it`).

**Ví dụ:** Để sử dụng `ConnectivityService`, bạn cần đăng ký nó trong DI container và sau đó lấy ra ở nơi cần dùng.

```dart
// Trong file dependency_manager.dart
locator.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

// Trong một widget hoặc BLoC
final connectivityService = locator<ConnectivityService>();

// Sử dụng
connectivityService.onConnectivityChanged.listen((isConnected) {
  if (isConnected) {
    print('Thiết bị đã kết nối mạng.');
  } else {
    print('Mất kết nối mạng.');
  }
});
```

### 4. Extensions

#### Context Extensions

Truy cập nhanh các thuộc tính từ BuildContext:

```dart
import 'package:core/core.dart';

// Media Query
final width = context.screenWidth;
final height = context.screenHeight;
final isSmall = context.isSmallScreen;
final isPortrait = context.isPortrait;

// Theme
final theme = context.theme;
final textStyle = context.textTheme.headlineLarge;
final primaryColor = context.colorScheme.primary;

// Focus
context.unfocus(); // Đóng keyboard
context.requestFocus(focusNode);

// Localization
final locale = context.locale;
final langCode = context.languageCode;
```

#### Enum Extensions

Các tiện ích cho Enum:

```dart
import 'package:core/core.dart';

enum UserRole { admin, customer, guest }

final role = UserRole.admin;

// Lấy tên enum
print(role.name); // "admin"
print(role.fullName); // "UserRole.admin"

// Format
print(role.displayName); // "Admin"
print(role.camelCase); // "admin"
print(role.snakeCase); // "admin"
print(role.kebabCase); // "admin"

// So sánh
if (role.isEqual('admin')) {
  // ...
}

// Tìm enum từ string
final roles = [UserRole.admin, UserRole.customer];
final found = roles.findByName('admin'); // UserRole.admin
final fromString = 'admin'.toEnum(roles); // UserRole.admin
```

## Cấu trúc thư mục

-   `lib/common`: Các tiện ích chung (file picker, device info).
-   `lib/connectivity`: Logic kiểm tra kết nối mạng.
-   `lib/constants`: Các file chứa hằng số.
-   `lib/firebase`: Các service tương tác với Firebase.
-   `lib/routes`: Định nghĩa routes cho API và app navigation.
-   `lib/extensions`: extensions chung của dự án.
-   `lib/share.dart`: File export chính của package.
