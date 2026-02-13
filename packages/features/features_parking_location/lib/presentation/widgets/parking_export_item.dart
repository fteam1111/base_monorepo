import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ParkingExportItem extends StatelessWidget {
  const ParkingExportItem({
    super.key,
    required this.name,
    required this.orderCount,
    this.onPressed,
  });

  final String name;
  final int orderCount;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return CustomCard(
      onTap: onPressed,
      child: Row(
        children: [
          AppIconContainer(
            icon: Icon(
              Icons.local_shipping_outlined,
              color: colorScheme.primary,
            ),
          ),
          const Gap(AppSpacing.paddingSM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.appTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(AppSpacing.xxxs),
                Text(
                  context.l10n.deliveryOrders('$orderCount'),
                  style: context.appTypography.bodySmall.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.05,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}
