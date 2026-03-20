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
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: _HomeMenuItem(
                iconAsset: AppIcons.icLocation,
                label: context.l10n.map,
                onPressed: onMapPressed,
                isFullWidth: true,
              ),
            ),
            const Gap(AppSpacing.gridSpacing),
            Row(
              children: [
                Expanded(
                  child: _HomeMenuItem(
                    iconAsset: AppIcons.icLotFind,
                    label: context.l10n.doList,
                    onPressed: onDoListPressed,
                  ),
                ),
                const Gap(AppSpacing.gridSpacing),
                Expanded(
                  child: _HomeMenuItem(
                    iconAsset: AppIcons.icLightning,
                    label: context.l10n.charging,
                    onPressed: onChargingPressed,
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

class _HomeMenuItem extends StatelessWidget {
  const _HomeMenuItem({
    required this.iconAsset,
    required this.label,
    this.onPressed,
    this.isFullWidth = false,
  });

  final String iconAsset;
  final String label;
  final VoidCallback? onPressed;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return CustomCard(
      onTap: onPressed,
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
    );
  }
}
