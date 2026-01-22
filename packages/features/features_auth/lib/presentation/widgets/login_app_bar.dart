import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class LoginAppBar extends StatelessWidget {
  final VoidCallback onBack;
  final bool canBack;

  const LoginAppBar({super.key, required this.onBack, required this.canBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.statusBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: context.appSpacing.pageHorizontal),
          child: Visibility(
            visible: canBack,
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onBack,
                  child: SizedBox(
                    height: context.statusBarHeight,
                    width: AppSpacing.huge,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          width: AppSpacing.mediumLarge,
                          height: AppSpacing.mediumLarge,
                          AppIcons.icBackArrow,
                          package: AppAssets.package,
                          color: AppColors.primaryLight.withValues(alpha: 0.71),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Login',
                    style: AppTypography.sectionHeader,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
