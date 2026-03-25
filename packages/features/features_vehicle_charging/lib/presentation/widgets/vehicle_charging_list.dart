import 'package:design_system/design_system.dart';
import 'package:features_vehicle_charging/domain/entities/vehicle_charging_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/extensions/context_ext.dart';

class VehicleChargingList extends StatefulWidget {
  const VehicleChargingList({
    super.key,
    required this.items,
    required this.onTapInfo,
    required this.isLoading,
    this.onRefresh,
    this.onLoadMore,
  });

  final List<VehicleChargingEntity> items;
  final void Function(VehicleChargingEntity) onTapInfo;
  final bool isLoading;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onLoadMore;

  @override
  State<VehicleChargingList> createState() => _VehicleChargingListState();
}

class _VehicleChargingListState extends State<VehicleChargingList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final spacing = context.appSpacing;

    return ScrollList<VehicleChargingEntity>(
      controller: _scrollController,
      isLoading: widget.isLoading,
      items: widget.items,
      onRefresh: widget.onRefresh,
      onLoadingMore: widget.onLoadMore,
      header: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.pageHorizontal,
        ),
        child: const SizedBox.shrink(),
      ),
      itemBuilder: (context, index, item) {
        return Padding(
          padding: EdgeInsets.only(
            left: spacing.pageHorizontal,
            right: spacing.pageHorizontal,
            bottom: index == widget.items.length - 1
                ? AppSpacing.sectionSpacing
                : 0,
          ),
          child: _VehicleChargingCard(
            item: item,
            priority: index + 1,
            onTapInfo: () => widget.onTapInfo(item),
            colorScheme: colorScheme,
          ),
        );
      },
      separatorBuilder: (_, __) => const Gap(AppSpacing.listItemPadding),
      noRecordFoundWidget: const SizedBox.shrink(),
    );
  }
}

class _VehicleChargingCard extends StatelessWidget {
  const _VehicleChargingCard({
    required this.item,
    required this.priority,
    required this.onTapInfo,
    required this.colorScheme,
  });

  final VehicleChargingEntity item;
  final int priority;
  final VoidCallback onTapInfo;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final typography = context.textTheme;
    final colorScheme = context.colorScheme;

    return CustomCard(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppIconContainer(
                icon: Icon(Icons.battery_1_bar_sharp),
                borderRadius: AppRadius.lg,
              ),
              const Gap(AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item.vin,
                            style: typography.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Gap(AppSpacing.small),
                        _ChargingStatusChip(
                          maxAgingDay: item.agingDays,
                          colorScheme: colorScheme,
                        ),
                      ],
                    ),
                    const Gap(AppSpacing.tiny),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            context.l10n.vehicleChargingPriority(
                              priority,
                            ),
                            style: typography.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Gap(AppSpacing.small),
                        Flexible(
                          child: Text(
                            item.factoryName,
                            style: typography.bodySmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.medium),
          const Divider(),
          const Gap(AppSpacing.medium),
          Row(
            children: [
              const AppIconContainer(
                icon: Icon(Icons.location_on_outlined),
                size: AppSpacing.extraLarge,
                borderRadius: AppRadius.sm,
              ),
              const Gap(AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.vehicleChargingLocationLabel,
                      style: typography.bodySmall,
                    ),
                    const Gap(AppSpacing.xxxs),
                    Text(
                      item.factoryName,
                      style: typography.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(AppSpacing.small),
              const AppIconContainer(
                icon: Icon(Icons.schedule),
                size: AppSpacing.extraLarge,
                borderRadius: AppRadius.sm,
              ),
              const Gap(AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.vehicleChargingTimeInAreaLabel,
                      style: typography.bodySmall,
                    ),
                    const Gap(AppSpacing.xxxs),
                    Text(
                      item.warehouseImportedAt,
                      style: typography.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.medium),
          InkWell(
            onTap: onTapInfo,
            borderRadius: BorderRadius.circular(AppRadius.card),
            child: CustomCard(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.large,
                vertical: AppSpacing.small,
              ),
              backgroundColor: colorScheme.primary.withValues(
                alpha: 0.05,
              ),
              borderColor: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.vehicleChargingMaintenaceActionHint,
                    style: typography.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChargingStatusChip extends StatelessWidget {
  const _ChargingStatusChip({
    required this.maxAgingDay,
    required this.colorScheme,
  });

  final int maxAgingDay;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final bg = colorScheme.error.withValues(alpha: 0.08);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.small,
        vertical: AppSpacing.tiny,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(
          color: colorScheme.error.withValues(alpha: 0.15),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Aging: ${context.l10n.agingDays(maxAgingDay)}',
            style: context.textTheme.labelSmall?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
