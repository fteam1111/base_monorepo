import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class HomeUserSection extends StatelessWidget {
  const HomeUserSection({
    super.key,
    required this.userName,
    required this.location,
  });

  final String userName;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacing.cardMargin),
      padding: EdgeInsets.all(context.appSpacing.cardPadding),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.extraLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              userName,
              style: context.appTypography.sectionHeader.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppIcons.icLocation,
                package: AppAssets.package,
                width: AppSpacing.iconDefault,
                height: AppSpacing.iconDefault,
                color: context.theme.colorScheme.primary,
              ),
              const Gap(AppSpacing.tiny),
              Text(
                location,
                style: context.appTypography.bodyLarge.copyWith(
                  color: context.theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
