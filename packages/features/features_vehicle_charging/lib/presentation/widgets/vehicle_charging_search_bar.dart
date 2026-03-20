import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class VehicleChargingSearchBar extends StatelessWidget {
  const VehicleChargingSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: AppTextField.search(
        controller: controller,
        hintText: context.l10n.vehicleChargingSearchHint,
      ),
    );
  }
}
