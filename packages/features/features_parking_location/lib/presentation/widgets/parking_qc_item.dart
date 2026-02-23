import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ParkingQCItem extends StatelessWidget {
  const ParkingQCItem({
    super.key,
    required this.name,
    required this.remaining,
    required this.total,
    this.onPressed,
  });

  final String name;
  final int remaining;
  final int total;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return CustomCard(
      onTap: onPressed,
      child: Row(
        children: [
          AppIconContainer(
            icon: Text(
              'QC1',
              style: context.appTypography.bodyMedium.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Gap(AppSpacing.sectionPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.appTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(AppSpacing.xxxs),
                Row(
                  children: [
                    Text(
                      context.l10n.remainingSlots,
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(AppSpacing.xxs),
                    Text(
                      '$remaining',
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSpacing.xxxs),
                Row(
                  children: [
                    Text(
                      context.l10n.capacity,
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(AppSpacing.xxs),
                    Text(
                      '$remaining/$total',
                      style: context.appTypography.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}
