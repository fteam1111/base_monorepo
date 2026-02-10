import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

enum DeliveryOrderStatus {
  preparing,
  ready;

  String get label {
    switch (this) {
      case DeliveryOrderStatus.preparing:
        return 'ĐANG CHUẨN BỊ';
      case DeliveryOrderStatus.ready:
        return 'SẴN SÀNG';
    }
  }

  Color labelColor(BuildContext context) {
    switch (this) {
      case DeliveryOrderStatus.preparing:
        return context.colorScheme.primary;
      case DeliveryOrderStatus.ready:
        return AppColors.successLight;
    }
  }

  Color backgroundLabel(BuildContext context) {
    switch (this) {
      case DeliveryOrderStatus.preparing:
        return context.colorScheme.primary.withValues(alpha: 0.1);
      case DeliveryOrderStatus.ready:
        return AppColors.successLight.withValues(alpha: 0.1);
    }
  }
}

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({
    super.key,
    required this.doCode,
    required this.status,
    required this.modelName,
    required this.colorCode,
    required this.colorName,
    required this.quantity,
    required this.deadline,
    required this.progress,
    this.onTap,
  });

  final String doCode;
  final DeliveryOrderStatus status;
  final String modelName;
  final String colorCode;
  final String colorName;
  final int quantity;
  final String deadline;
  final double progress; // 0.0 to 1.0
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.appColors.cardBackground,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingMD),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MÃ LỆNH GIAO HÀNG',
                        style: AppTypography.labelSmall.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        doCode,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSpacing.paddingXXXS,
                              horizontal: AppSpacing.paddingXS,
                            ),
                            decoration: BoxDecoration(
                              color: status.backgroundLabel(context),
                              borderRadius: BorderRadius.circular(AppRadius.sm),
                            ),
                            child: Text(
                              status.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.labelMedium.copyWith(
                                color: status.labelColor(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.paddingXXXS),
                        Icon(
                          Icons.chevron_right,
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingMD),
              Container(
                padding: const EdgeInsets.all(AppSpacing.paddingSM),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    const AppIconContainer(
                                      icon: Icon(Icons.motorcycle),
                                      size: AppSpacing.xl,
                                      borderRadius: AppRadius.md,
                                    ),
                                    const SizedBox(width: AppSpacing.paddingXS),
                                    _buildDetailCol(
                                      context,
                                      'MODEL XE',
                                      modelName,
                                      isItalic: true,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: AppSpacing.paddingXS),
                              Flexible(
                                child: _buildDetailCol(
                                  context,
                                  'MÀU SẮC',
                                  '$colorCode ($colorName)',
                                  textAlign: TextAlign.end,
                                  isCard: true,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: AppSpacing.paddingMD,
                            color: context.colorScheme.outline,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: _buildDetailCol(
                                  context,
                                  'SỐ LƯỢNG',
                                  '$quantity CHIẾC',
                                ),
                              ),
                              const SizedBox(width: AppSpacing.paddingXS),
                              Flexible(
                                child: _buildDetailCol(
                                  context,
                                  'DEADLINE',
                                  deadline,
                                  valueColor:
                                      status == DeliveryOrderStatus.ready
                                      ? null
                                      : context.colorScheme.error,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingMD),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TIẾN ĐỘ HOÀN THÀNH',
                    style: AppTypography.labelSmall.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: AppTypography.labelSmall.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingXS),
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.full),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: context.colorScheme.primary.withValues(
                    alpha: 0.1,
                  ),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    context.colorScheme.primary,
                  ),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCol(
    BuildContext context,
    String label,
    String value, {
    bool isItalic = false,
    Color? valueColor,
    TextAlign textAlign = TextAlign.start,
    bool isCard = false,
  }) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.start
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.labelSmall.copyWith(
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: isCard
                ? Border.all(color: context.colorScheme.outline)
                : null,
            color: isCard ? AppColors.onBackgroundDark : null,
            borderRadius: isCard ? BorderRadius.circular(AppRadius.sm) : null,
          ),
          padding: isCard ? const EdgeInsets.all(AppSpacing.paddingXXXS) : null,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: isCard
                ? context.appTypography.bodySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    fontStyle: isItalic ? FontStyle.italic : null,
                    color: valueColor ?? context.colorScheme.onSurface,
                  )
                : context.appTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontStyle: isItalic ? FontStyle.italic : null,
                    color: valueColor ?? context.colorScheme.onSurface,
                  ),
          ),
        ),
      ],
    );
  }
}
