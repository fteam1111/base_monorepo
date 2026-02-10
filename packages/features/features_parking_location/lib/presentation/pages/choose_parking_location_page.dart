import 'package:design_system/design_system.dart';
import 'package:features_parking_location/presentation/widgets/parking_grid_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_list_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_export_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_qc_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

enum ParkingTab { finished, charging, export, qc }

class ChooseParkingLocationPage extends StatefulWidget {
  const ChooseParkingLocationPage({super.key});

  @override
  State<ChooseParkingLocationPage> createState() =>
      _ChooseParkingLocationPageState();
}

class _ChooseParkingLocationPageState extends State<ChooseParkingLocationPage> {
  ParkingTab _selectedTab = ParkingTab.finished;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.chooseParkingLocation,
              style: context.appTypography.sectionHeader.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.l10n.businessAreaClassification,
              style: context.appTypography.bodySmall.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppRoutes.navigateBack(context),
        ),
      ),
      body: Column(
        children: [
          ParkingTabBarSection(
            selectedTab: _selectedTab,
            onTabChanged: (tab) => setState(() => _selectedTab = tab),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.appSpacing.pageHorizontal,
                  ),
                  sliver: _buildSliverContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverContent() {
    switch (_selectedTab) {
      case ParkingTab.finished:
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: AppSpacing.gridSpacing,
            crossAxisSpacing: AppSpacing.gridSpacing,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => ParkingGridItem(
              label: 'A${index + 1}',
              current: (index + 1) * 20,
              total: 400,
            ),
            childCount: 100,
          ),
        );
      case ParkingTab.charging:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.paddingSM),
              child: ParkingListItem(
                vin: index == 0 ? 'VIN-FLZ-1102' : 'VIN-VNT-9901',
                model: index == 0 ? 'FELIZ S' : 'VENTO S',
                station: 'Trạm 0${index + 1}',
                entryTime: index == 0
                    ? '08:30 - 15/05/2024'
                    : '10:15 - 15/05/2024',
              ),
            ),
            childCount: 2,
          ),
        );
      case ParkingTab.export:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.paddingSM),
              child: ParkingExportItem(
                name: 'Lồng ${index + 1}',
                orderCount: index == 0 ? 2 : (index == 1 ? 1 : 0),
              ),
            ),
            childCount: 3,
          ),
        );
      case ParkingTab.qc:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                const ParkingQCItem(name: 'Khu QC 01', remaining: 1, total: 10),
            childCount: 1,
          ),
        );
    }
  }
}
