import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class ParkingHistoryItem extends StatelessWidget {
  const ParkingHistoryItem({
    super.key,
    required this.vin,
    required this.status,
    required this.info,
    this.isLeaving = false,
  });

  final String vin;
  final String status;
  final Map<String, String> info;
  final bool isLeaving;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.paddingXS),
      borderColor: isLeaving
          ? AppColors.warningLight
          : colors.border.withValues(alpha: 0.01),
      showBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vin,
            style: context.appTypography.titleLarge.copyWith(
              color: AppColors.primaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.paddingXXXS),
          Text(
            status,
            style: context.appTypography.bodyMedium.copyWith(
              color: isLeaving
                  ? AppColors.warningLight
                  : AppColors.primaryLight,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.paddingXXXS),
          ...info.entries.map(
            (entry) => _buildInfoRow(context, entry.key, entry.value),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    final typography = context.appTypography;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: typography.bodyMedium.copyWith(color: AppColors.neutral50),
          ),
          Text(
            value,
            style: typography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
