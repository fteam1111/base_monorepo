import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !context.isKeyboardVisible,
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        child: SizedBox(
          height: AppSpacing.gigantic,
          width: AppSpacing.gigantic,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingXS),
            child: Image.asset(
              AppIcons.icScanQr,
              package: AppAssets.package,
              color: AppColors.brandPrimary,
            ),
          ),
        ),
        //params
      ),
    );
  }
}
