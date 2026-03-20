import 'package:design_system/design_system.dart';
import 'package:features_parking_location/presentation/widgets/parking_export_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_grid_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_list_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_qc_item.dart';
import 'package:features_parking_location/presentation/widgets/parking_selection_bottom_sheet.dart';
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

  late final ScrollController _finishedController;
  late final ScrollController _chargingController;
  late final ScrollController _exportController;
  late final ScrollController _qcController;

  @override
  void initState() {
    super.initState();
    _finishedController = ScrollController();
    _chargingController = ScrollController();
    _exportController = ScrollController();
    _qcController = ScrollController();
  }

  @override
  void dispose() {
    _finishedController.dispose();
    _chargingController.dispose();
    _exportController.dispose();
    _qcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surfaceContainerLowest,
      appBar: CustomAppBar(
        centerTitle: false,
        title: context.l10n.chooseParkingLocation,
        subtitle: context.l10n.businessAreaClassification,
      ),
      body: Column(
        children: [
          ParkingTabBarSection(
            selectedTab: _selectedTab,
            onTabChanged: (tab) => setState(() => _selectedTab = tab),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.appSpacing.pageHorizontal,
              ),
              child: _buildTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case ParkingTab.finished:
        return ScrollableGridView<int>(
          controller: _finishedController,
          isLoading: false,
          items: List<int>.generate(100, (i) => i),
          noRecordFoundWidget: const SizedBox.shrink(),
          crossAxisCount: 2,
          mainAxisSpacing: AppSpacing.gridSpacing,
          crossAxisSpacing: AppSpacing.gridSpacing,
          childAspectRatio: 0.87,
          itemBuilder: (context, index, item) {
            return ParkingGridItem(
              label: 'A${index + 1}',
              current: (index + 1) * 20,
              total: 400,
              onPressed: () {
                ParkingSelectionBottomSheet.show(
                  context,
                  factory: 'GA',
                  area: '12B-12C',
                  position: '${index + 1}',
                );
              },
            );
          },
        );

      case ParkingTab.charging:
        return ScrollList<int>(
          controller: _chargingController,
          isLoading: false,
          items: List<int>.generate(2, (i) => i),
          noRecordFoundWidget: const SizedBox.shrink(),
          itemBuilder: (context, index, item) {
            return ParkingListItem(
              vin: index == 0 ? 'VIN-FLZ-1102' : 'VIN-VNT-9901',
              model: index == 0 ? 'FELIZ S' : 'VENTO S',
              station: 'Trạm 0${index + 1}',
              entryTime: index == 0
                  ? '08:30 - 15/05/2024'
                  : '10:15 - 15/05/2024',
            );
          },
        );

      case ParkingTab.export:
        return ScrollList<int>(
          controller: _exportController,
          isLoading: false,
          items: List<int>.generate(3, (i) => i),
          noRecordFoundWidget: const SizedBox.shrink(),
          itemBuilder: (context, index, item) {
            return ParkingExportItem(
              name: 'Lồng ${index + 1}',
              orderCount: index == 0 ? 2 : (index == 1 ? 1 : 0),
            );
          },
        );

      case ParkingTab.qc:
        return ScrollList<int>(
          controller: _qcController,
          isLoading: false,
          items: List<int>.generate(1, (i) => i),
          noRecordFoundWidget: const SizedBox.shrink(),
          itemBuilder: (context, index, item) {
            return ParkingQCItem(
              name: 'Khu QC 01',
              remaining: 1,
              total: 10,
              onPressed: () {
                AppRoutes.navigateToFactoryMap(context);
              },
            );
          },
        );
    }
  }
}
