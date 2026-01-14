# Hệ thống thiết kế (Design System)

Package design system cho Flutter trong monorepo này, cung cấp theme, design token và cấu hình giao diện theo Material 3.

## Tính năng

- **Theme**: `ThemeData` cấu hình sẵn cho cả chế độ sáng (light) và tối (dark)
- **Quản lý theme**: `ThemeCubit` để quản lý `ThemeMode` và lưu lựa chọn theme
- **Design token**: typography, màu sắc, khoảng cách (spacing), bo góc (radius)
- **Theme extension**: truy cập token nhanh qua `Theme.of(context).extension<...>()`
- **Cấu hình component**: các Material component đã được style sẵn (Material 3)

## Cài đặt

Thêm vào `pubspec.yaml` của app:

```yaml
dependencies:
  design_system:
    path: ../packages/design_system
```

Sau đó import:

```dart
import 'package:design_system/design_system.dart';
```

## Sử dụng

### 1. Cung cấp `ThemeCubit`

Bọc app bằng `BlocProvider` để quản lý trạng thái theme:

```dart
import 'package:design_system/design_system.dart';
import 'package:local_storage/local_storage.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(ThemeStorage()),
      child: const MyApp(),
    ),
  );
}
```

### 2. Áp dụng theme trong `MaterialApp`

```dart
MaterialApp(
  theme: AppLightTheme.theme,
  darkTheme: AppDarkTheme.theme,
  themeMode: context.select((ThemeCubit cubit) => cubit.state),
  home: const HomePage(),
);
```

### 3. Truy cập token qua theme extensions

```dart
final colors = Theme.of(context).extension<AppColorsExtension>()!;
final spacing = Theme.of(context).extension<AppSpacingExtension>()!;
final typography = Theme.of(context).extension<AppTypographyExtension>()!;
final radius = Theme.of(context).extension<AppRadiusExtension>()!;

Container(
  margin: EdgeInsets.all(spacing.md),
  padding: EdgeInsets.symmetric(horizontal: spacing.lg, vertical: spacing.sm),
  decoration: BoxDecoration(
    color: colors.primary,
    borderRadius: BorderRadius.circular(radius.md),
  ),
  child: Text(
    'Hello Design System',
    style: typography.headlineSmall.copyWith(color: colors.onPrimary),
  ),
);
```

### 4. Chuyển đổi theme

```dart
// Đổi giữa light/dark
context.read<ThemeCubit>().toggleTheme();

// Hoặc đặt chế độ cụ thể
context.read<ThemeCubit>().setLightMode();
context.read<ThemeCubit>().setDarkMode();
context.read<ThemeCubit>().setSystemMode();

// Kiểm tra chế độ hiện tại
final isDarkMode = context.read<ThemeCubit>().isDarkMode;
```

## Design token có sẵn

### Màu sắc

```dart
// Truy cập tĩnh
final primaryColor = AppColors.primaryLight;

// Truy cập qua theme extension
final colors = Theme.of(context).extension<AppColorsExtension>()!;
final primary = colors.primary;
final onPrimary = colors.onPrimary;
```

### Typography (kiểu chữ)

```dart
final typography = Theme.of(context).extension<AppTypographyExtension>()!;

Text('Title', style: typography.headlineLarge);
Text('Subtitle', style: typography.titleMedium);
Text('Body text', style: typography.bodyLarge);
```

### Spacing (khoảng cách)

```dart
final spacing = Theme.of(context).extension<AppSpacingExtension>()!;

SizedBox(height: spacing.md);
EdgeInsets.all(spacing.lg);
```

### Radius (bo góc)

```dart
final radius = Theme.of(context).extension<AppRadiusExtension>()!;

BorderRadius.circular(radius.md);
RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.sm));
```

## Ghi chú

- `design_system` phụ thuộc vào `local_storage` để lưu lựa chọn theme.
- Nên import qua `package:design_system/design_system.dart` để dùng public API.
