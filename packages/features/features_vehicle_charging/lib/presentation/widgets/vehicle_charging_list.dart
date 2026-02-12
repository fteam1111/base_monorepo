import 'package:design_system/design_system.dart';
import 'package:features_vehicle_charging/presentation/pages/vehicle_charging_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/extensions/context_ext.dart';

class VehicleChargingList extends StatelessWidget {
  const VehicleChargingList({
    super.key,
    required this.items,
    required this.onTapInfo,
  });

  final List<VehicleChargingItemModel> items;
  final void Function(VehicleChargingItemModel) onTapInfo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return ListView.separated(
      padding: EdgeInsets.fromLTRB(
        context.appSpacing.pageHorizontal,
        AppSpacing.none,
        context.appSpacing.pageHorizontal,
        AppSpacing.large,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return _VehicleChargingCard(
          item: item,
          onTapInfo: () => onTapInfo(item),
          colorScheme: colorScheme,
        );
      },
      separatorBuilder: (_, __) => const Gap(AppSpacing.sectionPadding),
    );
  }
}

class _VehicleChargingCard extends StatelessWidget {
  const _VehicleChargingCard({
    required this.item,
    required this.onTapInfo,
    required this.colorScheme,
  });

  final VehicleChargingItemModel item;
  final VoidCallback onTapInfo;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
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
                              style: AppTypography.sectionHeader.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Gap(AppSpacing.small),
                          _ChargingStatusChip(
                            statusText: item.statusText,
                            isCharging: item.isCharging,
                            colorScheme: colorScheme,
                          ),
                        ],
                      ),

                      const Gap(AppSpacing.tiny),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              item.model,
                              style: AppTypography.captionTextRegular(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Gap(AppSpacing.small),
                          Flexible(
                            child: Text(
                              item.station,
                              style: AppTypography.captionTextBold(
                                color: colorScheme.primary,
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
                const Icon(
                  Icons.schedule,
                  size: AppSpacing.iconButton,
                  color: AppColors.tertiaryDark,
                ),
                const Gap(AppSpacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.entryTime,
                        style: AppTypography.captionTextRegular(),
                      ),
                      const Gap(AppSpacing.xxxs),
                      Text(
                        item.timeIn,
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(AppSpacing.small),
                InkResponse(
                  onTap: onTapInfo,
                  radius: AppSpacing.xl,
                  child: const AppIconContainer(
                    backgroundColor: AppColors.backgroundLight,
                    icon: Icon(
                      Icons.info_outline,
                      color: AppColors.tertiaryDark,
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

class _ChargingStatusChip extends StatelessWidget {
  const _ChargingStatusChip({
    required this.statusText,
    required this.isCharging,
    required this.colorScheme,
  });

  final String statusText;
  final bool isCharging;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final bg = colorScheme.primary.withValues(alpha: 0.08);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.small,
        vertical: AppSpacing.tiny,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.badgeLarge),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppIcons.icLightning,
            package: AppAssets.package,
            height: AppSpacing.iconXS,
            width: AppSpacing.iconXS,
            color: colorScheme.primary,
          ),
          const Gap(AppSpacing.tiny),
          Text(
            statusText,
            style: AppTypography.labelSmall.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
