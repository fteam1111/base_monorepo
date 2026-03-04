import 'dart:async';

import 'package:core/utils/debounce.dart';
import 'package:core/utils/throttle.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';

/// Một danh sách cuộn generic hỗ trợ phân trang, pull-to-refresh và infinite scroll.
///
/// Các tính năng:
/// - Trạng thái loading Shimmer (khi load lần đầu)
/// - Pull-to-refresh với Debounce
/// - Infinite scroll (load-more) với Throttle
/// - Widget hiển thị khi danh sách trống
/// - Hỗ trợ Header sliver và Separator tùy chỉnh
class ScrollList<T> extends StatefulWidget {
  const ScrollList({
    super.key,
    required this.isLoading,
    required this.itemBuilder,
    required this.items,
    required this.noRecordFoundWidget,
    required this.controller,
    this.itemShimmerLoading,
    this.header,
    this.onRefresh,
    this.onLoadingMore,
    this.dismissOnDrag = false,
    this.separatorBuilder,
    this.loadMoreThreshold = 0.9,
    this.loadingItemCount = 10,
  });

  /// Được gọi khi pull-to-refresh.
  final Future<void> Function()? onRefresh;

  /// Được gọi khi vị trí cuộn đạt ngưỡng [loadMoreThreshold].
  final VoidCallback? onLoadingMore;

  /// Trạng thái đang tải dữ liệu.
  final bool isLoading;

  /// Danh sách các item hiện tại.
  final List<T> items;

  /// Hiển thị khi [items] trống và [isLoading] là false.
  final Widget noRecordFoundWidget;

  /// Header sliver tùy chọn nằm phía trên danh sách.
  final Widget? header;

  /// Widget shimmer tùy chỉnh cho từng item khi load lần đầu.
  final Widget? itemShimmerLoading;

  /// Scroll controller - bắt buộc truyền từ ngoài để quản lý tập trung.
  final ScrollController controller;

  /// Hàm xây dựng giao diện cho từng item.
  final Widget Function(BuildContext context, int index, T item) itemBuilder;

  /// Ẩn bàn phím khi bắt đầu kéo danh sách.
  final bool dismissOnDrag;

  /// Hàm xây dựng separator tùy chỉnh giữa các item.
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// Ngưỡng vị trí cuộn (0.0 - 1.0) để kích hoạt [onLoadingMore].
  final double loadMoreThreshold;

  /// Số lượng item shimmer hiển thị khi load lần đầu.
  final int loadingItemCount;

  @override
  State<ScrollList<T>> createState() => _ScrollListState<T>();
}

class _ScrollListState<T> extends State<ScrollList<T>> {
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
  void didUpdateWidget(covariant ScrollList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Gán lại listener nếu instance của controller thay đổi.
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
    }

    // Reset cờ load-more khi quá trình loading kết thúc hoặc danh sách thay đổi.
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
  // Xử lý cuộn & Refresh
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

    // Sử dụng Throttle để giới hạn tần suất gọi onLoadingMore.
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
  // Xây dựng các thành phần Sliver
  // ---------------------------------------------------------------------------

  /// Hiển thị danh sách skeleton (shimmer) khi tải lần đầu.
  Widget _buildShimmerSliver(BuildContext context) {
    return SliverList.separated(
      itemCount: widget.loadingItemCount,
      itemBuilder: (context, _) => LoadingShimmer.withChild(
        child:
            widget.itemShimmerLoading ??
            CustomCard(
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Container(),
              ),
            ),
      ),
      separatorBuilder:
          widget.separatorBuilder ??
          (_, __) => Gap(context.appSpacing.listItemPadding),
    );
  }

  /// Hiển thị widget khi không tìm thấy kết quả.
  Widget _buildEmptySliver() {
    return SliverToBoxAdapter(child: widget.noRecordFoundWidget);
  }

  /// Danh sách item thực tế + indicator load-more nếu đang tải trang tiếp theo.
  List<Widget> _buildDataSlivers(BuildContext context) {
    return [
      SliverList.separated(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return widget.itemBuilder(context, index, widget.items[index]);
        },
        separatorBuilder:
            widget.separatorBuilder ??
            (_, __) => Gap(context.appSpacing.listItemPadding),
      ),
      if (widget.isLoading && widget.items.isNotEmpty)
        SliverToBoxAdapter(
          key: WidgetKeys.loadMoreLoader,
          child: LoadingMoreIndicator(controller: widget.controller),
        ),
    ];
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.colorScheme.primary,
      onRefresh: _handleRefresh,
      child: CustomScrollView(
        key: WidgetKeys.scrollList,
        controller: widget.controller,
        keyboardDismissBehavior: widget.dismissOnDrag
            ? ScrollViewKeyboardDismissBehavior.onDrag
            : ScrollViewKeyboardDismissBehavior.manual,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Hiển thị Header nếu có.
          if (widget.header != null) SliverToBoxAdapter(child: widget.header),

          // Điều hướng trạng thái: Loading lần đầu -> Empty -> Dữ liệu.
          if (widget.isLoading && widget.items.isEmpty)
            _buildShimmerSliver(context)
          else if (widget.items.isEmpty)
            _buildEmptySliver()
          else
            ..._buildDataSlivers(context),
        ],
      ),
    );
  }
}
