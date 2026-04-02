import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';
import 'package:features_parking_location/presentation/bloc/export_area_do_bloc.dart';
import 'package:features_parking_location/presentation/bloc/export_area_do_event.dart';
import 'package:features_parking_location/presentation/bloc/export_area_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Page displaying the list of delivery orders within
/// a specific export area (lồng).
class ExportAreaDeliveryOrderListPage extends StatelessWidget {
  const ExportAreaDeliveryOrderListPage({
    super.key,
    required this.areaId,
    required this.areaName,
    this.vehicleId,
  });

  final int areaId;
  final String areaName;
  final String? vehicleId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: context.appColors.background,
      appBar: CustomAppBar(
        title: l10n.exportAreaDoTitle(areaName),
        subtitle: l10n.exportAreaDoSubtitle,
      ),
      body: BlocConsumer<ExportAreaDoBloc, ExportAreaDoState>(
        listenWhen: (previous, current) =>
            previous.addVehicleStatus != current.addVehicleStatus,
        listener: (context, state) {
          if (state.addVehicleStatus == ExportAreaDoAddVehicleStatus.loading) {
            GlobalLoading.showLoadingDialog();
          } else if (state.addVehicleStatus ==
              ExportAreaDoAddVehicleStatus.success) {
            GlobalLoading.dismiss();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l10n.vehicleAddedSuccess)));
            context.read<ExportAreaDoBloc>().add(ExportAreaDoLoad(areaId));
            AppRoutes.navigateToDashboard(context);
          } else if (state.addVehicleStatus ==
              ExportAreaDoAddVehicleStatus.failure) {
            GlobalLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.addVehicleFailure?.nonTranslatedFailureMessage ??
                      l10n.error,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == ExportAreaDoStatus.loading &&
              state.deliveryOrders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == ExportAreaDoStatus.failure &&
              state.deliveryOrders.isEmpty) {
            return Center(
              child: Text(
                state.failure?.nonTranslatedFailureMessage ?? l10n.error,
              ),
            );
          }

          if (state.deliveryOrders.isEmpty) {
            return Center(child: Text(l10n.exportAreaDoEmpty));
          }

          return ScrollList<ExportAreaDeliveryOrderEntity>(
            controller: ScrollController(),
            isLoading: state.status == ExportAreaDoStatus.loading,
            items: state.deliveryOrders,
            onRefresh: () async {
              context.read<ExportAreaDoBloc>().add(ExportAreaDoLoad(areaId));
            },
            onLoadingMore: () {},
            noRecordFoundWidget: const SizedBox.shrink(),
            itemBuilder: (context, index, item) {
              return _ExportAreaDoItem(
                entity: item,
                onAddVehicleTapped: vehicleId != null
                    ? () {
                        _showConfirmationBottomSheet(
                          context,
                          item: item,
                          vehicleId: vehicleId!,
                        );
                      }
                    : null,
              );
            },
          );
        },
      ),
    );
  }

  void _showConfirmationBottomSheet(
    BuildContext context, {
    required ExportAreaDeliveryOrderEntity item,
    required String vehicleId,
  }) {
    final l10n = context.l10n;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) {
        return Container(
          decoration: BoxDecoration(
            color: context.appColors.bottomSheetBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(context.appRadius.bottomSheet),
            ),
          ),
          padding: EdgeInsets.only(
            top: AppSpacing.sm,
            bottom:
                MediaQuery.of(bottomSheetContext).padding.bottom +
                AppSpacing.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Pull indicator
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.appColors.divider,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
              ),
              const Gap(AppSpacing.md),
              Text(
                l10n.exportAreaConfirmTitle,
                style: context.appTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(AppSpacing.sm),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text(
                  l10n.exportAreaConfirmMessage(item.doCode),
                  textAlign: TextAlign.center,
                  style: context.appTypography.bodyMedium.copyWith(
                    color: context.appColors.neutral,
                  ),
                ),
              ),
              const Gap(AppSpacing.md),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: context.appColors.cardBackground,
                    border: Border.all(
                      color: context.colorScheme.primary.withValues(alpha: 0.1),
                    ),
                    borderRadius: BorderRadius.circular(context.appRadius.card),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: context.appColors.background,
                          borderRadius: BorderRadius.circular(
                            context.appRadius.container,
                          ),
                          border: Border.all(color: context.appColors.divider),
                        ),
                        child: Icon(
                          Icons.inventory_2_outlined,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      const Gap(AppSpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.exportAreaDeliveryOrderLabel.toUpperCase(),
                              style: context.appTypography.labelSmall.copyWith(
                                color: context.appColors.neutral,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              item.doCode,
                              style: context.appTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(AppSpacing.lg),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(bottomSheetContext);
                      context.read<ExportAreaDoBloc>().add(
                        ExportAreaDoAddVehicle(
                          doId: item.id,
                          vehicleId: vehicleId,
                        ),
                      );
                    },
                    style: context.primaryButtonStyle,
                    child: Text(l10n.exportAreaConfirmAction),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExportAreaDoItem extends StatelessWidget {
  const _ExportAreaDoItem({required this.entity, this.onAddVehicleTapped});

  final ExportAreaDeliveryOrderEntity entity;
  final VoidCallback? onAddVehicleTapped;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isFull = entity.fulfilledQuantity >= entity.totalQuantity;

    final badgeColor = isFull
        ? context.appColors.successContainer
        : context.colorScheme.primary.withValues(alpha: 0.1);
    final badgeTextColor = isFull
        ? context.appColors.onSuccessContainer
        : context.colorScheme.primary;
    final badgeText = isFull
        ? l10n.exportAreaStatusFull.toUpperCase()
        : l10n.exportAreaStatusWaiting.toUpperCase();

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: CustomCard(
        elevation: 0,
        showBorder: true,
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: context.colorScheme.primary,
                  ),
                ),
                const Gap(AppSpacing.md),
                Expanded(
                  child: Text(
                    entity.doCode,
                    style: context.appTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(context.appRadius.chip),
                  ),
                  child: Text(
                    badgeText,
                    style: context.appTypography.labelSmall.copyWith(
                      color: badgeTextColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    l10n.exportAreaVehicleCount(entity.totalQuantity),
                    style: context.appTypography.labelMedium.copyWith(
                      color: context.appColors.neutral,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (onAddVehicleTapped != null)
                  InkWell(
                    onTap: onAddVehicleTapped,
                    borderRadius: BorderRadius.circular(
                      context.appRadius.button,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.exportAreaSelectAction.toUpperCase(),
                            style: context.appTypography.labelMedium.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(4),
                          Icon(
                            Icons.chevron_right,
                            size: 16,
                            color: context.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
