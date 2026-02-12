import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryDetailHeaderCard extends StatelessWidget {
  const DeliveryDetailHeaderCard({
    super.key,
    required this.customerName,
    required this.modelName,
    required this.colorCode,
    required this.colorName,
    required this.currentProgress,
    required this.totalQuantity,
  });

  final String customerName;
  final String modelName;
  final String colorCode;
  final String colorName;
  final int currentProgress;
  final int totalQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingSM),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoCol(context, context.l10n.customer, customerName),
              _buildInfoCol(
                context,
                context.l10n.vehicleModel,
                modelName,
                valueStyle: context.appTypography.titleMedium.copyWith(
                  color: context.colorScheme.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          const Gap(AppSpacing.paddingMD),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoCol(
                context,
                context.l10n.vehicleColor,
                '$colorCode ($colorName)',
                prefixIcon: Icon(
                  Icons.circle,
                  size: AppSpacing.paddingXS,
                  color: context.colorScheme.secondary,
                ),
              ),
              _buildInfoCol(
                context,
                context.l10n.progress,
                '$currentProgress/$totalQuantity ${context.l10n.deliveryOrderQuantityUnit}',
                textAlign: TextAlign.end,
              ),
            ],
          ),
          const Gap(AppSpacing.paddingMD),
          AppLinearProgressIndicator(
            value: totalQuantity > 0 ? currentProgress / totalQuantity : 0,
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCol(
    BuildContext context,
    String label,
    String value, {
    TextStyle? valueStyle,
    TextAlign textAlign = TextAlign.start,
    Widget? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.start
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: context.appTypography.labelSmall.copyWith(
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(AppSpacing.paddingXXXS),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon,
              const Gap(AppSpacing.paddingXXXS),
            ],
            Flexible(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    valueStyle ??
                    context.appTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
