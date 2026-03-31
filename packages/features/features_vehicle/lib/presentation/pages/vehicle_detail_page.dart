import 'package:design_system/design_system.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_actions_section.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_detail_info_card.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_location_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class VehicleDetailPage extends StatelessWidget {
  const VehicleDetailPage({super.key, this.vehicle});

  final VehicleEntity? vehicle;

  @override
  Widget build(BuildContext context) {
    final zone = vehicle?.parkingLot?.parkingZone.name ?? '';
    final lot = vehicle?.parkingLot?.name ?? '';
    final location = [zone, lot].where((s) => s.isNotEmpty).join(' - ');

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(title: context.l10n.vehicleDetailTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appSpacing.pageHorizontal,
          ),
          child: Column(
            children: [
              const Gap(AppSpacing.sectionSpacing),
              VehicleDetailInfoCard(
                vin: vehicle?.serialNumber ?? '-',
                model: vehicle?.model ?? '-',
                colorName: vehicle?.color ?? '-',
                batteryLevel: 0,
                aging: vehicle?.storageDays ?? 0,
                statuses: vehicle != null ? [vehicle!.statusLabel] : [],
              ),
              const Gap(AppSpacing.sectionSpacing),
              VehicleLocationCard(
                locationName: location.isNotEmpty ? location : '-',
                factoryName: vehicle?.factory?.name ?? '-',
              ),
              const Gap(AppSpacing.sectionSpacing),
              VehicleActionsSection(
                onMoveToAction: () {
                  AppRoutes.navigateToChooseParkingLocation(context);
                },
                onMoveFromAction: () {
                  AppRoutes.navigateToChooseParkingLocation(context);
                },
              ),
              const Gap(AppSpacing.sectionSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
