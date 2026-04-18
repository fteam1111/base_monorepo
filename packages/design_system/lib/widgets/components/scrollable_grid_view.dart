import 'dart:async';

import 'package:core/utils/debounce.dart';
import 'package:core/utils/throttle.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

/// Danh sách dạng Grid hỗ trợ pull-to-refresh và infinite scroll.
///
/// Các tính năng:
/// - Pull-to-refresh với Debounce
/// - Infinite scroll (load-more) với Throttle
/// - Widget hiển thị khi danh sách trống
/// - Hỗ trợ Header sliver và Separator (spacing) tuỳ chỉnh
/// - Sử dụng WidgetKeys chuẩn từ package share
class ScrollableGridView<T> extends StatefulWidget {
  const ScrollableGridView({
    super.key,
    required this.isLoading,
    required this.itemBuilder,
    required this.items,
    required this.noRecordFoundWidget,
    required this.controller,
    this.header,
    this.footer,
    this.onRefresh,
    this.onLoadingMore,
    this.dismissOnDrag = false,
    this.scrollPhysics,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.loadMoreThreshold = 0.9,
    this.gridDelegate,
    this.childAspectRatio,
    this.crossAxisCount,
  });

  /// Được gọi khi pull-to-refresh.
  final Future<void> Function()? onRefresh;

  /// Gọi khi scroll đến ngưỡng loadMoreThreshold.
  final VoidCallback? onLoadingMore;

  /// Trạng thái đang tải dữ liệu.
  final bool isLoading;

  /// Danh sách item.
  final List<T> items;

  /// Widget hiển thị khi không có dữ liệu.
  final Widget noRecordFoundWidget;

  /// Header sliver (tùy chọn).
  final Widget? header;

  /// Footer sliver (tuỳ chọn).
  final Widget? footer;

  /// Scroll controller (bắt buộc).
  final ScrollController controller;

  /// Builder cho từng item.
  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  /// Tắt bàn phím khi kéo.
  final bool dismissOnDrag;

  /// Physics của scroll view.
  final ScrollPhysics? scrollPhysics;

  /// Spacing giữa các cột (ngang).
  final double? crossAxisSpacing;

  /// Spacing giữa các dòng (dọc).
  final double? mainAxisSpacing;

  /// Ngưỡng load more (0.0 - 1.0).
  final double loadMoreThreshold;

  /// Delegate cho Grid. Nếu null sẽ dùng default.
  final SliverGridDelegate? gridDelegate;

  /// Tỉ lệ khung hình item (dùng cho default grid delegate).
  final double? childAspectRatio;

  /// Số lượng cột (dùng cho default grid delegate).
  final int? crossAxisCount;

  @override
  State<ScrollableGridView<T>> createState() => _ScrollableGridViewState<T>();
}

class _ScrollableGridViewState<T> extends State<ScrollableGridView<T>> {
  final _loadMoreThrottle = Throttle(
    duration: const Duration(milliseconds: 300),
  );
  final _refreshDebounce = Debounce(delay: const Duration(milliseconds: 300));

  bool _hasTriggeredLoadMore = false;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant ScrollableGridView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
    }

    if ((oldWidget.isLoading && !widget.isLoading) ||
        oldWidget.items.length != widget.items.length) {
      _hasTriggeredLoadMore = false;
    }
  }

  @override
  void dispose() {
    _loadMoreThrottle.dispose();
    _refreshDebounce.dispose();
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Handlers
  // ---------------------------------------------------------------------------

  void _onScroll() {
    if (!widget.controller.hasClients ||
        widget.isLoading ||
        _hasTriggeredLoadMore ||
        widget.items.isEmpty) {
      return;
    }

    final position = widget.controller.position;
    if (position.pixels < position.maxScrollExtent * widget.loadMoreThreshold) {
      return;
    }

    _loadMoreThrottle.run(() {
      if (!mounted || widget.isLoading || _hasTriggeredLoadMore) return;
      _hasTriggeredLoadMore = true;
      widget.onLoadingMore?.call();
    });
  }

  Future<void> _handleRefresh() async {
    final onRefresh = widget.onRefresh;
    if (onRefresh == null) return;

    final completer = Completer<void>();
    _refreshDebounce.call(() async {
      try {
        await onRefresh();
      } finally {
        if (!completer.isCompleted) completer.complete();
      }
    });

    await completer.future;
  }

  // ---------------------------------------------------------------------------
  // Builders
  // ---------------------------------------------------------------------------

  SliverGridDelegate _buildDefaultGridDelegate(BuildContext context) {
    // Nếu user truyền crossAxisCount thì ưu tiên dùng, nếu ko thì responsive
    final cols = widget.crossAxisCount ?? (context.isLargeScreen ? 4 : 2);
    final spacingX = widget.crossAxisSpacing ?? widget.mainAxisSpacing ?? 12;
    final spacingY = widget.mainAxisSpacing ?? widget.crossAxisSpacing ?? 12;

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: cols,
      crossAxisSpacing: spacingX,
      mainAxisSpacing: spacingY,
      childAspectRatio: widget.childAspectRatio ?? (1 / 1.8),
    );
  }

  Widget _buildShimmerGrid(SliverGridDelegate delegate) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return LoadingShimmer.withChild(
          child: const CustomCard(
            child: SizedBox(height: 120, width: double.infinity),
          ),
        );
      }, childCount: 8),
      gridDelegate: delegate,
    );
  }

  Widget _buildEmptyState() {
    return SliverToBoxAdapter(child: widget.noRecordFoundWidget);
  }

  Widget _buildDataGrid(SliverGridDelegate delegate) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = widget.items[index];
        return widget.itemBuilder(context, index, item);
      }, childCount: widget.items.length),
      gridDelegate: delegate,
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final gridDelegate =
        widget.gridDelegate ?? _buildDefaultGridDelegate(context);

    return RefreshIndicator(
      color: context.colorScheme.primary,
      onRefresh: _handleRefresh,
      child: CustomScrollView(
        key: WidgetKeys.scrollGrid,
        controller: widget.controller,
        physics: widget.scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
        keyboardDismissBehavior: widget.dismissOnDrag
            ? ScrollViewKeyboardDismissBehavior.onDrag
            : ScrollViewKeyboardDismissBehavior.manual,
        slivers: [
          // Hiển thị Header nếu có.
          if (widget.header != null) SliverToBoxAdapter(child: widget.header),

          // Điều hướng trạng thái: Loading lần đầu -> Empty -> Dữ liệu.
          if (widget.isLoading && widget.items.isEmpty)
            _buildShimmerGrid(gridDelegate)
          else if (widget.items.isEmpty)
            _buildEmptyState()
          else
            _buildDataGrid(gridDelegate),

          // load more
          if (widget.isLoading && widget.items.isNotEmpty)
            SliverToBoxAdapter(
              key: WidgetKeys.loadMoreGridLoader,
              child: LoadingMoreIndicator(controller: widget.controller),
            ),

          if (widget.footer != null) SliverToBoxAdapter(child: widget.footer),
        ],
      ),
    );
  }
}
