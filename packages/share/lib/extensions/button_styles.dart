import 'package:design_system/theme/tokens/radius.dart';
import 'package:flutter/material.dart';

extension ButtonStylesExtension on BuildContext {
  ButtonStyle get primaryButtonStyle {
    final colorScheme = Theme.of(this).colorScheme;
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
    );
  }

  ButtonStyle get secondaryButtonStyle {
    final colorScheme = Theme.of(this).colorScheme;
    return ElevatedButton.styleFrom(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.button),
      ),
    );
  }
}
