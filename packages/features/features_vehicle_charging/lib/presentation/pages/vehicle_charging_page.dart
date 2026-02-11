import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:features_vehicle_charging/presentation/widgets/charging_info_dialog.dart';
import 'package:features_vehicle_charging/presentation/widgets/vehicle_charging_app_bar_title.dart';
import 'package:features_vehicle_charging/presentation/widgets/vehicle_charging_list.dart';
import 'package:features_vehicle_charging/presentation/widgets/vehicle_charging_search_bar.dart';
import 'package:share/share.dart';

class VehicleChargingPage extends StatefulWidget {
  const VehicleChargingPage({super.key});

  @override
  State<VehicleChargingPage> createState() => _VehicleChargingPageState();
}

class _VehicleChargingPageState extends State<VehicleChargingPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <VehicleChargingItemModel>[
      const VehicleChargingItemModel(
        vin: 'VIN-FLZ-1102',
        model: 'FELIZ S',
        station: 'Trạm 01',
        timeIn: '08:30 - 15/05/2024',
        statusText: 'ĐANG SẠC',
        isCharging: true,
        checkAgingDate: '2025-12-01',
      ),
      const VehicleChargingItemModel(
        vin: 'VIN-VNT-9901',
        model: 'VENTO S',
        station: 'Trạm 02',
        timeIn: '10:15 - 15/05/2024',
        statusText: 'ĐANG SẠC',
        isCharging: true,
        checkAgingDate: '2025-12-01',
      ),
      const VehicleChargingItemModel(
        vin: 'VIN-KLR-8821',
        model: 'KLARA S2',
        station: 'Trạm 03',
        timeIn: '13:45 - 15/05/2024',
        statusText: 'ĐANG SẠC',
        isCharging: true,
        checkAgingDate: '2025-12-01',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        titleSpacing: AppSpacing.none,
        title: const VehicleChargingAppBarTitle(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.primary),
          onPressed: () => AppRoutes.navigateBack(context),
        ),
      ),
      body: Column(
        children: [
          VehicleChargingSearchBar(controller: _searchController),
          Expanded(
            child: VehicleChargingList(
              items: items,
              onTapInfo: (item) => _showChargingInfoDialog(context, item),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showChargingInfoDialog(
    BuildContext context,
    VehicleChargingItemModel item,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return ChargingInfoDialog(item: item);
      },
    );
  }
}

class VehicleChargingItemModel {
  const VehicleChargingItemModel({
    required this.vin,
    required this.model,
    required this.station,
    required this.timeIn,
    required this.statusText,
    required this.isCharging,
    required this.checkAgingDate,
  });

  final String vin;
  final String model;
  final String station;
  final String timeIn;
  final String statusText;
  final bool isCharging;
  final String checkAgingDate;
}
