import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class VehicleChargingAppBarTitle extends StatelessWidget {
  const VehicleChargingAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.vehicleChargingAreaTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appTypography.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppSpacing.tiny),
        Text(
          context.l10n.vehicleChargingAreaSubtitle,
          overflow: TextOverflow.ellipsis,
          style: context.appTypography.labelSmall.copyWith(
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
