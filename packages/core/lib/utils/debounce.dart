import 'dart:async';
import 'dart:ui';

/// Debounce utility để trì hoãn việc thực thi hàm cho đến khi không có thao tác nào trong khoảng thời gian delay
///
/// Thường dùng cho search input, button click, scroll events để tránh gọi API quá nhiều lần
///
/// Ví dụ:
/// ```dart
/// final debounce = Debounce(delay: Duration(milliseconds: 500));
///
/// // Trong TextField onChanged
/// TextField(
///   onChanged: (value) {
///     debounce(() {
///       // Chỉ gọi API sau khi user ngừng gõ 500ms
///       searchProducts(value);
///     });
///   },
/// )
///
/// // Nhớ dispose khi không dùng nữa
/// @override
/// void dispose() {
///   debounce.dispose();
///   super.dispose();
/// }
/// ```
class Debounce {
  /// Thời gian delay trước khi thực thi hàm (mặc định 300ms)
  final Duration delay;
  Timer? _timer;

  /// Tạo Debounce instance với delay tùy chỉnh
  ///
  /// Ví dụ:
  /// ```dart
  /// final debounce = Debounce(delay: Duration(milliseconds: 500));
  /// ```
  Debounce({this.delay = const Duration(milliseconds: 300)});

  /// Gọi hàm với debounce
  ///
  /// Nếu hàm được gọi lại trong khoảng thời gian delay, timer sẽ được reset
  ///
  /// Ví dụ:
  /// ```dart
  /// final debounce = Debounce();
  /// debounce(() => print('Hello')); // Timer bắt đầu
  /// debounce(() => print('Hello')); // Timer reset, không in
  /// debounce(() => print('Hello')); // Timer reset, không in
  /// // Sau 300ms: in "Hello" một lần
  /// ```
  void call(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  /// Hủy timer và giải phóng tài nguyên
  ///
  /// Ví dụ:
  /// ```dart
  /// @override
  /// void dispose() {
  ///   debounce.dispose();
  ///   super.dispose();
  /// }
  /// ```
  void dispose() {
    _timer?.cancel();
  }
}
