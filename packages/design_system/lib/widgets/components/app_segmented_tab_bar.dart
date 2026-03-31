import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppSegmentedTabItem {
  final String label;
  final IconData? icon;
  final dynamic value;

  const AppSegmentedTabItem({
    required this.label,
    required this.value,
    this.icon,
  });
}

/// A horizontally scrollable segmented tab bar.
///
/// Automatically scrolls to the [selectedValue] tab on first render
/// and whenever [selectedValue] changes.
class AppSegmentedTabBar extends StatefulWidget {
  const AppSegmentedTabBar({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.height = AppSpacing.huge,
    this.padding,
  });

  final List<AppSegmentedTabItem> items;
  final dynamic selectedValue;
  final ValueChanged<dynamic> onChanged;
  final double height;
  final EdgeInsetsGeometry? padding;

  @override
  State<AppSegmentedTabBar> createState() => _AppSegmentedTabBarState();
}

class _AppSegmentedTabBarState extends State<AppSegmentedTabBar> {
  late final ScrollController _scrollController;

  /// Approximate width of each tab item (icon + text + padding).
  static const double _estimatedTabWidth = 140.0;
  static const double _tabSpacing = AppSpacing.paddingXS;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) => _scrollToSelected());
  }

  @override
  void didUpdateWidget(AppSegmentedTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => _scrollToSelected(),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelected() {
    final selectedIndex = widget.items.indexWhere(
      (item) => item.value == widget.selectedValue,
    );
    if (selectedIndex <= 0) return;
    if (!_scrollController.hasClients) return;

    final offset = selectedIndex * (_estimatedTabWidth + _tabSpacing);
    final maxScroll = _scrollController.position.maxScrollExtent;

    _scrollController.animateTo(
      offset.clamp(0.0, maxScroll),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: widget.height,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding:
            widget.padding ??
            const EdgeInsets.symmetric(horizontal: AppSpacing.pageHorizontal),
        itemCount: widget.items.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: AppSpacing.paddingXS),
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final isSelected = item.value == widget.selectedValue;

          return InkWell(
            onTap: () => widget.onChanged(item.value),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.paddingSM,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.onSurface.withValues(alpha: 0.1),
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (item.icon != null) ...[
                    Icon(
                      item.icon,
                      size: AppSpacing.iconInline,
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xxs),
                  ],
                  Text(
                    item.label,
                    style: AppTypography.labelMedium.copyWith(
                      color: isSelected
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
