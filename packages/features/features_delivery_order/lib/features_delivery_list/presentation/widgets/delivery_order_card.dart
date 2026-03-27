import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_status.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryOrderCard extends StatelessWidget {
  const DeliveryOrderCard({
    super.key,
    required this.doCode,
    required this.status,
    required this.modelName,
    this.colorCode,
    this.colorName,
    required this.quantity,
    required this.deadline,
    required this.progress,
    this.onTap,
  });

  final String doCode;
  final DeliveryOrderStatus status;
  final String modelName;
  final String? colorCode;
  final String? colorName;
  final int quantity;
  final String deadline;
  final double progress;
  final VoidCallback? onTap;

  bool get _hasColorInfo =>
      (colorCode != null && colorCode!.isNotEmpty) ||
      (colorName != null && colorName!.isNotEmpty);

  String get _colorDisplayText {
    final code = colorCode ?? '';
    final name = colorName ?? '';
    if (code.isNotEmpty && name.isNotEmpty) {
      return '$code ($name)';
    }
    return code.isNotEmpty ? code : name;
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.paddingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const Gap(AppSpacing.paddingSM),
          _buildInfoSection(context),
          const Gap(AppSpacing.paddingSM),
          _buildProgress(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.deliveryOrderCodeLabel,
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
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCard(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.paddingXXXS,
                horizontal: AppSpacing.paddingXS,
              ),
              backgroundColor: status.backgroundLabel(context),
              shadowColor: Colors.transparent,
              child: Text(
                status.label(context),
                style: AppTypography.labelMedium.copyWith(
                  color: status.labelColor(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(AppSpacing.paddingXXXS),
            Icon(
              Icons.chevron_right,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return CustomCard(
      backgroundColor: context.colorScheme.primary.withValues(alpha: 0.05),
      borderColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const AppIconContainer(
                      icon: Icon(Icons.motorcycle),
                      size: AppSpacing.xl,
                      borderRadius: AppRadius.md,
                    ),
                    const Gap(AppSpacing.paddingXS),
                    Expanded(
                      child: _buildDetailCol(
                        context,
                        context.l10n.deliveryOrderVehicleModelLabel,
                        child: _buildValueText(
                          context,
                          modelName,
                          isItalic: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(AppSpacing.paddingXS),
              if (_hasColorInfo)
                Expanded(
                  child: _buildDetailCol(
                    context,
                    context.l10n.deliveryOrderColorLabel,
                    textAlign: TextAlign.end,
                    child: _buildCardValue(context, _colorDisplayText),
                  ),
                ),
            ],
          ),
          Divider(
            height: AppSpacing.paddingMD,
            color: context.colorScheme.outline,
          ),
          Row(
            children: [
              Expanded(
                child: _buildDetailCol(
                  context,
                  context.l10n.deliveryOrderQuantityLabel,
                  child: _buildValueText(
                    context,
                    '$quantity ${context.l10n.deliveryOrderQuantityUnit}',
                  ),
                ),
              ),
              const Gap(AppSpacing.paddingXS),
              Expanded(
                child: _buildDetailCol(
                  context,
                  context.l10n.deliveryOrderDeadlineLabel,
                  textAlign: TextAlign.end,
                  child: _buildValueText(
                    context,
                    deadline,
                    valueColor: status == DeliveryOrderStatus.ready
                        ? null
                        : context.colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.deliveryOrderCompletionProgressLabel,
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
        const Gap(AppSpacing.paddingXS),
        AppLinearProgressIndicator(value: progress, minHeight: 8),
      ],
    );
  }

  Widget _buildDetailCol(
    BuildContext context,
    String label, {
    required Widget child,
    TextAlign textAlign = TextAlign.start,
  }) {
    final isEnd = textAlign == TextAlign.end;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isEnd
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
            style: AppTypography.labelSmall.copyWith(
              color: context.colorScheme.onSurfaceVariant.withValues(
                alpha: 0.6,
              ),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(AppSpacing.paddingXXXS),
          Align(
            alignment: isEnd ? Alignment.centerRight : Alignment.centerLeft,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildValueText(
    BuildContext context,
    String value, {
    bool isItalic = false,
    Color? valueColor,
  }) {
    return Text(
      value,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.appTypography.bodyMedium.copyWith(
        fontWeight: FontWeight.bold,
        fontStyle: isItalic ? FontStyle.italic : null,
        color: valueColor ?? context.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildCardValue(BuildContext context, String value) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingXXXS),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(AppRadius.sm),
      ),
      child: _buildValueText(context, value),
    );
  }
}
