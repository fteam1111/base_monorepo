import 'package:design_system/design_system.dart';
import 'package:features_parking_history/domain/entities/vehicle_history_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/extensions/context_ext.dart';

class ParkingHistoryItem extends StatelessWidget {
  const ParkingHistoryItem({super.key, required this.item});

  final VehicleHistoryEntity item;

  String _getActionHeaderLabel(BuildContext context) {
    switch (item.action) {
      case VehicleAction.import:
        return context.l10n.parkingHistoryImport;
      case VehicleAction.moveToCharge:
        return context.l10n.parkingHistoryMoveToCharge;
      case VehicleAction.moveToQc:
        return context.l10n.parkingHistoryMoveToQc;
      case VehicleAction.assignToDo:
        return context.l10n.parkingHistoryAssignToDo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return CustomCard(
      padding: const EdgeInsets.all(AppSpacing.xs),
      borderColor: colors.border.withValues(alpha: 0.01),
      showBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getActionHeaderLabel(context),
            style: context.appTypography.titleLarge.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.xxxs),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryFactory,
            item.factoryObj?.name,
          ),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryArea,
            item.area?.name,
          ),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryPosition,
            item.position?.name,
          ),
          if (item.performedAt != null)
            _buildInfoRow(
              context,
              context.l10n.parkingHistoryTime,
              DateFormat('HH:mm:ss - dd/MM/yyyy').format(item.performedAt!),
            ),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryEmployee,
            item.performedByName ?? item.performedBy,
          ),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryAccount,
            item.performedByAccount,
          ),
          if (item.storageDays != null)
            _buildInfoRow(
              context,
              context.l10n.parkingHistoryStorageDays,
              '${item.storageDays}',
            ),
          _buildInfoRow(
            context,
            context.l10n.parkingHistoryDoCode,
            item.deliveryOrder?.doCode,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    final typography = context.appTypography;
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: typography.bodyMedium.copyWith(color: colors.neutral),
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
