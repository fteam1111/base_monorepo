import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryVinItemCard extends StatelessWidget {
  const DeliveryVinItemCard({
    super.key,
    required this.vinCode,
    required this.modelName,
    required this.colorName,
    required this.area,
    required this.position,
    required this.fifoNumber,
    required this.warehouseDate,
    required this.colorValue,
  });

  final String vinCode;
  final String modelName;
  final String colorName;
  final String area;
  final String position;
  final int fifoNumber;
  final String warehouseDate;
  final Color colorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingSM),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppIconContainer(
                      icon: Icon(Icons.motorcycle),
                      size: AppSpacing.massive,
                      borderRadius: AppRadius.lg,
                    ),
                    const Gap(AppSpacing.paddingSM),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  vinCode,
                                  style: context.appTypography.titleMedium
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: context.colorScheme.onSurface,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: AppSpacing.paddingXS,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.paddingSM,
                                  vertical: AppSpacing.paddingXXXS,
                                ),
                                decoration: BoxDecoration(
                                  color: context.colorScheme.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.sm,
                                  ),
                                ),
                                child: Text(
                                  context.l10n.fifoBadge(fifoNumber),
                                  style: context.appTypography.labelSmall
                                      .copyWith(
                                        color: context.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(AppSpacing.paddingXXXS),
                          Row(
                            children: [
                              Text(
                                modelName.toUpperCase(),
                                style: context.appTypography.labelSmall
                                    .copyWith(
                                      color: context
                                          .colorScheme
                                          .onSurfaceVariant
                                          .withValues(alpha: 0.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Gap(AppSpacing.paddingXS),
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.onSurfaceVariant
                                      .withValues(alpha: 0.3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const Gap(AppSpacing.paddingXS),
                              Icon(Icons.circle, size: 8, color: colorValue),
                              const Gap(AppSpacing.paddingXXXS),
                              Text(
                                colorName.toUpperCase(),
                                style: context.appTypography.labelSmall
                                    .copyWith(
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Gap(AppSpacing.paddingMD),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: AppSpacing.iconInline,
                            color: context.colorScheme.primary,
                          ),
                          const Gap(AppSpacing.paddingXS),
                          Expanded(
                            child: Text(
                              context.l10n.locationFormat(area, position),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.appTypography.labelSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(AppSpacing.paddingSM),
                    Flexible(
                      child: Text(
                        context.l10n.warehouse(warehouseDate),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: context.appTypography.labelSmall.copyWith(
                          color: context.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.5),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
