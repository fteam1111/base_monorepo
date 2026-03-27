import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

class DeliveryFilterSection extends StatefulWidget {
  const DeliveryFilterSection({super.key});

  @override
  State<DeliveryFilterSection> createState() => _DeliveryFilterSectionState();
}

class _DeliveryFilterSectionState extends State<DeliveryFilterSection> {
  String? _selectedModel = 'all';
  String? _selectedColor = 'all';
  final Debounce _debounce = Debounce(delay: const Duration(milliseconds: 500));

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

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

    return CustomCard(
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
          AppTextField.search(
            hintText: context.l10n.findVinCode,
            onChanged: (value) {
              _debounce(() {
                if (!mounted) return;
                context.read<DeliveryDetailBloc>().add(
                  DeliveryDetailVinFilterChanged(value),
                );
                context.read<DeliveryDetailBloc>().add(
                  const DeliveryDetailSuggestedVehiclesRequested(),
                );
              });
            },
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
                    context.read<DeliveryDetailBloc>().add(
                      DeliveryDetailModelFilterChanged(
                        value == 'all' ? null : value,
                      ),
                    );
                    context.read<DeliveryDetailBloc>().add(
                      const DeliveryDetailSuggestedVehiclesRequested(),
                    );
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
                    context.read<DeliveryDetailBloc>().add(
                      DeliveryDetailColorFilterChanged(
                        value == 'all' ? null : value,
                      ),
                    );
                    context.read<DeliveryDetailBloc>().add(
                      const DeliveryDetailSuggestedVehiclesRequested(),
                    );
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
