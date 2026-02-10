import 'package:design_system/design_system.dart';
import 'package:features_parking_location/presentation/pages/choose_parking_location_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ParkingTabBarSection extends StatelessWidget {
  const ParkingTabBarSection({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  final ParkingTab selectedTab;
  final ValueChanged<ParkingTab> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.gigantic,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingXS),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: context.appSpacing.pageHorizontal,
        ),
        children: [
          _TabItem(
            label: context.l10n.finishedProduct,
            icon: Icons.inventory_2_outlined,
            isSelected: selectedTab == ParkingTab.finished,
            onTap: () => onTabChanged(ParkingTab.finished),
          ),
          _TabItem(
            label: context.l10n.chargingDischarging,
            icon: Icons.bolt_outlined,
            isSelected: selectedTab == ParkingTab.charging,
            onTap: () => onTabChanged(ParkingTab.charging),
          ),
          _TabItem(
            label: context.l10n.exportWaiting,
            icon: Icons.local_shipping_outlined,
            isSelected: selectedTab == ParkingTab.export,
            onTap: () => onTabChanged(ParkingTab.export),
          ),
          _TabItem(
            label: context.l10n.qcArea,
            icon: Icons.verified_user_outlined,
            isSelected: selectedTab == ParkingTab.qc,
            onTap: () => onTabChanged(ParkingTab.qc),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.paddingXS),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.paddingSM),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.1),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: AppSpacing.iconInline,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                label,
                style: context.appTypography.bodySmall.copyWith(
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
