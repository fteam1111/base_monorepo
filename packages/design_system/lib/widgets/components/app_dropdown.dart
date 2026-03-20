import 'package:design_system/design_system.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

class AppDropdownItem<T> {
  const AppDropdownItem({
    required this.value,
    required this.label,
    this.enabled = true,
  });

  final T value;
  final String label;
  final bool enabled;
}

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hintText,
    this.isExpanded = true,
    this.maxDropdownHeight = 260,
  });

  final List<AppDropdownItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? hintText;
  final bool isExpanded;
  final double maxDropdownHeight;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final typography = context.appTypography;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: isExpanded,

        hint: hintText == null
            ? null
            : Text(
                hintText ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: typography.labelMedium.copyWith(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.65),
                  fontWeight: FontWeight.w500,
                ),
              ),

        items: items.map((e) {
          final isSelected = e.value == value;

          return DropdownMenuItem<T>(
            value: e.value,
            enabled: e.enabled,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                alignment: Alignment.centerLeft,

                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),

                decoration: BoxDecoration(
                  borderRadius: isSelected
                      ? BorderRadius.zero
                      : BorderRadius.circular(AppRadius.md),

                  color: isSelected
                      ? colorScheme.primary.withValues(alpha: 0.10)
                      : Colors.transparent,
                ),

                child: Text(
                  e.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: typography.labelMedium.copyWith(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        }).toList(),

        value: value,
        onChanged: onChanged,

        selectedItemBuilder: (_) {
          return items.map((item) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: typography.labelMedium.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }).toList();
        },

        buttonStyleData: ButtonStyleData(
          height: AppSpacing.huge,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppRadius.input),
            border: Border.all(color: colorScheme.outline),
          ),
        ),

        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.expand_more_rounded,
            color: colorScheme.onSurfaceVariant,
          ),
          iconSize: AppSpacing.iconInline,
        ),

        dropdownStyleData: DropdownStyleData(
          maxHeight: maxDropdownHeight,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.9),
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          elevation: 0,
          offset: const Offset(0, 6),
        ),

        menuItemStyleData: const MenuItemStyleData(
          height: AppSpacing.massive,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
