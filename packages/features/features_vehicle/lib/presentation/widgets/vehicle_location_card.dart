import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class VehicleLocationCard extends StatelessWidget {
  const VehicleLocationCard({
    super.key,
    required this.locationName,
    required this.factoryName,
  });

  final String locationName;
  final String factoryName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final typography = context.appTypography;

    return CustomCard(
      child: Row(
        children: [
          AppIconContainer(
            icon: Icon(Icons.local_parking, color: colorScheme.primary),
          ),
          const Gap(AppSpacing.sectionPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.currentLocation,
                  style: typography.bodySmall.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(AppSpacing.xxs),
                Text(
                  locationName,
                  style: typography.bodyLarge.copyWith(
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
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Text(
              factoryName,
              style: typography.bodySmall.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
