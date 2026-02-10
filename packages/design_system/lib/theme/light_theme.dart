import 'package:design_system/theme/theme_extensions/app_colors.dart';
import 'package:design_system/theme/theme_extensions/app_radius.dart';
import 'package:design_system/theme/theme_extensions/app_spacing.dart';
import 'package:design_system/theme/theme_extensions/app_typography.dart';
import 'package:design_system/theme/tokens/colors.dart';
import 'package:design_system/theme/tokens/radius.dart';
import 'package:design_system/theme/tokens/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Light theme configuration
class AppLightTheme {
  static ThemeData get theme {
    final colorScheme = const ColorScheme.light(
      // Màu brand chính (CTA chính, trạng thái selected)
      primary: AppColors.primaryLight,
      // Màu chữ/icon trên nền `primary`
      onPrimary: AppColors.onPrimaryLight,
      // Nền nhấn nhẹ theo primary (chip, highlight nhẹ)
      primaryContainer: AppColors.primaryContainerLight,
      // Màu chữ/icon trên nền `primaryContainer`
      onPrimaryContainer: AppColors.onBackgroundLight,
      // Màu nhấn phụ (CTA phụ, trạng thái phụ)
      secondary: AppColors.secondaryLight,
      // Màu chữ/icon trên nền `secondary`
      onSecondary: AppColors.onSecondaryLight,
      // Nền nhấn theo secondary (selected chip, highlight)
      secondaryContainer: AppColors.primaryLight,
      // Màu chữ/icon trên nền `secondaryContainer`
      onSecondaryContainer: AppColors.primaryDark,
      // Màu nhấn thứ ba (ít dùng/tuỳ màn)
      tertiary: AppColors.tertiaryLight,
      // Màu chữ/icon trên nền `tertiary`
      onTertiary: AppColors.onPrimaryLight,
      // Nền nhấn nhẹ theo tertiary
      tertiaryContainer: AppColors.tertiaryContainerLight,
      // Màu chữ/icon trên nền `tertiaryContainer`
      onTertiaryContainer: AppColors.onBackgroundLight,
      // Trạng thái lỗi/nguy hiểm (error text, destructive action)
      error: AppColors.errorLight,
      // Màu chữ/icon trên nền `error`
      onError: AppColors.onErrorLight,
      // Nền lỗi nhẹ (banner/thông báo lỗi)
      errorContainer: AppColors.errorContainerLight,
      // Màu chữ/icon trên nền `errorContainer`
      onErrorContainer: AppColors.onBackgroundLight,
      // Nền bề mặt mặc định (scaffold, card)
      surface: AppColors.surfaceLight,
      // Màu chữ/icon trên nền `surface`
      onSurface: AppColors.onSurfaceLight,
      // Nền bề mặt biến thể/elevated (input, container)
      surfaceContainerHighest: AppColors.surfaceVariantLight,
      // Màu chữ/icon trên nền `surfaceVariant`
      onSurfaceVariant: AppColors.onSurfaceLight,
      // Viền/border chính (input, card)
      outline: AppColors.outlineLight,
      // Viền/divider nhẹ
      outlineVariant: AppColors.outlineVariantLight,
      // Màu shadow
      shadow: AppColors.shadowLight,
      // Lớp phủ nền (modal backdrop)
      scrim: AppColors.scrimLight,
      // Nền đảo màu (snackbar, surface tối trên light theme)
      inverseSurface: AppColors.inverseSurfaceLight,
      // Màu chữ/icon trên nền `inverseSurface`
      onInverseSurface: AppColors.onBackgroundDark,
      // Primary khi hiển thị trên nền đảo màu
      inversePrimary: AppColors.inversePrimaryLight,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.light,
      textTheme: AppTypography.createTextTheme(),

      // Extensions
      extensions: [
        AppColorsExtension.light(),
        AppSpacingExtension.standard(),
        AppTypographyExtension.standard(),
        AppRadiusExtension.standard(),
      ],

      // AppBar theme
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surfaceVariantLight,
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: AppTypography.titleLarge.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        color: AppColors.cardLight,
        clipBehavior: Clip.antiAlias,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: AppTypography.button,
        ),
      ),

      // Outlined button theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          side: BorderSide(color: colorScheme.outline),
          textStyle: AppTypography.button,
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: AppTypography.button,
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        errorStyle: AppTypography.error.copyWith(color: colorScheme.error),
      ),

      // Chip theme
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chip),
        ),
        backgroundColor: colorScheme.surfaceContainerHighest,
        selectedColor: colorScheme.secondaryContainer,
        labelStyle: AppTypography.labelSmall,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.dialog),
        ),
        elevation: 8,
        backgroundColor: colorScheme.surface,
      ),

      // Bottom sheet theme
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.bottomSheet),
          ),
        ),
        elevation: 8,
        backgroundColor: colorScheme.surface,
        clipBehavior: Clip.antiAlias,
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.snackbar),
        ),
        backgroundColor: AppColors.neutral20,
        contentTextStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.neutral100,
        ),
      ),

      // Divider theme
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // List tile theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        minLeadingWidth: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.container),
        ),
      ),

      // Icon theme
      iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),

      // Switch theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.outline;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primaryContainer;
          }
          return colorScheme.surfaceContainerHighest;
        }),
      ),

      // Checkbox theme
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Radio theme
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),

      // Navigation bar theme
      navigationBarTheme: NavigationBarThemeData(
        elevation: 3,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondaryContainer,
        labelTextStyle: const WidgetStatePropertyAll(AppTypography.labelSmall),
      ),

      // Tab bar theme
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        labelStyle: AppTypography.titleSmall,
        unselectedLabelStyle: AppTypography.titleSmall,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),

      // Tooltip theme
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.neutral20,
          borderRadius: BorderRadius.circular(AppRadius.tooltip),
        ),
        textStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.neutral100,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // Progress indicator theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        circularTrackColor: colorScheme.surfaceContainerHighest,
      ),

      // Slider theme
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: colorScheme.surfaceContainerHighest,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.12),
      ),
    );
  }
}
