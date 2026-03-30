import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Result dialog shown after QR scan verification.
///
/// Displays one of 3 variants based on [matchType]:
/// - [ScanVerificationStatus.exactMatch] — green ✅
/// - [ScanVerificationStatus.compatibleMatch] — orange ⚠️
/// - [ScanVerificationStatus.incompatible] — red ❌
class VehicleScanResultDialog extends StatelessWidget {
  const VehicleScanResultDialog({
    super.key,
    required this.matchType,
    required this.scannedVin,
    required this.doCode,
    this.onConfirmAdd,
    this.onDismiss,
  });

  final ScanVerificationStatus matchType;
  final String scannedVin;
  final String doCode;
  final VoidCallback? onConfirmAdd;
  final VoidCallback? onDismiss;

  /// Shows the dialog.
  static Future<void> show(
    BuildContext context, {
    required ScanVerificationStatus matchType,
    required String scannedVin,
    required String doCode,
    VoidCallback? onConfirmAdd,
    VoidCallback? onDismiss,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => VehicleScanResultDialog(
        matchType: matchType,
        scannedVin: scannedVin,
        doCode: doCode,
        onConfirmAdd: () {
          Navigator.of(context).pop();
          onConfirmAdd?.call();
        },
        onDismiss: () {
          Navigator.of(context).pop();
          onDismiss?.call();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final config = _DialogConfig.from(matchType, context);

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
                color: config.iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                config.icon,
                size: AppSpacing.iconXXL,
                color: config.iconColor,
              ),
            ),
            const Gap(AppSpacing.paddingLG),
            Text(
              config.title,
              style: context.appTypography.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.paddingSM),
            _buildMessage(context, config),
            const Gap(AppSpacing.paddingLG),
            ..._buildActions(context, config),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(BuildContext context, _DialogConfig config) {
    final l10n = context.l10n;
    final String message;

    switch (matchType) {
      case ScanVerificationStatus.exactMatch:
        message = l10n.scanMatchMessage(scannedVin, doCode);
      case ScanVerificationStatus.compatibleMatch:
        message = l10n.scanCompatibleMessage(scannedVin, doCode);
      case ScanVerificationStatus.incompatible:
        message = l10n.scanIncompatibleMessage(scannedVin, doCode);
      default:
        message = '';
    }

    return Text(
      message,
      style: context.appTypography.bodyMedium.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
      textAlign: TextAlign.center,
    );
  }

  List<Widget> _buildActions(BuildContext context, _DialogConfig config) {
    switch (matchType) {
      case ScanVerificationStatus.exactMatch:
        return [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: config.actionColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.paddingSM,
                ),
              ),
              onPressed: onConfirmAdd,
              child: Text(
                context.l10n.scanMatchAction,
                style: context.appTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Gap(AppSpacing.paddingSM),
          TextButton(
            onPressed: onDismiss,
            child: Text(
              context.l10n.cancelAction,
              style: context.appTypography.labelLarge.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ];

      case ScanVerificationStatus.compatibleMatch:
        return [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: config.actionColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.paddingSM,
                ),
              ),
              onPressed: onConfirmAdd,
              child: Text(
                context.l10n.scanCompatibleAction,
                style: context.appTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Gap(AppSpacing.paddingSM),
          TextButton(
            onPressed: onDismiss,
            child: Text(
              context.l10n.cancelBackToList,
              style: context.appTypography.labelLarge.copyWith(
                color: context.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ];

      case ScanVerificationStatus.incompatible:
        return [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.onSurface.withValues(
                  alpha: 0.85,
                ),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.paddingSM,
                ),
              ),
              onPressed: onDismiss,
              child: Text(
                context.l10n.scanBackToList,
                style: context.appTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ];

      default:
        return [];
    }
  }
}

/// Internal configuration for dialog variants.
class _DialogConfig {
  const _DialogConfig({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.actionColor,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final Color actionColor;

  static _DialogConfig from(ScanVerificationStatus type, BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colorScheme;

    switch (type) {
      case ScanVerificationStatus.exactMatch:
        return _DialogConfig(
          icon: Icons.check_circle,
          iconColor: context.appColors.success,
          iconBgColor: context.appColors.successContainer,
          title: l10n.scanMatchTitle,
          actionColor: context.appColors.success,
        );
      case ScanVerificationStatus.compatibleMatch:
        return _DialogConfig(
          icon: Icons.warning_amber_rounded,
          iconColor: context.appColors.warning,
          iconBgColor: context.appColors.warningContainer,
          title: l10n.scanCompatibleTitle,
          actionColor: context.appColors.warning,
        );
      case ScanVerificationStatus.incompatible:
        return _DialogConfig(
          icon: Icons.close,
          iconColor: colors.error,
          iconBgColor: colors.errorContainer,
          title: l10n.scanIncompatibleTitle,
          actionColor: colors.onSurface,
        );
      default:
        return _DialogConfig(
          icon: Icons.info,
          iconColor: colors.primary,
          iconBgColor: colors.primaryContainer,
          title: '',
          actionColor: colors.primary,
        );
    }
  }
}
