import 'package:design_system/theme/theme_extensions/app_colors.dart';
import 'package:design_system/theme/theme_extensions/app_radius.dart';
import 'package:design_system/theme/theme_extensions/app_spacing.dart';
import 'package:design_system/theme/theme_extensions/app_typography.dart';
import 'package:flutter/material.dart';

/// Extension cho BuildContext để truy cập nhanh các thuộc tính phổ biến
extension ContextExtension on BuildContext {
  // ========== Theme ==========
  /// Nhóm getter liên quan đến Theme và các ThemeExtension của design system.
  ///
  /// Mục tiêu:
  /// - Truy cập nhanh `ThemeData`, `TextTheme`, `ColorScheme`
  /// - Truy cập nhanh các design tokens (spacing/colors/radius/typography)
  ///
  /// Lưu ý:
  /// - Các getter `appSpacing/appColors/appRadius/appTypography` sẽ fallback về
  ///   giá trị mặc định nếu Theme chưa đăng ký extension tương ứng.
  ///
  /// Ví dụ:
  /// ```dart
  /// final spacing = context.appSpacing;
  /// final colors = context.appColors;
  /// final radius = context.appRadius;
  /// final typography = context.appTypography;
  ///
  /// Container(
  ///   padding: EdgeInsets.all(spacing.s16),
  ///   decoration: BoxDecoration(
  ///     color: colors.primary,
  ///     borderRadius: BorderRadius.circular(radius.r12),
  ///   ),
  ///   child: Text('Hello', style: typography.bodyMedium),
  /// );
  /// ```

  AppSpacingExtension get appSpacing =>
      theme.extension<AppSpacingExtension>() ?? AppSpacingExtension.standard();

  AppColorsExtension get appColors =>
      theme.extension<AppColorsExtension>() ?? AppColorsExtension.light();

  AppRadiusExtension get appRadius =>
      theme.extension<AppRadiusExtension>() ?? AppRadiusExtension.standard();

  AppTypographyExtension get appTypography =>
      theme.extension<AppTypographyExtension>() ??
      AppTypographyExtension.standard();

  // ========== Media Query ==========

  /// Chiều rộng màn hình
  ///
  /// Ví dụ:
  /// ```dart
  /// final width = context.screenWidth;
  /// if (width > 600) {
  ///   // Hiển thị layout cho màn hình lớn
  /// }
  /// ```
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Chiều cao màn hình
  ///
  /// Ví dụ:
  /// ```dart
  /// final height = context.screenHeight;
  /// final containerHeight = height * 0.5; // 50% chiều cao màn hình
  /// ```
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Chiều cao status bar
  ///
  /// Ví dụ:
  /// ```dart
  /// final statusBar = context.statusBarHeight;
  /// Padding(
  ///   padding: EdgeInsets.only(top: statusBar),
  ///   child: YourWidget(),
  /// )
  /// ```
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Chiều cao bottom padding (safe area)
  ///
  /// Ví dụ:
  /// ```dart
  /// final bottomPad = context.bottomPadding;
  /// Padding(
  ///   padding: EdgeInsets.only(bottom: bottomPad),
  ///   child: FloatingActionButton(...),
  /// )
  /// ```
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  /// Chiều cao top padding (safe area)
  ///
  /// Ví dụ:
  /// ```dart
  /// final topPad = context.topPadding;
  /// ```
  double get topPadding => MediaQuery.of(this).padding.top;

  /// Tổng padding theo chiều dọc
  ///
  /// Ví dụ:
  /// ```dart
  /// final verticalPad = context.verticalPadding;
  /// ```
  double get verticalPadding =>
      MediaQuery.of(this).padding.top + MediaQuery.of(this).padding.bottom;

  /// Tổng padding theo chiều ngang
  ///
  /// Ví dụ:
  /// ```dart
  /// final horizontalPad = context.horizontalPadding;
  /// ```
  double get horizontalPadding =>
      MediaQuery.of(this).padding.left + MediaQuery.of(this).padding.right;

  /// Kiểm tra keyboard có đang hiển thị không
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isKeyboardVisible) {
  ///   // Keyboard đang mở, điều chỉnh layout
  ///   return SizedBox(height: context.keyboardHeight);
  /// }
  /// ```
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;

  /// Chiều cao keyboard
  ///
  /// Ví dụ:
  /// ```dart
  /// final keyboardH = context.keyboardHeight;
  /// if (keyboardH > 0) {
  ///   // Điều chỉnh padding khi keyboard mở
  /// }
  /// ```
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Kiểm tra có phải màn hình nhỏ không (< 600px)
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isSmallScreen) {
  ///   return MobileLayout();
  /// } else {
  ///   return DesktopLayout();
  /// }
  /// ```
  bool get isSmallScreen => screenWidth < 600;

  /// Kiểm tra có phải màn hình trung bình không (600px - 1024px)
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isMediumScreen) {
  ///   return TabletLayout();
  /// }
  /// ```
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1024;

  /// Kiểm tra có phải màn hình lớn không (>= 1024px)
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isLargeScreen) {
  ///   return DesktopLayout();
  /// }
  /// ```
  bool get isLargeScreen => screenWidth >= 1024;

  /// Kiểm tra orientation - portrait
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isPortrait) {
  ///   return PortraitLayout();
  /// } else {
  ///   return LandscapeLayout();
  /// }
  /// ```
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Kiểm tra orientation - landscape
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.isLandscape) {
  ///   return LandscapeLayout();
  /// }
  /// ```
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  // ========== Theme (Flutter ThemeData) ==========

  /// Theme data
  ///
  /// Ví dụ:
  /// ```dart
  /// final theme = context.theme;
  /// final primaryColor = theme.colorScheme.primary;
  /// ```
  ThemeData get theme => Theme.of(this);

  /// Text theme
  ///
  /// Ví dụ:
  /// ```dart
  /// final textStyle = context.textTheme.headlineLarge;
  /// Text('Hello', style: textStyle);
  /// ```
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Color scheme
  ///
  /// Ví dụ:
  /// ```dart
  /// final primary = context.colorScheme.primary;
  /// final error = context.colorScheme.error;
  /// Container(color: primary);
  /// ```
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Locale hiện tại
  ///
  /// Ví dụ:
  /// ```dart
  /// final locale = context.locale;
  /// print('Current locale: ${locale.languageCode}'); // 'vi' hoặc 'en'
  /// ```
  Locale get locale => Localizations.localeOf(this);

  /// Language code (ví dụ: 'vi', 'en')
  ///
  /// Ví dụ:
  /// ```dart
  /// if (context.languageCode == 'vi') {
  ///   // Hiển thị nội dung tiếng Việt
  /// }
  /// ```
  String get languageCode => locale.languageCode;

  // ========== Focus ==========

  /// Unfocus keyboard
  ///
  /// Ví dụ:
  /// ```dart
  /// // Khi tap vào button, đóng keyboard
  /// ElevatedButton(
  ///   onPressed: () {
  ///     context.unfocus();
  ///     // Xử lý logic
  ///   },
  ///   child: Text('Submit'),
  /// )
  /// ```
  void unfocus() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  /// Request focus
  ///
  /// Ví dụ:
  /// ```dart
  /// final focusNode = FocusNode();
  /// // Focus vào TextField khi mở màn hình
  /// context.requestFocus(focusNode);
  /// ```
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);
}
