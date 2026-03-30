import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_bloc.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_event.dart';
import 'package:features_delivery_order/features_delivery_detail/presentation/bloc/delivery_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Filter section with VIN search and combined model-color dropdown.
class DeliveryFilterSection extends StatefulWidget {
  const DeliveryFilterSection({super.key});

  @override
  State<DeliveryFilterSection> createState() => _DeliveryFilterSectionState();
}

class _DeliveryFilterSectionState extends State<DeliveryFilterSection> {
  String _selectedCombo = 'all';
  final Debounce _debounce = Debounce(delay: const Duration(milliseconds: 500));

  @override
  void dispose() {
    _debounce.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryDetailBloc, DeliveryDetailState>(
      builder: (context, state) {
        final items = state.deliveryOrder?.items ?? [];

        // Build unique "model - color" combinations from DO items.
        final combos = items
            .map((e) => '${e.vehicleModel} - ${e.color}')
            .toSet()
            .toList();

        if (_selectedCombo != 'all' && !combos.contains(_selectedCombo)) {
          _selectedCombo = 'all';
        }

        final comboItems = <AppDropdownItem<String>>[
          AppDropdownItem(value: 'all', label: context.l10n.allModels),
          ...combos.map((c) => AppDropdownItem(value: c, label: c)),
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
              AppDropdown<String>(
                hintText: context.l10n.allModels,
                value: _selectedCombo,
                items: comboItems,
                onChanged: (value) {
                  setState(() => _selectedCombo = value ?? 'all');
                  _applyComboFilter(context, value);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _applyComboFilter(BuildContext context, String? value) {
    String? model;
    String? color;

    if (value != null && value != 'all') {
      final parts = value.split(' - ');
      if (parts.length == 2) {
        model = parts[0];
        color = parts[1];
      }
    }

    context.read<DeliveryDetailBloc>().add(
      DeliveryDetailModelFilterChanged(model),
    );
    context.read<DeliveryDetailBloc>().add(
      DeliveryDetailColorFilterChanged(color),
    );
    context.read<DeliveryDetailBloc>().add(
      const DeliveryDetailSuggestedVehiclesRequested(),
    );
  }
}
