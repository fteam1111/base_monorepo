import 'package:design_system/design_system.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ChargingInfoDialog extends StatelessWidget {
  const ChargingInfoDialog({super.key, required this.item});

  final VehicleChargingEntity item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final maxHeight = context.screenHeight * 0.8;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.dialog),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Padding(
          padding: EdgeInsets.all(spacing.pageHorizontal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      context.l10n.vehicleChargingMaintenanceRequestTitle,
                      style: AppTypography.titleMedium,
                    ),
                  ),
                  const CloseButton(),
                ],
              ),
              const Gap(AppSpacing.sectionSpacing),
              CustomCard(
                backgroundColor: colorScheme.primary.withValues(alpha: 0.05),
                elevation: 0,
                shadowColor: Colors.transparent,
                child: Column(
                  children: [
                    InfoRow(
                      label: '${context.l10n.vinIdentifier.toUpperCase()}:',
                      value: item.vin,
                      valueColor: colorScheme.primary,
                    ),
                    const Gap(AppSpacing.small),
                    InfoRow(
                      label: context.l10n.vehicleChargingCurrentAgingLabel,
                      value: context.l10n.agingDays(item.agingDays),
                      valueColor: colorScheme.error,
                    ),
                  ],
                ),
              ),
              const Gap(AppSpacing.sectionSpacing),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    AppRoutes.navigateToDischargingResult(
                      context,
                      extra: item,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bolt),
                      const Gap(8),
                      Text(context.l10n.vehicleChargingMoveToChargeAction),
                    ],
                  ),
                ),
              ),
              const Gap(AppSpacing.small),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    side: BorderSide(color: colorScheme.outline),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadius.button),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(context.l10n.vehicleChargingNoNeedAction),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final typography = context.textTheme;
    final spacing = context.appSpacing;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: typography.labelSmall?.copyWith(
              color: colorScheme.secondary,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Gap(spacing.listItemPadding / 2),
        Flexible(
          child: Text(
            value,
            style: typography.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: valueColor ?? colorScheme.onSurface,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
