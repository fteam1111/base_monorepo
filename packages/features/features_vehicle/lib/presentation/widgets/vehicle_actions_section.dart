import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_vehicle/presentation/cubit/vehicle_action_cubit.dart';
import 'package:features_vehicle/presentation/cubit/vehicle_action_state.dart';
import 'package:features_vehicle/presentation/widgets/dialogs/send_vehicle_to_qc_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
/// - `pendingImport (5)`, `defective (3)`, `discharging (2)` → Xác nhận đỗ xe
/// - `inStock (1)` → Di chuyển khu Chờ xuất, Di chuyển sang khu QC
/// - (`defective (3)` hoặc `inStock (1)`) AND `agingDays > 30` → Chuyển sang khu sạc xả
class VehicleActionsSection extends StatelessWidget {
  const VehicleActionsSection({super.key, required this.vehicle});

  final VehicleEntity? vehicle;

  Future<void> _onQCPressed(BuildContext context) async {
    if (vehicle == null) return;
    final cubit = context.read<VehicleActionCubit>();
    final reason = await showDialog<String>(
      context: context,
      builder: (ctx) => SendVehicleToQcDialog(vehicle: vehicle!),
    );
    if (reason != null && context.mounted) {
      unawaited(cubit.sendToQc(vehicle!.id, reason));
    }
  }

  Future<void> _onChargingPressed(BuildContext context) async {
    if (vehicle == null) return;
    final l10n = context.l10n;
    final cubit = context.read<VehicleActionCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: context.colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.dialog),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.transferToChargingTitle,
                style: context.appTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
              const Gap(AppSpacing.sm),
              Text(
                l10n.confirmTransferToCharging,
                style: context.appTypography.bodyMedium.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              const Gap(AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(ctx).pop(false),
                    child: Text(l10n.cancel),
                  ),
                  const Gap(AppSpacing.xs),
                  ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(true),
                    child: Text(l10n.confirm),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    if (confirmed == true && context.mounted) {
      unawaited(cubit.sendForDischarging(vehicle!.id));
    }
  }

  List<_VehicleActionData> _computeActions(BuildContext context) {
    final l10n = context.l10n;
    final status = vehicle?.status;
    final agingDays = vehicle?.storageDays ?? 0;
    final actions = <_VehicleActionData>[];

    final isEligibleForCharging =
        (status == VehicleStatus.defective ||
            status == VehicleStatus.inStock) &&
        agingDays > _agingDaysThreshold;

    if (status == VehicleStatus.pendingImport ||
        status == VehicleStatus.defective ||
        status == VehicleStatus.discharging) {
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
      actions
        ..add(
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
        )
        ..add(
          _VehicleActionData(
            title: l10n.moveToQCArea,
            subtitle: l10n.recheckQuality,
            backgroundColor: context.colorScheme.error,
            icon: Icons.verified_user_outlined,
            onPressed: () => _onQCPressed(context),
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
          onPressed: () => _onChargingPressed(context),
        ),
      );
    }

    return actions;
  }

  @override
  Widget build(BuildContext context) {
    final actions = _computeActions(context);

    if (actions.isEmpty) return const SizedBox.shrink();

    return BlocConsumer<VehicleActionCubit, VehicleActionState>(
      listener: (context, state) {
        if (state is VehicleActionLoading) {
          GlobalLoading.showLoadingDialog();
        } else {
          GlobalLoading.dismiss();
        }

        if (state is VehicleActionFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is VehicleActionSuccess) {
          final tabIndex = state.completedAction == VehicleActionCompleted.qc
              ? _tabQc
              : _tabCharging;
          AppRoutes.navigateToChooseParkingLocation(
            context,
            initialTabIndex: tabIndex,
          );
        }
      },
      builder: (context, state) {
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
                padding: const EdgeInsets.only(
                  bottom: AppSpacing.sectionSpacing,
                ),
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
      },
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
