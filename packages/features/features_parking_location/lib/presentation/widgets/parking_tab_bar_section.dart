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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingXS),
      child: AppSegmentedTabBar(
        selectedValue: selectedTab,
        onChanged: (value) => onTabChanged(value as ParkingTab),
        items: [
          AppSegmentedTabItem(
            label: context.l10n.finishedProduct,
            icon: Icons.inventory_2_outlined,
            value: ParkingTab.finished,
          ),
          AppSegmentedTabItem(
            label: context.l10n.chargingDischarging,
            icon: Icons.bolt_outlined,
            value: ParkingTab.charging,
          ),
          AppSegmentedTabItem(
            label: context.l10n.exportWaiting,
            icon: Icons.local_shipping_outlined,
            value: ParkingTab.export,
          ),
          AppSegmentedTabItem(
            label: context.l10n.qcArea,
            icon: Icons.verified_user_outlined,
            value: ParkingTab.qc,
          ),
        ],
      ),
    );
  }
}
