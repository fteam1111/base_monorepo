import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

///TODO: Hard code màu sắc
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
    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingMD),
      decoration: BoxDecoration(
        color: colors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: isLeaving
              ? const Color(0xFFFF8C00)
              : colors.border.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vin,
            style: context.appTypography.titleLarge.copyWith(
              color: const Color(0xFF2E5BFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.paddingXS),
          Text(
            status,
            style: context.appTypography.bodyMedium.copyWith(
              color: isLeaving
                  ? const Color(0xFFFF8C00)
                  : const Color(0xFF2E5BFF),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.paddingLG),
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
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingXS / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: typography.bodyMedium.copyWith(
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            value,
            style: typography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }
}
