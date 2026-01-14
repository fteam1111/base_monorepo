import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Đo kích thước của widget mà không cần render trên màn hình
///
/// Hữu ích khi cần biết kích thước widget trước khi hiển thị
///
/// Ví dụ:
/// ```dart
/// // Đo kích thước của Text widget
/// final textWidget = Text(
///   'Hello World',
///   style: TextStyle(fontSize: 16),
/// );
/// final size = measureWidget(textWidget);
/// print('Width: ${size.width}, Height: ${size.height}');
///
/// // Đo kích thước của Container với constraints
/// final container = Container(
///   width: 200,
///   height: 100,
///   child: Text('Content'),
/// );
/// final containerSize = measureWidget(container);
///
/// // Sử dụng để tính toán layout động
/// final widgetSize = measureWidget(
///   Row(
///     children: [
///       Icon(Icons.home),
///       Text('Home'),
///     ],
///   ),
/// );
/// if (widgetSize.width > screenWidth) {
///   // Hiển thị icon only
/// }
/// ```
///
/// Lưu ý: Hàm này chỉ đo kích thước intrinsic của widget, không tính đến constraints từ parent
Size measureWidget(Widget widget) {
  final pipelineOwner = PipelineOwner();
  final rootView = pipelineOwner.rootNode = MeasurementView();
  final buildOwner = BuildOwner(focusManager: FocusManager());
  final element =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: rootView,
    debugShortDescription: '[root]',
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: widget,
    ),
  ).attachToRenderTree(buildOwner);
  try {
    rootView.scheduleInitialLayout();
    pipelineOwner.flushLayout();
    return rootView.size;
  } finally {
    // Clean up.
    element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
    buildOwner.finalizeTree();
  }
}

/// Internal class để đo kích thước widget
class MeasurementView extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    assert(child != null, 'Child must not null');
    child!.layout(const BoxConstraints(), parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}
