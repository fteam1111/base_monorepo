import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ParkingGridItem extends StatelessWidget {
  const ParkingGridItem({
    super.key,
    required this.label,
    required this.current,
    required this.total,
    this.onPressed,
  });

  final String label;
  final int current;
  final int total;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return CustomCard(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: AppSpacing.gigantic,
            height: AppSpacing.gigantic,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              'P',
              style: context.appTypography.sectionHeader.copyWith(
                color: colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Gap(AppSpacing.sectionPadding),
          Text(
            label,
            style: context.appTypography.sectionHeader.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(AppSpacing.xxs),
          Text(
            '$current/$total',
            style: context.appTypography.bodyMedium.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
