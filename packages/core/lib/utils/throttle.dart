import 'dart:async';

import 'package:flutter/material.dart';

/// Throttle utility để giới hạn số lần gọi hàm trong một khoảng thời gian
///
/// Khác với Debounce (chờ đến khi ngừng), Throttle chỉ cho phép gọi hàm một lần trong khoảng thời gian duration
///
/// Thường dùng cho scroll events, button click để tránh spam
///
/// Ví dụ:
/// ```dart
/// final throttle = Throttle(duration: Duration(milliseconds: 1000));
///
/// // Trong scroll listener
/// ScrollController(
///   onScroll: () {
///     throttle.run(() {
///       // Chỉ gọi tối đa 1 lần mỗi giây
///       loadMoreData();
///     });
///   },
/// )
///
/// // Nhớ dispose khi không dùng nữa
/// @override
/// void dispose() {
///   throttle.dispose();
///   super.dispose();
/// }
/// ```
class Throttle {
  /// Khoảng thời gian throttle (mặc định 500ms)
  final Duration duration;

  bool _isThrottling = false;
  Timer? _timer;

  /// Tạo Throttle instance với duration tùy chỉnh
  ///
  /// Ví dụ:
  /// ```dart
  /// final throttle = Throttle(duration: Duration(milliseconds: 1000));
  /// ```
  Throttle({
    this.duration = const Duration(milliseconds: 500),
  });

  /// Chạy hàm với throttle
  ///
  /// Nếu hàm đã được gọi trong khoảng thời gian duration, lần gọi tiếp theo sẽ bị bỏ qua
  ///
  /// Ví dụ:
  /// ```dart
  /// final throttle = Throttle(duration: Duration(seconds: 1));
  /// throttle.run(() => print('Action 1')); // In "Action 1" ngay lập tức
  /// throttle.run(() => print('Action 2')); // Bị bỏ qua
  /// throttle.run(() => print('Action 3')); // Bị bỏ qua
  /// // Sau 1 giây
  /// throttle.run(() => print('Action 4')); // In "Action 4"
  /// ```
  void run(VoidCallback action) {
    if (!_isThrottling) {
      _isThrottling = true;

      action.call();

      _timer = Timer(duration, () {
        _isThrottling = false;
      });
    }
  }

  /// Hủy timer và giải phóng tài nguyên
  ///
  /// Ví dụ:
  /// ```dart
  /// @override
  /// void dispose() {
  ///   throttle.dispose();
  ///   super.dispose();
  /// }
  /// ```
  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
