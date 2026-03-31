import 'package:design_system/design_system.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Number of days threshold to show the charging area action.
const int _agingDaysThreshold = 30;

/// Index values matching [ParkingTab] enum order:
/// finished=0, charging=1, export=2, qc=3
const int _tabFinished = 0;
const int _tabCharging = 1;
const int _tabExport = 2;
const int _tabQc = 3;

/// Displays available vehicle action buttons based on [VehicleStatus]
/// and aging days.
///
/// Rules:
/// - `pendingImport (5)` → Xác nhận đỗ xe
/// - `defective (3)` → Di chuyển sang khu QC
/// - `pendingImport (5) || defective (3)` AND `agingDays > 30`
///   → Chuyển sang khu sạc xả
class VehicleActionsSection extends StatelessWidget {
  const VehicleActionsSection({super.key, required this.vehicle});

  final VehicleEntity? vehicle;

  List<_VehicleActionData> _computeActions(BuildContext context) {
    final l10n = context.l10n;
    final status = vehicle?.status;
    final agingDays = vehicle?.storageDays ?? 0;
    final actions = <_VehicleActionData>[];

    final isEligibleForCharging =
        (status == VehicleStatus.pendingImport ||
            status == VehicleStatus.defective) &&
        agingDays > _agingDaysThreshold;

    if (status == VehicleStatus.pendingImport) {
      actions.add(
        _VehicleActionData(
          title: l10n.confirmParking,
          subtitle: l10n.selectPositionToFinish,
          backgroundColor: context.colorScheme.primary,
          icon: Icons.local_parking_rounded,
          onPressed: () => AppRoutes.navigateToChooseParkingLocation(
            context,
            initialTabIndex: _tabFinished,
          ),
        ),
      );
    }

    if (status == VehicleStatus.inStock) {
      actions.add(
        _VehicleActionData(
          title: l10n.moveToExportArea,
          subtitle: l10n.prepareForDelivery,
          backgroundColor: context.colorScheme.error,
          icon: Icons.local_shipping_outlined,
          onPressed: () => AppRoutes.navigateToChooseParkingLocation(
            context,
            initialTabIndex: _tabExport,
          ),
        ),
      );
    }

    if (status == VehicleStatus.defective) {
      actions.add(
        _VehicleActionData(
          title: l10n.moveToQCArea,
          subtitle: l10n.recheckQuality,
          backgroundColor: context.colorScheme.error,
          icon: Icons.verified_user_outlined,
          onPressed: () => AppRoutes.navigateToChooseParkingLocation(
            context,
            initialTabIndex: _tabQc,
          ),
        ),
      );
    }

    if (isEligibleForCharging) {
      actions.add(
        _VehicleActionData(
          title: l10n.moveToChargingArea,
          subtitle: l10n.confirmChargingTransfer,
          backgroundColor: context.colorScheme.secondary,
          icon: Icons.bolt_rounded,
          onPressed: () => AppRoutes.navigateToChooseParkingLocation(
            context,
            initialTabIndex: _tabCharging,
          ),
        ),
      );
    }

    return actions;
  }

  @override
  Widget build(BuildContext context) {
    final actions = _computeActions(context);

    if (actions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.availableActions,
          style: context.appTypography.bodyLarge.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(AppSpacing.sectionPadding),
        ...actions.map(
          (action) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sectionSpacing),
            child: _ActionLargeButton(
              title: action.title,
              subtitle: action.subtitle,
              backgroundColor: action.backgroundColor,
              icon: action.icon,
              onPressed: action.onPressed,
            ),
          ),
        ),
      ],
    );
  }
}

class _VehicleActionData {
  const _VehicleActionData({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;
}

class _ActionLargeButton extends StatelessWidget {
  const _ActionLargeButton({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;

    return CustomCard(
      backgroundColor: backgroundColor,
      shadowColor: backgroundColor.withValues(alpha: 0.6),
      onTap: onPressed,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.paddingXS),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Icon(icon, color: Colors.white, size: AppSpacing.iconAction),
          ),
          const Gap(AppSpacing.paddingSM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: typography.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  subtitle,
                  style: typography.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
            size: AppSpacing.iconDefault,
          ),
        ],
      ),
    );
  }
}
