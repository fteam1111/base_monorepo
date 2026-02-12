import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryFilterSection extends StatefulWidget {
  const DeliveryFilterSection({super.key});

  @override
  State<DeliveryFilterSection> createState() => _DeliveryFilterSectionState();
}

class _DeliveryFilterSectionState extends State<DeliveryFilterSection> {
  String? _selectedModel;
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    final modelItems = <AppDropdownItem<String>>[
      AppDropdownItem(value: 'all', label: context.l10n.allModels),
      const AppDropdownItem(value: 'klara_s2', label: 'Klara S2'),
      const AppDropdownItem(value: 'vento_s', label: 'Vento S'),
      const AppDropdownItem(value: 'feliz_s', label: 'Feliz S'),
    ];

    final colorItems = <AppDropdownItem<String>>[
      AppDropdownItem(value: 'all', label: context.l10n.allColors),
      const AppDropdownItem(value: 'blue', label: 'Xanh Blue'),
      const AppDropdownItem(value: 'red', label: 'Đỏ'),
      const AppDropdownItem(value: 'white', label: 'Trắng'),
    ];

    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingMD),
      decoration: BoxDecoration(
        color: context.appColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.xxl),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.filter_alt_outlined,
                size: AppSpacing.iconInline,
                color: context.colorScheme.primary,
              ),
              const Gap(AppSpacing.paddingXS),
              Text(
                context.l10n.filterList,
                style: context.appTypography.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const Gap(AppSpacing.paddingSM),
          TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppSpacing.paddingXS,
                horizontal: AppSpacing.paddingMD,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(AppSpacing.paddingXS),
                child: Image.asset(
                  AppIcons.icSearch,
                  package: AppAssets.package,
                  height: AppSpacing.iconXS,
                  width: AppSpacing.iconXS,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
              hintText: context.l10n.findVinCode,
            ).applyDefaults(Theme.of(context).inputDecorationTheme),
          ),
          const Gap(AppSpacing.paddingSM),
          Row(
            children: [
              Expanded(
                child: AppDropdown<String>(
                  hintText: context.l10n.allModels,
                  value: _selectedModel,
                  items: modelItems,
                  onChanged: (value) {
                    setState(() => _selectedModel = value);
                  },
                ),
              ),
              const Gap(AppSpacing.paddingSM),
              Expanded(
                child: AppDropdown<String>(
                  hintText: context.l10n.allColors,
                  value: _selectedColor,
                  items: colorItems,
                  onChanged: (value) {
                    setState(() => _selectedColor = value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
