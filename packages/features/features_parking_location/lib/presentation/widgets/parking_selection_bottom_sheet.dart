import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class ParkingSelectionBottomSheet extends StatelessWidget {
  const ParkingSelectionBottomSheet({
    super.key,
    required this.factory,
    required this.area,
    required this.position,
    this.onConfirm,
  });

  final String factory;
  final String area;
  final String position;
  final VoidCallback? onConfirm;

  static Future<void> show(
    BuildContext context, {
    required String factory,
    required String area,
    required String position,
    VoidCallback? onConfirm,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: false,
      useSafeArea: true,
      builder: (context) {
        return ParkingSelectionBottomSheet(
          factory: factory,
          area: area,
          position: position,
          onConfirm: onConfirm,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Container(
      padding: EdgeInsets.only(
        left: context.appSpacing.pageHorizontal,
        right: context.appSpacing.pageHorizontal,
        top: AppSpacing.paddingSM,
        bottom: AppSpacing.paddingSM + context.bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSpacing.xxl,
            height: AppSpacing.xxxs,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
          ),
          const Gap(AppSpacing.paddingMD),
          Text(
            context.l10n.youSelectedParkingSlot,
            style: context.appTypography.sectionHeader.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(AppSpacing.sectionPadding),
          _KeyValueRow(label: context.l10n.factory, value: factory),
          const Gap(AppSpacing.paddingSM),
          _KeyValueRow(label: context.l10n.area, value: area),
          const Gap(AppSpacing.paddingSM),
          _KeyValueRow(label: context.l10n.position, value: position),
          const Gap(AppSpacing.sectionPadding),
          Divider(color: colorScheme.outlineVariant, height: 1),
          const Gap(AppSpacing.sectionPadding),
          Text(
            context.l10n.parkingSelectionNote,
            style: context.appTypography.bodySmall.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(AppSpacing.sectionPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConfirm ?? () => Navigator.of(context).pop(),
              style: context.primaryButtonStyle,
              child: Text(context.l10n.confirmParkingSelection),
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  const _KeyValueRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: context.appTypography.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          value,
          style: context.appTypography.bodyMedium.copyWith(
            color: colorScheme.error,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
