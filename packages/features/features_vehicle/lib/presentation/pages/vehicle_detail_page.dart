import 'package:design_system/design_system.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_actions_section.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_detail_info_card.dart';
import 'package:features_vehicle/presentation/widgets/vehicle_location_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class VehicleDetailPage extends StatelessWidget {
  const VehicleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const VehicleDetailInfoCard(
                vin: 'VIN-520544',
                model: 'Klara S2 (2024)',
                colorName: 'Xanh Blue (B02)',
                batteryLevel: 72,
                aging: 32,
                statuses: ['ĐÃ ĐỖ XE', 'QC PASS'],
              ),
              const Gap(AppSpacing.sectionSpacing),
              const VehicleLocationCard(
                locationName: 'ZONE A - BLOCK A02',
                factoryName: 'FACTORY HT',
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
