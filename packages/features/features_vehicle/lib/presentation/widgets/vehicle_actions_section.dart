import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class VehicleActionsSection extends StatelessWidget {
  const VehicleActionsSection({
    super.key,
    required this.onMoveToAction,
    required this.onMoveFromAction,
  });

  final VoidCallback onMoveToAction;
  final VoidCallback onMoveFromAction;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.availableActions,
          style: typography.bodySmall.copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const Gap(AppSpacing.sectionSpacing),
        _ActionLargeButton(
          title: context.l10n.moveToExportArea,
          subtitle: context.l10n.prepareForDelivery,
          backgroundColor: context.colorScheme.error,
          icon: Icons.local_shipping_outlined,
          onPressed: onMoveToAction,
        ),
        const Gap(AppSpacing.sectionSpacing),
        _ActionLargeButton(
          title: context.l10n.moveToQCArea,
          subtitle: context.l10n.recheckQuality,
          backgroundColor: context.theme.primaryColor,
          icon: Icons.verified_user_outlined,
          onPressed: onMoveFromAction,
        ),
      ],
    );
  }
}

class _ActionLargeButton extends StatelessWidget {
  const _ActionLargeButton({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(AppRadius.extraLarge),
      elevation: 4,
      shadowColor: backgroundColor.withValues(alpha: 0.6),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.extraLarge),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingSM),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.paddingXS),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: AppSpacing.iconAction,
                ),
              ),
              const Gap(AppSpacing.paddingSM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: typography.bodyMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: typography.bodySmall.copyWith(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: AppSpacing.iconDefault,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
