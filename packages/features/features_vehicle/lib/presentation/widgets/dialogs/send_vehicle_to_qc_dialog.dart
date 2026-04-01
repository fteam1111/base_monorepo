import 'package:design_system/design_system.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// A dialog that prompts the user for a reason when sending a vehicle to QC.
///
/// Returns the reason string if confirmed, or `null` if cancelled.
class SendVehicleToQcDialog extends StatefulWidget {
  const SendVehicleToQcDialog({super.key, required this.vehicle});

  /// The vehicle being sent to QC.
  final VehicleEntity vehicle;

  @override
  State<SendVehicleToQcDialog> createState() => _SendVehicleToQcDialogState();
}

class _SendVehicleToQcDialogState extends State<SendVehicleToQcDialog> {
  late final TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _onConfirm() {
    final reason = _reasonController.text.trim();
    if (reason.isEmpty) return;
    Navigator.of(context).pop(reason);
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = context.colorScheme;
    final typography = context.appTypography;

    // TODO: adjust null-aware operators if parkingLot can be null
    final parkingLoc = widget.vehicle.parkingLot?.parkingZone.name ?? '';
    final block = widget.vehicle.parkingLot?.name ?? '';
    final locationText = [
      parkingLoc,
      block,
    ].where((e) => e.isNotEmpty).join(' - ');

    return Dialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.dialog),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.enterReasonToMoveQc,
                    style: typography.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _onCancel,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Container(
                    padding: const EdgeInsets.all(AppSpacing.xxs),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: AppSpacing.iconSM,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),

            const Gap(AppSpacing.md),

            // Vehicle Info Card
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: context.appColors.infoContainer,
                borderRadius: BorderRadius.circular(AppRadius.container),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${l10n.vinIdentifier}:',
                        style: typography.bodyMedium.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.vehicle.serialNumber,
                        style: typography.bodyMedium.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(AppSpacing.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${l10n.currentLocation}:',
                        style: typography.bodyMedium.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        locationText.isEmpty ? '-' : locationText,
                        style: typography.bodyMedium.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Gap(AppSpacing.md),

            // Reason Input
            Text(
              l10n.reasonToMoveRequired,
              style: typography.labelMedium.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(AppSpacing.xs),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: _reasonController,
              builder: (context, value, child) {
                return AppTextField(
                  controller: _reasonController,
                  hintText: l10n.enterMoveReason,
                  maxLines: 4,
                  minLines: 4,
                  textInputAction: TextInputAction.done,
                );
              },
            ),

            const Gap(AppSpacing.sectionSpacing),

            // Actions
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      foregroundColor: colorScheme.onSurfaceVariant,
                      elevation: 0,
                    ),
                    child: Text(l10n.cancel),
                  ),
                ),
                const Gap(AppSpacing.sm),
                Expanded(
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _reasonController,
                    builder: (context, value, child) {
                      final hasText = value.text.trim().isNotEmpty;
                      return ElevatedButton(
                        onPressed: hasText ? _onConfirm : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: hasText
                              ? colorScheme.primary
                              : colorScheme.surfaceContainerHighest,
                          foregroundColor: hasText
                              ? colorScheme.onPrimary
                              : colorScheme.onSurfaceVariant,
                          elevation: hasText ? 2 : 0,
                        ),
                        child: Text(l10n.confirm),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
