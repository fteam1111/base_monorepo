import 'package:flutter/material.dart';
import 'package:design_system/theme/tokens/colors.dart';

/// Theme extension for custom colors
/// Access via: Theme.of(context).extension`<AppColorsExtension>`()
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // Nền ứng dụng (nền của scaffold/page)
  final Color background;

  // Trạng thái thành công (ví dụ: text/icon thành công, badge)
  final Color success;
  // Nền trạng thái thành công nhẹ (ví dụ: nền chip/banner thành công)
  final Color successContainer;
  // Màu chữ/icon trên nền success
  final Color onSuccess;
  // Màu chữ/icon trên nền successContainer
  final Color onSuccessContainer;

  // Trạng thái cảnh báo (ví dụ: text/icon cảnh báo, badge)
  final Color warning;
  // Nền trạng thái cảnh báo nhẹ (ví dụ: nền chip/banner cảnh báo)
  final Color warningContainer;
  // Màu chữ/icon trên nền warning
  final Color onWarning;
  // Màu chữ/icon trên nền warningContainer
  final Color onWarningContainer;

  // Trạng thái thông tin (ví dụ: text/icon thông tin)
  final Color info;
  // Nền trạng thái thông tin nhẹ (ví dụ: nền chip/banner thông tin)
  final Color infoContainer;
  // Màu chữ/icon trên nền info
  final Color onInfo;
  // Màu chữ/icon trên nền infoContainer
  final Color onInfoContainer;

  // Màu trung tính để nhấn mạnh text/icon
  final Color neutral;
  // Các bề mặt trung tính phụ trợ
  final Color neutralVariant;

  // Nền của Card
  final Color cardBackground;
  // Nền của Dialog
  final Color dialogBackground;
  // Nền của Bottom Sheet
  final Color bottomSheetBackground;

  // Màu của Divider (đường kẻ phân cách)
  final Color divider;
  // Màu của viền/border (input, card)
  final Color border;

  const AppColorsExtension({
    required this.background,
    required this.success,
    required this.successContainer,
    required this.onSuccess,
    required this.onSuccessContainer,
    required this.warning,
    required this.warningContainer,
    required this.onWarning,
    required this.onWarningContainer,
    required this.info,
    required this.infoContainer,
    required this.onInfo,
    required this.onInfoContainer,
    required this.neutral,
    required this.neutralVariant,
    required this.cardBackground,
    required this.dialogBackground,
    required this.bottomSheetBackground,
    required this.divider,
    required this.border,
  });

  /// Light theme colors
  static AppColorsExtension light() {
    return const AppColorsExtension(
      background: AppColors.backgroundLight,
      success: AppColors.successLight,
      successContainer: AppColors.successContainerLight,
      onSuccess: AppColors.onPrimaryLight,
      onSuccessContainer: AppColors.onBackgroundLight,
      warning: AppColors.warningLight,
      warningContainer: AppColors.warningContainerLight,
      onWarning: AppColors.onPrimaryLight,
      onWarningContainer: AppColors.onBackgroundLight,
      info: AppColors.infoLight,
      infoContainer: AppColors.infoContainerLight,
      onInfo: AppColors.onPrimaryLight,
      onInfoContainer: AppColors.onBackgroundLight,
      neutral: AppColors.neutral50,
      neutralVariant: AppColors.neutral90,
      cardBackground: AppColors.cardLight,
      dialogBackground: AppColors.surfaceLight,
      bottomSheetBackground: AppColors.surfaceLight,
      divider: AppColors.outlineVariantLight,
      border: AppColors.outlineLight,
    );
  }

  /// Dark theme colors
  static AppColorsExtension dark() {
    return const AppColorsExtension(
      background: AppColors.backgroundDark,
      success: AppColors.successDark,
      successContainer: AppColors.successContainerDark,
      onSuccess: AppColors.onPrimaryDark,
      onSuccessContainer: AppColors.onBackgroundDark,
      warning: AppColors.warningDark,
      warningContainer: AppColors.warningContainerDark,
      onWarning: AppColors.onPrimaryDark,
      onWarningContainer: AppColors.onBackgroundDark,
      info: AppColors.infoDark,
      infoContainer: AppColors.infoContainerDark,
      onInfo: AppColors.onPrimaryDark,
      onInfoContainer: AppColors.onBackgroundDark,
      neutral: AppColors.neutral50,
      neutralVariant: AppColors.neutral20,
      cardBackground: AppColors.cardDark,
      dialogBackground: AppColors.surfaceDark,
      bottomSheetBackground: AppColors.surfaceDark,
      divider: AppColors.outlineVariantDark,
      border: AppColors.outlineDark,
    );
  }

  @override
  AppColorsExtension copyWith({
    Color? background,
    Color? success,
    Color? successContainer,
    Color? onSuccess,
    Color? onSuccessContainer,
    Color? warning,
    Color? warningContainer,
    Color? onWarning,
    Color? onWarningContainer,
    Color? info,
    Color? infoContainer,
    Color? onInfo,
    Color? onInfoContainer,
    Color? neutral,
    Color? neutralVariant,
    Color? cardBackground,
    Color? dialogBackground,
    Color? bottomSheetBackground,
    Color? divider,
    Color? border,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      onSuccess: onSuccess ?? this.onSuccess,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarning: onWarning ?? this.onWarning,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfo: onInfo ?? this.onInfo,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      neutral: neutral ?? this.neutral,
      neutralVariant: neutralVariant ?? this.neutralVariant,
      cardBackground: cardBackground ?? this.cardBackground,
      dialogBackground: dialogBackground ?? this.dialogBackground,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
      divider: divider ?? this.divider,
      border: border ?? this.border,
    );
  }

  @override
  AppColorsExtension lerp(AppColorsExtension? other, double t) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(
        successContainer,
        other.successContainer,
        t,
      )!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      onSuccessContainer: Color.lerp(
        onSuccessContainer,
        other.onSuccessContainer,
        t,
      )!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(
        warningContainer,
        other.warningContainer,
        t,
      )!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      onWarningContainer: Color.lerp(
        onWarningContainer,
        other.onWarningContainer,
        t,
      )!,
      info: Color.lerp(info, other.info, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      neutralVariant: Color.lerp(neutralVariant, other.neutralVariant, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      dialogBackground: Color.lerp(
        dialogBackground,
        other.dialogBackground,
        t,
      )!,
      bottomSheetBackground: Color.lerp(
        bottomSheetBackground,
        other.bottomSheetBackground,
        t,
      )!,
      divider: Color.lerp(divider, other.divider, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
