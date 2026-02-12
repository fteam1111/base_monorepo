import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class VehicleDetailInfoCard extends StatelessWidget {
  const VehicleDetailInfoCard({
    super.key,
    required this.vin,
    required this.model,
    required this.colorName,
    required this.batteryLevel,
    required this.aging,
    required this.statuses,
  });

  final String vin;
  final String model;
  final String colorName;
  final int batteryLevel;
  final int aging;
  final List<String> statuses;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final typography = context.appTypography;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.extraLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vin code
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.vinIdentifier,
                      style: typography.bodySmall.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(AppSpacing.xxs),
                    Text(
                      vin,
                      style: typography.sectionHeader.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),

              // Status chips
              Expanded(
                flex: 1,
                child: Wrap(
                  spacing: AppSpacing.xxs,
                  runSpacing: AppSpacing.xxs,
                  alignment: WrapAlignment.end,
                  children: statuses
                      .map((status) => _StatusChip(label: status))
                      .toList(),
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.paddingXS),
          // Information vehicle
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: context.l10n.vehicleModel,
                  value: model,
                ),
              ),
              Expanded(
                child: _InfoItem(
                  label: context.l10n.vehicleColor,
                  value: colorName,
                  isColor: true,
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.paddingXS),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  label: context.l10n.batteryCapacity,
                  value: '$batteryLevel%',
                  isBattery: true,
                ),
              ),
              Expanded(
                child: _InfoItem(
                  label: context.l10n.aging,
                  value: '$aging',
                  isAging: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.paddingXS,
        vertical: AppSpacing.xxxs,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.pillShape),
        border: Border.all(
          color: colorScheme.primaryContainer.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        label,
        style: context.appTypography.bodySmall.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.label,
    required this.value,
    this.isColor = false,
    this.isBattery = false,
    this.isAging = false,
  });

  final String label;
  final String value;
  final bool isColor;
  final bool isBattery;
  final bool isAging;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final typography = context.appTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: typography.bodySmall.copyWith(
            color: colorScheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(AppSpacing.xxs),
        Row(
          children: [
            if (isColor) ...[
              Container(
                width: AppSpacing.iconXXS,
                height: AppSpacing.iconXXS,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(AppSpacing.xxs),
            ],
            if (isBattery) ...[
              Icon(
                Icons.battery_charging_full,
                size: AppSpacing.iconInline,
                color: colorScheme.primary,
              ),
              const Gap(AppSpacing.xxs),
            ],
            Text(
              value,
              style: typography.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                color: isBattery
                    ? colorScheme.primary
                    : (isAging ? Colors.orange : colorScheme.onSurface),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
