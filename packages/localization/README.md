# Localization Package

Package `localization` cung cấp hạ tầng localization đầy đủ cho Flutter app trong monorepo, được xây trên:

- `flutter_localizations` + `intl`
- DDD (domain entities, repositories, usecases)
- `flutter_bloc` để quản lý state ngôn ngữ
- `local_storage` để lưu locale vào `SharedPreferences`

## Tính năng

- **Quản lý locale theo DDD**
  - `AppLocale` entity (mã ngôn ngữ, country code, display name)
  - Repository interface + implementation (`LocaleRepository`, `LocaleRepositoryImpl`)
- **Bloc Localization**
  - `LocalizationBloc`, `LocalizationEvent`, `LocalizationState`
  - Load locale đã lưu khi khởi động app
  - Đổi ngôn ngữ runtime, emit state tương ứng
  - Reset về system locale
- **Lưu locale bền vững**
  - Dùng `LocaleStorage` từ package `local_storage`
  - Lưu `languageCode_countryCode` vào `SharedPreferences`
- **Generated localizations**
  - `lib/generated/app_localizations.dart` + các file `app_xx.arb`
  - Hỗ trợ sẵn: English (`en`), Bengali (`bn`), Spanish (`es`)

## Cài đặt

Trong `pubspec.yaml` của app (ví dụ `customer_app`), đảm bảo đã thêm:

```yaml
dependencies:
  localization:
    path: ../../packages/localization

  flutter_localizations:
    sdk: flutter
  intl: any
```

Và bật generate localizations trong app nếu chưa có:

```yaml
flutter:
  generate: true
```

## Cấu trúc thư mục

```text
lib/
  bloc/
    localization_bloc.dart
    localization_event.dart
    localization_state.dart
  domain/
    entities/
      app_locale.dart
    repositories/
      locale_repository.dart
    usecases/
      get_saved_locale.dart
      save_locale.dart
  generated/
    app_localizations.dart
    app_localizations_en.dart
    app_localizations_bn.dart
    app_localizations_es.dart
  l10n/
    app_en.arb
    app_bn.arb
    app_es.arb
  repositories/
    locale_repository_impl.dart
  localization.dart
```

## Sử dụng

### 1. Cấu hình `MaterialApp`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc(
        getSavedLocaleUseCase: /* inject usecase */,
        saveLocaleUseCase: /* inject usecase */,
      )..add(LoadSavedLocaleEvent()),
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          Locale locale = AppLocale.english.toLocale();

          if (state is LocalizationLoaded) {
            locale = state.locale.toLocale();
          }

          return MaterialApp(
            locale: locale,
            supportedLocales: AppLocale.supportedFlutterLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // ...
          );
        },
      ),
    );
  }
}
```

### 2. Đổi ngôn ngữ

```dart
// Ví dụ đổi sang tiếng Việt (nếu đã thêm vào AppLocale)
context.read<LocalizationBloc>().add(
  ChangeLocaleEvent(AppLocale.spanish),
);
```

### 3. Sử dụng `AppLocalizations` trong UI

```dart
import 'package:localization/generated/app_localizations.dart';

@override
Widget build(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;

  return Text(l10n.helloWorld); // key trong app_xx.arb
}
```

## DDD & Layers

- **Domain layer**
  - `AppLocale`: entity biểu diễn một locale
  - `LocaleRepository`: contract cho việc lưu/đọc locale
  - Usecases: `GetSavedLocaleUseCase`, `SaveLocaleUseCase`
- **Data layer**
  - `LocaleRepositoryImpl`: implement `LocaleRepository` bằng `LocaleStorage`
  - Mapping từ dữ liệu thô (`SharedPreferences`) sang `AppLocale`
- **Presentation layer**
  - `LocalizationBloc`: chịu trách nhiệm load, thay đổi, reset locale
  - Các `LocalizationEvent` / `LocalizationState` mô tả luồng dữ liệu

## Lưu ý

- Khi thêm ngôn ngữ mới:
  1. Tạo file `app_xx.arb` trong `lib/l10n/`
  2. Chạy `flutter gen-l10n` hoặc `flutter pub get` để generate lại
  3. Thêm `AppLocale` tương ứng trong `app_locale.dart`
- Đảm bảo `local_storage` đã được khởi tạo `SharedPreferences` trước khi dùng `LocaleStorage`.

## Đóng góp

- Các phần có thể mở rộng:
  - Tự động detect system locale thay vì mặc định English
  - Thêm nhiều ngôn ngữ hơn
  - Hỗ trợ thay đổi locale theo region (ví dụ `en_US`, `en_GB`)
