import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ParkingListItem extends StatelessWidget {
  const ParkingListItem({
    super.key,
    required this.vin,
    required this.model,
    required this.station,
    required this.entryTime,
    this.onPressed,
  });

  final String vin;
  final String model;
  final String station;
  final String entryTime;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return CustomCard(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              AppIconContainer(
                icon: Icon(
                  Icons.battery_charging_full,
                  color: colorScheme.primary,
                ),
              ),
              const Gap(AppSpacing.sectionPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vin,
                      style: context.appTypography.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(AppSpacing.xxxs),
                    Text(
                      '$model  •  $station',
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.paddingXS,
                  vertical: AppSpacing.xxxs,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.pillShape),
                  border: Border.all(
                    color: colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.bolt,
                      size: AppSpacing.iconInline,
                      color: colorScheme.primary,
                    ),
                    const Gap(AppSpacing.xxxs),
                    Text(
                      context.l10n.chargingStatus,
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.sectionPadding),
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: AppSpacing.iconInline,
                color: colorScheme.onSurfaceVariant,
              ),
              const Gap(AppSpacing.xxs),
              Text(
                context.l10n.entryTime,
                style: context.appTypography.bodySmall.copyWith(
                  color: colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSpacing.xxs),
              Text(
                entryTime,
                style: context.appTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
