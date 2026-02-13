import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// Card widget dùng chung trong Design System.
///
/// Sử dụng design tokens từ [AppRadius], [AppSpacing], [AppColorsExtension]
/// thay vì hardcode giá trị. Hỗ trợ:
/// - Tap callback thông qua [InkWell]
/// - Bo góc dựa trên [borderRadius] (mặc định [AppRadius.card])
/// - Nền & viền lấy từ theme (có thể override)
/// - Shadow / elevation tuỳ chỉnh
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.onTap,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
    this.showBorder = false,
    this.elevation = 4,
    this.clipBehavior = Clip.antiAlias,
  });

  /// Nội dung bên trong card.
  final Widget child;

  /// Callback khi nhấn vào card.
  final VoidCallback? onTap;

  /// Khoảng cách bên ngoài card.
  final EdgeInsets? margin;

  /// Khoảng cách bên trong card. Mặc định [AppSpacing.cardPadding].
  final EdgeInsets? padding;

  /// Chiều rộng cố định (nếu cần).
  final double? width;

  /// Chiều cao cố định (nếu cần).
  final double? height;

  /// Bo góc. Mặc định [AppRadius.card].
  final double? borderRadius;

  /// Màu nền card. Mặc định lấy từ `context.appColors.cardBackground`.
  final Color? backgroundColor;

  /// Màu viền khi [showBorder] = true.
  final Color? borderColor;

  /// Màu shadow. Mặc định `Colors.black` với alpha 0.05.
  final Color? shadowColor;

  /// Hiển thị viền xung quanh card.
  final bool showBorder;

  /// Elevation / shadow. Mặc định 0 (không shadow).
  final double elevation;

  /// Clip behavior cho nội dung bên trong.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final resolvedRadius = borderRadius ?? AppRadius.card;
    final resolvedBorderRadius = BorderRadius.circular(resolvedRadius);
    final resolvedBackground =
        backgroundColor ?? context.appColors.cardBackground;

    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: resolvedBorderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: resolvedBackground,
        elevation: elevation,
        borderRadius: resolvedBorderRadius,
        clipBehavior: clipBehavior,
        shape: showBorder
            ? RoundedRectangleBorder(
                borderRadius: resolvedBorderRadius,
                side: BorderSide(
                  color: borderColor ?? context.colorScheme.outlineVariant,
                ),
              )
            : null,
        child: InkWell(
          onTap: onTap,
          borderRadius: resolvedBorderRadius,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(AppSpacing.cardPadding),
            child: child,
          ),
        ),
      ),
    );
  }
}
