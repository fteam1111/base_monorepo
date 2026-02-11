import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/extensions/context_ext.dart';
import 'package:share/share.dart';
import 'package:features_vehicle_charging/presentation/pages/vehicle_charging_page.dart';

class ChargingInfoDialog extends StatelessWidget {
  const ChargingInfoDialog({super.key, required this.item});

  final VehicleChargingItemModel item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final maxHeight = context.screenHeight * 0.8;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Padding(
          padding: EdgeInsets.all(context.appSpacing.pageHorizontal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIconContainer(
                size: AppSpacing.gigantic,
                icon: Image.asset(
                  AppIcons.icLightning,
                  package: AppAssets.package,
                  height: AppSpacing.huge,
                  width: AppSpacing.huge,
                ),
                borderColor: Colors.transparent,
                borderRadius: AppRadius.avatarCircle,
              ),
              const Gap(AppSpacing.medium),
              Text(
                context.l10n.vehicleChargingInfoTitle,
                style: AppTypography.sectionHeader.copyWith(
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(AppSpacing.small),
              Text(
                context.l10n.vehicleChargingInfoSubtitle,
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.secondaryLight,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                item.vin,
                style: AppTypography.titleMedium.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(AppSpacing.large),
              InfoRow(
                label: context.l10n.vehicleChargingInfoStatusLabel,
                value: item.statusText,
                valueColor: colorScheme.primary,
              ),
              InfoRow(
                label: context.l10n.vehicleChargingInfoSubAreaLabel,
                value: item.station,
              ),
              InfoRow(
                label: context.l10n.vehicleChargingInfoCheckAgingDateLabel,
                value: item.checkAgingDate,
              ),
              const Gap(AppSpacing.mediumLarge),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => AppRoutes.navigateBack(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neutral20,
                    foregroundColor: AppColors.neutral100,
                  ),
                  child: Text(context.l10n.vehicleChargingCloseInfo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.small,
        vertical: AppSpacing.small,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.secondaryLight,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const Gap(AppSpacing.small),
          Text(
            value,
            style: AppTypography.titleSmall.copyWith(
              fontWeight: FontWeight.w700,
              color: valueColor ?? colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
