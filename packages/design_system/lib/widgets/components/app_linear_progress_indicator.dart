import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppLinearProgressIndicator extends StatelessWidget {
  const AppLinearProgressIndicator({
    super.key,
    required this.value,
    this.minHeight = 8,
    this.borderRadius,
    this.useSuccessColorWhenCompleted = true,
  });

  final double value;
  final double minHeight;
  final BorderRadius? borderRadius;
  final bool useSuccessColorWhenCompleted;

  @override
  Widget build(BuildContext context) {
    final clampedValue = value.clamp(0.0, 1.0);

    // final Color progressColor;
    // if (useSuccessColorWhenCompleted && clampedValue >= 1) {
    //   progressColor = context.appColors.success;
    // } else {
    //   progressColor = context.colorScheme.primary;
    // }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.full),
      child: LinearProgressIndicator(
        value: clampedValue,
        minHeight: minHeight,
        // valueColor: AlwaysStoppedAnimation<Color>(progressColor),
      ),
    );
  }
}
