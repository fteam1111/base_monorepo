# Local Storage Package

Package quản lý local storage cho Flutter app, cung cấp các utilities để lưu trữ dữ liệu local như tokens, theme preferences, và locale settings.

## Cấu trúc

```
lib/
├── local_storage.dart          # Barrel export - import tất cả từ đây
└── storage/
    ├── locale_storage.dart     # Quản lý locale preferences
    ├── theme_storage.dart      # Quản lý theme preferences
    └── token_storage.dart      # Quản lý authentication tokens
```

## Installation

Package này là một phần của monorepo và được quản lý bởi Melos. Để sử dụng:

```yaml
dependencies:
  local_storage:
    path: ../../packages/local_storage
```

## Features

### 1. Token Storage

Quản lý authentication tokens với 2 implementations:

#### SecureTokenStorage (Production)
- Sử dụng `FlutterSecureStorage` để mã hóa tokens
- An toàn và persistent
- Mã hóa trên thiết bị

#### MemoryTokenStorage (Testing/Development)
- Lưu tokens trong memory
- Tự động clean khi app restart
- Dùng cho unit tests và development

```dart
import 'package:local_storage/local_storage.dart';

// Production: Sử dụng SecureTokenStorage
final tokenStorage = SecureTokenStorage();

// Hoặc dùng factory constructor (mặc định là SecureTokenStorage)
final tokenStorage = TokenStorage();

// Lưu tokens
await tokenStorage.saveAccessToken('your_access_token');
await tokenStorage.saveRefreshToken('your_refresh_token');

// Lấy tokens
final accessToken = await tokenStorage.getAccessToken();
final refreshToken = await tokenStorage.getRefreshToken();

// Kiểm tra authentication
final isAuth = await tokenStorage.isAuthenticated();

// Xóa tokens
await tokenStorage.clearTokens();

// Development/Testing: Sử dụng MemoryTokenStorage
final memoryStorage = MemoryTokenStorage();
```

### 2. Theme Storage

Quản lý theme mode preferences của app:

```dart
import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

// Khởi tạo
final prefs = await SharedPreferences.getInstance();
final themeStorage = ThemeStorage(prefs);

// Lưu theme mode
await themeStorage.saveThemeMode(ThemeMode.dark);
await themeStorage.saveThemeMode(ThemeMode.light);
await themeStorage.saveThemeMode(ThemeMode.system);

// Lấy theme mode đã lưu
final savedTheme = await themeStorage.getSavedThemeMode();
if (savedTheme != null) {
  // Sử dụng savedTheme
} else {
  // Sử dụng theme mặc định của hệ thống
}

// Kiểm tra có theme đã lưu không
if (themeStorage.hasThemeMode()) {
  // Có theme đã lưu
}

// Xóa theme đã lưu
await themeStorage.clearThemeMode();
```

### 3. Locale Storage

Quản lý locale preferences của app:

```dart
import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Khởi tạo
final prefs = await SharedPreferences.getInstance();
final localeStorage = LocaleStorage(prefs);

// Lưu locale
await localeStorage.saveLocale('vi', 'VN'); // Tiếng Việt - Việt Nam
await localeStorage.saveLocale('en', null);  // Tiếng Anh

// Lấy locale đã lưu
final savedLocale = await localeStorage.getSavedLocale();
if (savedLocale != null) {
  final languageCode = savedLocale['languageCode']; // 'vi'
  final countryCode = savedLocale['countryCode'];   // 'VN' hoặc null
  
  final locale = Locale(
    languageCode!,
    countryCode,
  );
}

// Kiểm tra có locale đã lưu không
if (localeStorage.hasLocale()) {
  // Có locale đã lưu
}

// Xóa locale đã lưu
await localeStorage.clearLocale();
```

## Usage Examples

### Example 1: Setup Token Storage trong App

```dart
import 'package:local_storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  static TokenStorage getTokenStorage() {
    // Development: Dùng memory storage để dễ test
    if (kDebugMode) {
      return MemoryTokenStorage();
    }
    
    // Production: Dùng secure storage
    return SecureTokenStorage();
  }
}

// Sử dụng
final tokenStorage = AppConfig.getTokenStorage();
```

### Example 2: Setup Theme Storage với Provider/Riverpod

```dart
import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeService {
  final ThemeStorage _themeStorage;
  
  ThemeService(this._themeStorage);
  
  Future<void> setTheme(ThemeMode mode) async {
    await _themeStorage.saveThemeMode(mode);
  }
  
  Future<ThemeMode> getTheme() async {
    final saved = await _themeStorage.getSavedThemeMode();
    return saved ?? ThemeMode.system;
  }
}

// Khởi tạo
final prefs = await SharedPreferences.getInstance();
final themeStorage = ThemeStorage(prefs);
final themeService = ThemeService(themeStorage);
```

### Example 3: Setup Locale Storage

```dart
import 'package:local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LocaleService {
  final LocaleStorage _localeStorage;
  
  LocaleService(this._localeStorage);
  
  Future<void> setLocale(String languageCode, String? countryCode) async {
    await _localeStorage.saveLocale(languageCode, countryCode);
  }
  
  Future<Locale?> getLocale() async {
    final saved = await _localeStorage.getSavedLocale();
    if (saved == null) return null;
    
    return Locale(
      saved['languageCode']!,
      saved['countryCode'],
    );
  }
}

// Khởi tạo
final prefs = await SharedPreferences.getInstance();
final localeStorage = LocaleStorage(prefs);
final localeService = LocaleService(localeStorage);
```

### Example 4: Sử dụng trong Authentication Flow

```dart
import 'package:local_storage/local_storage.dart';

class AuthRepository {
  final TokenStorage _tokenStorage;
  
  AuthRepository(this._tokenStorage);
  
  Future<void> login(String email, String password) async {
    // Call API
    final response = await api.login(email, password);
    
    // Lưu tokens
    await _tokenStorage.saveAccessToken(response.accessToken);
    await _tokenStorage.saveRefreshToken(response.refreshToken);
  }
  
  Future<void> logout() async {
    // Xóa tokens
    await _tokenStorage.clearTokens();
  }
  
  Future<bool> isAuthenticated() async {
    return await _tokenStorage.isAuthenticated();
  }
  
  Future<String?> getAccessToken() async {
    return await _tokenStorage.getAccessToken();
  }
}
```

### Example 5: Testing với MemoryTokenStorage

```dart
import 'package:local_storage/local_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TokenStorage Tests', () {
    late TokenStorage tokenStorage;
    
    setUp(() {
      // Mỗi test dùng instance mới, tự động clean
      tokenStorage = MemoryTokenStorage();
    });
    
    test('should save and retrieve access token', () async {
      await tokenStorage.saveAccessToken('test_token');
      final token = await tokenStorage.getAccessToken();
      
      expect(token, equals('test_token'));
    });
    
    test('should return null when token not saved', () async {
      final token = await tokenStorage.getAccessToken();
      expect(token, isNull);
    });
    
    test('should clear all tokens', () async {
      await tokenStorage.saveAccessToken('token1');
      await tokenStorage.saveRefreshToken('token2');
      
      await tokenStorage.clearTokens();
      
      expect(await tokenStorage.getAccessToken(), isNull);
      expect(await tokenStorage.getRefreshToken(), isNull);
    });
    
    test('should check authentication status', () async {
      expect(await tokenStorage.isAuthenticated(), isFalse);
      
      await tokenStorage.saveAccessToken('token');
      expect(await tokenStorage.isAuthenticated(), isTrue);
    });
  });
}
```

## Dependencies

### Runtime Dependencies

- `shared_preferences: ^2.5.3` - SharedPreferences storage
- `flutter_secure_storage: ^9.2.4` - Secure encrypted storage
- `sqflite: ^2.4.2` - SQLite database (for future use)
- `core` - Core package với error handling và utilities

### Dev Dependencies

- `flutter_test` - Testing framework
- `flutter_lints: ^5.0.0` - Linting rules

## Import

### Import tất cả từ barrel export

```dart
import 'package:local_storage/local_storage.dart';

// Bây giờ bạn có thể sử dụng:
// - TokenStorage, SecureTokenStorage, MemoryTokenStorage
// - ThemeStorage
// - LocaleStorage
```

### Import từng module riêng lẻ (nếu cần)

```dart
import 'package:local_storage/storage/token_storage.dart';
import 'package:local_storage/storage/theme_storage.dart';
import 'package:local_storage/storage/locale_storage.dart';
```

## Best Practices

### 1. Token Storage

- **Production**: Luôn dùng `SecureTokenStorage` để đảm bảo tokens được mã hóa
- **Testing**: Dùng `MemoryTokenStorage` để test nhanh và không cần setup
- **Development**: Có thể dùng `MemoryTokenStorage` để dễ debug và reset

### 2. Theme Storage

- Luôn check `hasThemeMode()` trước khi lấy theme
- Nếu không có theme đã lưu, sử dụng `ThemeMode.system` làm mặc định
- Clear theme khi user muốn reset về system default

### 3. Locale Storage

- Luôn check `hasLocale()` trước khi lấy locale
- Nếu không có locale đã lưu, sử dụng system locale
- Format locale string: `languageCode_countryCode` (ví dụ: `vi_VN`, `en_US`)

## Tích hợp DI cho từng app

Vì đây là package **dùng chung**, phần DI (GetIt / injectable) nên được cấu hình **ở từng app** (ví dụ: `customer_app`, `admin_app`), không cấu hình sẵn trong package. 
Quy trình tổng quát:

1. **Thêm dependency vào app** (ví dụ: `apps/customer_app/pubspec.yaml`):

```yaml
dependencies:
  local_storage:
    path: ../../packages/local_storage

  get_it: ^8.2.0
  injectable: ^2.3.2

dev_dependencies:
  build_runner: ^2.9.0
  injectable_generator: ^2.4.2
```

2. **Tạo file DI cho app** (ví dụ: `apps/customer_app/lib/di/injector.dart`):

```dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:customer_app/di/injector.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => locator.init();
```

3. **Khai báo binding cho `TokenStorage` trong app module**  
Có 2 cách chính:

### Cách 1: Đăng ký thủ công (không cần annotation)

```dart
// apps/customer_app/lib/di/app_module.dart
import 'package:get_it/get_it.dart';
import 'package:local_storage/local_storage.dart';

void registerLocalStorageModule(GetIt locator) {
  // Production: SecureTokenStorage
  locator.registerLazySingleton<TokenStorage>(() => SecureTokenStorage());

  // Hoặc trong debug có thể dùng MemoryTokenStorage
  // locator.registerLazySingleton<TokenStorage>(() => MemoryTokenStorage());
}
```

```dart
// apps/customer_app/lib/di/injector.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:customer_app/di/injector.config.dart';
import 'package:customer_app/di/app_module.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Các binding generate bởi injectable
  locator.init();

  // Các binding thủ công cho local_storage
  registerLocalStorageModule(locator);
}
```

### Cách 2: Dùng `@module` + injectable (nếu muốn generate)

```dart
// apps/customer_app/lib/di/local_storage_module.dart
import 'package:injectable/injectable.dart';
import 'package:local_storage/local_storage.dart';

@module
abstract class LocalStorageModule {
  @lazySingleton
  TokenStorage tokenStorage() => SecureTokenStorage();

  // Có thể thêm MemoryTokenStorage cho debug nếu cần
  // @dev
  // @lazySingleton
  // TokenStorage devTokenStorage() => MemoryTokenStorage();
}
```

Injectable sẽ generate binding vào `injector.config.dart` của **app đó**, không động chạm gì đến package `local_storage`.

4. **Gọi DI trong `main()` của app**:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(); // register TokenStorage, ThemeStorage, LocaleStorage service, v.v.

  runApp(const MyApp());
}
```

### Lý do nên DI ở app thay vì trong package

- Mỗi app (`customer_app`, `admin_app`, ... ) có thể:
  - Dùng implementation khác nhau (`SecureTokenStorage` vs `MemoryTokenStorage`)
  - Dùng DI framework khác nhau (GetIt, Riverpod, Provider, v.v.)
- Package `local_storage` chỉ tập trung **logic lưu trữ**, không bị khóa cứng vào 1 cách cấu hình DI cụ thể
- Dễ test: trong test có thể inject `MemoryTokenStorage` / mock vào app layer mà không cần sửa package

## Testing

```bash
# Chạy tests
flutter test

# Với coverage
flutter test --coverage
```

## Contributing

Khi thêm tính năng mới vào package `local_storage`:

1. Đảm bảo tính năng có tính **generic** và **reusable**
2. Thêm ví dụ sử dụng vào doc comments
3. Export trong `local_storage.dart` nếu là public API
4. Thêm tests cho tính năng mới
5. Cập nhật README này

## License

