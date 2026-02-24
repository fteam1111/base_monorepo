import 'package:design_system/app_assets/app_assets.dart';
import 'package:design_system/theme/tokens/colors.dart';
import 'package:design_system/theme/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/extensions/context_ext.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.onSuffixTap,
    this.hintText,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.style,
    this.cursorColor,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onSuffixTap;

  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;

  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  final TextAlign textAlign;

  final TextStyle? style;
  final Color? cursorColor;

  final List<TextInputFormatter>? inputFormatters;

  factory AppTextField.search({
    Key? key,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onSuffixTap,
    Widget? suffix,
    String? hintText,
  }) {
    return AppTextField(
      key: key,
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onSuffixTap: onSuffixTap,
      hintText: hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.paddingXS),
        child: Image.asset(
          AppIcons.icSearch,
          package: AppAssets.package,
          height: AppSpacing.mediumLarge,
          width: AppSpacing.mediumLarge,
          color: AppColors.secondaryLight,
        ),
      ),
      suffix: suffix ??
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.paddingXS),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onSuffixTap,
              child: Image.asset(
                AppIcons.icScanQr,
                package: AppAssets.package,
                height: AppSpacing.mediumLarge,
                width: AppSpacing.mediumLarge,
                color: AppColors.secondaryLight,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      onTapOutside: onTapOutside ?? (_) => context.unfocus(),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofocus: autofocus,
      readOnly: readOnly,
      enabled: enabled,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textAlign: textAlign,
      style: style,
      cursorColor: cursorColor,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSpacing.paddingXS,
          horizontal: AppSpacing.paddingXS,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: AppSpacing.xxxl,
          maxWidth: AppSpacing.xxxl,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: AppSpacing.xxxl,
          maxWidth: AppSpacing.xxxl,
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
