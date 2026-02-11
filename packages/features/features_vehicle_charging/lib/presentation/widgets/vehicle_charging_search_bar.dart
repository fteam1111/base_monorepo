import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class VehicleChargingSearchBar extends StatelessWidget {
  const VehicleChargingSearchBar({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: context.l10n.vehicleChargingSearchHint,
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppSpacing.paddingXS,
            horizontal: AppSpacing.paddingMD,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingXS),
            child: Image.asset(
              height: AppSpacing.medium,
              width: AppSpacing.medium,
              AppIcons.icSearch,
              package: AppAssets.package,
              color: AppColors.secondaryLight,
            ),
          ),
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }
}
