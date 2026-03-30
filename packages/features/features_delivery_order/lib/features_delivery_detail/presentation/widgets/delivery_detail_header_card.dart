import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class _HeaderItem {
  _HeaderItem(this.label, this.value, {this.valueStyle, this.prefixIcon});
  final String label;
  final String value;
  final TextStyle? valueStyle;
  final Widget? prefixIcon;
}

class DeliveryDetailHeaderCard extends StatelessWidget {
  const DeliveryDetailHeaderCard({
    super.key,
    this.customerName,
    this.modelName,
    this.colorCode,
    this.colorName,
    required this.currentProgress,
    required this.totalQuantity,
  });

  final String? customerName;
  final String? modelName;
  final String? colorCode;
  final String? colorName;
  final int currentProgress;
  final int totalQuantity;

  bool get _hasCustomer => customerName != null && customerName!.isNotEmpty;

  bool get _hasModel => modelName != null && modelName!.isNotEmpty;

  bool get _hasColorInfo =>
      (colorCode != null && colorCode!.isNotEmpty) ||
      (colorName != null && colorName!.isNotEmpty);

  bool get _hasQuantity => totalQuantity > 0;

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
    final infoItems = <_HeaderItem>[];

    if (_hasCustomer) {
      infoItems.add(_HeaderItem(context.l10n.customer, customerName!));
    }

    if (_hasModel) {
      infoItems.add(
        _HeaderItem(
          context.l10n.vehicleModel,
          modelName!,
          valueStyle: context.appTypography.titleMedium.copyWith(
            color: context.colorScheme.primary,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    if (_hasColorInfo) {
      infoItems.add(
        _HeaderItem(
          context.l10n.vehicleColor,
          _colorDisplayText,
          prefixIcon: Icon(
            Icons.circle,
            size: AppSpacing.paddingXS,
            color: context.colorScheme.secondary,
          ),
        ),
      );
    }

    if (_hasQuantity) {
      infoItems.add(
        _HeaderItem(
          context.l10n.progress,
          '$currentProgress/$totalQuantity ${context.l10n.deliveryOrderQuantityUnit}',
        ),
      );
    }

    final rows = <Widget>[];
    for (var i = 0; i < infoItems.length; i += 2) {
      final leftItem = infoItems[i];
      final rightItem = i + 1 < infoItems.length ? infoItems[i + 1] : null;

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildInfoCol(context, leftItem, isRight: false)),
            const Gap(AppSpacing.paddingXS),
            if (rightItem != null)
              Expanded(child: _buildInfoCol(context, rightItem, isRight: true))
            else
              const Spacer(),
          ],
        ),
      );
      if (i + 2 < infoItems.length) {
        rows.add(const Gap(AppSpacing.paddingXS));
      }
    }

    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...rows,
          if (_hasQuantity) ...[
            const Gap(AppSpacing.paddingXS),
            AppLinearProgressIndicator(
              value: currentProgress / totalQuantity,
              minHeight: 8,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoCol(
    BuildContext context,
    _HeaderItem item, {
    required bool isRight,
  }) {
    return Column(
      crossAxisAlignment: isRight
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          item.label,
          textAlign: isRight ? TextAlign.right : TextAlign.left,
          style: context.appTypography.labelSmall.copyWith(
            color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(AppSpacing.paddingXXXS),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.prefixIcon != null) ...[
              item.prefixIcon!,
              const Gap(AppSpacing.paddingXXXS),
            ],
            Flexible(
              child: Text(
                item.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: isRight ? TextAlign.right : TextAlign.left,
                style:
                    item.valueStyle ??
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
