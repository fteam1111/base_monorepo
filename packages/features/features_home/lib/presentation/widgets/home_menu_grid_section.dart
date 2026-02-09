import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class HomeMenuGridSliverSection extends StatelessWidget {
  const HomeMenuGridSliverSection({
    super.key,
    this.onHistoryPressed,
    this.onMapPressed,
    this.onDoListPressed,
    this.onChargingPressed,
  });

  final VoidCallback? onHistoryPressed;
  final VoidCallback? onMapPressed;
  final VoidCallback? onDoListPressed;
  final VoidCallback? onChargingPressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: context.appSpacing.pageHorizontal,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.gridSpacing,
          crossAxisSpacing: AppSpacing.gridSpacing,
          childAspectRatio: 1,
        ),
        delegate: SliverChildListDelegate([
          _HomeMenuItem(
            iconAsset: AppIcons.icHistory,
            label: 'Lịch sử',
            onPressed: onHistoryPressed,
          ),
          _HomeMenuItem(
            iconAsset: AppIcons.icLocation,
            label: 'Bản đồ',
            onPressed: onMapPressed,
          ),
          _HomeMenuItem(
            iconAsset: AppIcons.icLotFind,
            label: 'Danh sách DO',
            onPressed: onDoListPressed,
          ),
          _HomeMenuItem(
            iconAsset: AppIcons.icWarningFill,
            label: 'Sạc xe',
            onPressed: onChargingPressed,
          ),
        ]),
      ),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  const _HomeMenuItem({
    required this.iconAsset,
    required this.label,
    this.onPressed,
  });

  final String iconAsset;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Material(
      color: context.appColors.cardBackground,
      borderRadius: BorderRadius.circular(AppRadius.extraLarge),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.extraLarge),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(context.appSpacing.cardPadding),
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
                child: Image.asset(
                  iconAsset,
                  package: AppAssets.package,
                  width: AppSpacing.iconDefault,
                  height: AppSpacing.iconDefault,
                  color: colorScheme.onPrimary,
                ),
              ),
              const Gap(AppSpacing.small),
              Text(
                label,
                textAlign: TextAlign.center,
                style: context.appTypography.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
