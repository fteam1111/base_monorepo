import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// A reusable container for icons with a specific size, background, and border.
/// Usually used in list items or feature cards.
class AppIconContainer extends StatelessWidget {
  const AppIconContainer({
    super.key,
    required this.icon,
    this.size = AppSpacing.massive,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.borderRadius,
  });

  /// The icon to display inside the container.
  final Widget icon;

  /// The size of the container (both width and height).
  /// Defaults to [AppSpacing.massive] (48px).
  final double size;

  /// The background color of the container.
  /// Defaults to primary color with 10% opacity.
  final Color? backgroundColor;

  /// The color of the icon.
  /// Defaults to primary color.
  final Color? iconColor;

  /// The color of the border.
  /// Defaults to primary color with 20% opacity.
  final Color? borderColor;

  /// The border radius of the container.
  /// Defaults to [AppRadius.lg] (16px).
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final effectiveBackgroundColor =
        backgroundColor ?? colorScheme.primary.withValues(alpha: 0.1);
    final effectiveBorderColor =
        borderColor ?? colorScheme.primary.withValues(alpha: 0.2);
    final effectiveIconColor = iconColor ?? colorScheme.primary;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppRadius.lg),
        border: Border.all(color: effectiveBorderColor),
      ),
      alignment: Alignment.center,
      child: IconTheme(
        data: IconThemeData(color: effectiveIconColor, size: size * 0.5),
        child: icon,
      ),
    );
  }
}
