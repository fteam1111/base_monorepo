# Core Package

Package core chứa các utilities, extensions, error handling và value objects cơ bản được sử dụng xuyên suốt trong toàn bộ monorepo.

## Cấu trúc

```
lib/
├── core.dart                    # Barrel export - import tất cả từ đây
├── error/                       # Error handling & failures
│   ├── api_failures.dart       # API failures (Freezed)
│   ├── failures.dart           # Value failures (Freezed)
│   ├── error_mapper.dart       # Map DioException → ApiFailure
│   ├── errors.dart             # UnexpectedValueError
│   ├── exception.dart          # Base exceptions
│   ├── failure_handler.dart    # Failure handler utilities
│   └── tr_object.dart          # Translation object
├── extensions/                  # Dart extensions
│   ├── context_ext.dart        # BuildContext extensions
│   └── enum_ext.dart           # Enum extensions
├── utils/                       # Utility classes
│   ├── debounce.dart           # Debounce utility
│   ├── throttle.dart           # Throttle utility
│   ├── logger.dart             # Global logger instance
│   └── measure_widget.dart     # Measure widget size
└── value/                       # Value objects & validators
    ├── constants.dart          # App constants
    ├── value_objects.dart      # Value object base classes
    ├── value_transformers.dart # Value transformers
    └── value_validators.dart   # Value validators
```

## Installation

Package này là một phần của monorepo và được quản lý bởi Melos. Để sử dụng:

```yaml
dependencies:
  core:
    path: ../../packages/core
```

## 📚 Features

### 1. Error Handling

#### ApiFailure
Xử lý các lỗi từ API với Freezed:

```dart
import 'package:core/core.dart';

// Sử dụng ApiFailure
final failure = const ApiFailure.userNotFound();
final serverError = ApiFailure.serverError('Internal server error');
final noInternet = const ApiFailure.noInternet();

// Map từ DioException
try {
  await dio.get('/api/users');
} on DioException catch (e) {
  final apiFailure = e.toApiFailure();
  // Xử lý apiFailure
}
```

#### ValueFailure
Xử lý validation errors cho value objects:

```dart
import 'package:core/core.dart';

// Sử dụng ValueFailure
final failure = ValueFailure.exceedingLength(
  failedValue: 'very long string',
  max: 10,
);

final emailFailure = ValueFailure.invalidEmail(
  failedValue: 'invalid-email',
);
```

#### ErrorMapper
Chuyển đổi server errors thành ApiFailure:

```dart
import 'package:core/core.dart';

final apiFailure = ErrorMapper.mapServerError(
  responseData,
  statusCode,
);
```

### 2. Extensions

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

### 3. Utils

#### Debounce

Trì hoãn việc thực thi hàm cho đến khi không có thao tác nào trong khoảng thời gian delay:

```dart
import 'package:core/core.dart';

final debounce = Debounce(delay: Duration(milliseconds: 500));

// Trong TextField onChanged
TextField(
  onChanged: (value) {
    debounce(() {
      // Chỉ gọi API sau khi user ngừng gõ 500ms
      searchProducts(value);
    });
  },
)

// Nhớ dispose
@override
void dispose() {
  debounce.dispose();
  super.dispose();
}
```

#### Throttle

Giới hạn số lần gọi hàm trong một khoảng thời gian:

```dart
import 'package:core/core.dart';

final throttle = Throttle(duration: Duration(milliseconds: 1000));

// Trong scroll listener
ScrollController(
  onScroll: () {
    throttle.run(() {
      // Chỉ gọi tối đa 1 lần mỗi giây
      loadMoreData();
    });
  },
)

// Nhớ dispose
@override
void dispose() {
  throttle.dispose();
  super.dispose();
}
```

#### Logger

Global logger instance với cấu hình sẵn:

```dart
import 'package:core/core.dart';

// Các level log
logger.t('Trace message');
logger.d('Debug message');
logger.i('Info message');
logger.w('Warning message');
logger.e('Error message', error: exception, stackTrace: stackTrace);
logger.f('Fatal message');

// Log trong try-catch
try {
  // Some code
} catch (e, stackTrace) {
  logger.e('Error occurred', error: e, stackTrace: stackTrace);
}
```

**Lưu ý**: Logger tự động tắt trong release mode để tối ưu performance.

#### Measure Widget

Đo kích thước của widget mà không cần render trên màn hình:

```dart
import 'package:core/core.dart';

final textWidget = Text(
  'Hello World',
  style: TextStyle(fontSize: 16),
);
final size = measureWidget(textWidget);
print('Width: ${size.width}, Height: ${size.height}');

// Sử dụng để tính toán layout động
final widgetSize = measureWidget(
  Row(
    children: [
      Icon(Icons.home),
      Text('Home'),
    ],
  ),
);
if (widgetSize.width > screenWidth) {
  // Hiển thị icon only
}
```

### 4. Value Objects

Value objects với validation sử dụng Either từ dartz:

```dart
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

// Sử dụng ValueObject
class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

// Sử dụng
final email = EmailAddress('user@example.com');
email.value.fold(
  (failure) => print('Invalid email: ${failure.toString()}'),
  (email) => print('Valid email: $email'),
);

// Lấy giá trị hoặc throw exception
try {
  final emailValue = email.getOrCrash();
} on UnexpectedValueError catch (e) {
  // Handle error
}
```

## 🔧 Dependencies

### Runtime Dependencies

- `dartz: ^0.10.0` - Functional programming (Either, Option)
- `json_annotation: ^4.9.0` - JSON serialization annotations
- `equatable: ^2.0.7` - Value equality
- `freezed_annotation: ^3.1.0` - Code generation annotations
- `dio: ^5.9.0` - HTTP client
- `logger: ^2.6.2` - Logging utility
- `intl: ^0.20.2` - Internationalization

### Dev Dependencies

- `json_serializable: ^6.11.1` - JSON serialization code generator
- `build_runner: ^2.9.0` - Code generation runner
- `freezed: ^3.2.3` - Code generation for unions/pattern matching

## 📖 Usage

### Import tất cả từ barrel export

```dart
import 'package:core/core.dart';

// Bây giờ bạn có thể sử dụng tất cả:
// - Error handling (ApiFailure, ValueFailure, ErrorMapper)
// - Extensions (ContextExtension, EnumExtension)
// - Utils (Debounce, Throttle, logger, measureWidget)
// - Value objects (ValueObject, validators)
```

### Import từng module riêng lẻ (nếu cần)

```dart
import 'package:core/error/api_failures.dart';
import 'package:core/extensions/context_ext.dart';
import 'package:core/utils/logger.dart';
```

## 🧪 Testing

```bash
# Chạy tests
flutter test

# Với coverage
flutter test --coverage
```

## 📝 Code Generation

Nếu bạn thay đổi các file Freezed, chạy:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Hoặc watch mode:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 🤝 Contributing

Khi thêm tính năng mới vào package `core`:

1. Đảm bảo tính năng có tính **generic** và **reusable**
2. Thêm ví dụ sử dụng vào doc comments
3. Export trong `core.dart` nếu là public API
4. Cập nhật README này

