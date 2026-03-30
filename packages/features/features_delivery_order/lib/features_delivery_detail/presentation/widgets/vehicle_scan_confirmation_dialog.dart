import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Pre-scan confirmation dialog shown before opening QR scanner.
///
/// Shows vehicle VIN and zone, with "Confirm & Scan" action.
class VehicleScanConfirmationDialog extends StatelessWidget {
  const VehicleScanConfirmationDialog({
    super.key,
    required this.vinCode,
    required this.zoneName,
    required this.onConfirm,
  });

  final String vinCode;
  final String zoneName;
  final VoidCallback onConfirm;

  /// Shows the dialog and returns `true` if user confirms.
  static Future<bool?> show(
    BuildContext context, {
    required String vinCode,
    required String zoneName,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => VehicleScanConfirmationDialog(
        vinCode: vinCode,
        zoneName: zoneName,
        onConfirm: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.dialog),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingLG),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.pedal_bike,
                size: AppSpacing.iconXXL,
                color: context.colorScheme.primary,
              ),
            ),
            const Gap(AppSpacing.paddingLG),
            Text(
              context.l10n.scanConfirmTitle,
              style: context.appTypography.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.paddingSM),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.l10n.scanConfirmMessage(vinCode, zoneName),
                    style: context.appTypography.bodyMedium.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.paddingLG),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: context.primaryButtonStyle,
                onPressed: onConfirm,
                icon: const Icon(Icons.qr_code_scanner),
                label: Text(context.l10n.scanConfirmAction),
              ),
            ),
            const Gap(AppSpacing.paddingSM),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                context.l10n.cancelAction,
                style: context.appTypography.labelLarge.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
