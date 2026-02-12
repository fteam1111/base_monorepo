import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class MapViewerController extends ChangeNotifier {
  VoidCallback? _zoomIn;
  VoidCallback? _zoomOut;
  VoidCallback? _reset;

  void _bind({
    required VoidCallback zoomIn,
    required VoidCallback zoomOut,
    required VoidCallback reset,
  }) {
    _zoomIn = zoomIn;
    _zoomOut = zoomOut;
    _reset = reset;
  }

  void _unbind() {
    _zoomIn = null;
    _zoomOut = null;
    _reset = null;
  }

  void zoomIn() => _zoomIn?.call();

  void zoomOut() => _zoomOut?.call();

  void reset() => _reset?.call();
}

class MapViewerSection extends StatefulWidget {
  const MapViewerSection({super.key, required this.controller});

  final MapViewerController controller;

  @override
  State<MapViewerSection> createState() => _MapViewerSectionState();
}

class _MapViewerSectionState extends State<MapViewerSection>
    with SingleTickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();

  late final AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    super.initState();
    widget.controller._bind(zoomIn: zoomIn, zoomOut: zoomOut, reset: reset);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    widget.controller._unbind();
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void zoomIn() => _animateZoom(1.2);

  void zoomOut() => _animateZoom(1 / 1.2);

  void reset() => _animateToMatrix(Matrix4.identity());

  void _animateZoom(double scaleFactor) {
    final currentMatrix = _transformationController.value;
    final currentScale = currentMatrix.getMaxScaleOnAxis();
    final nextScale = (currentScale * scaleFactor).clamp(1.0, 4.0);

    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final viewportCenter = Offset(size.width / 2, size.height / 2);

    final focalPointScene = _transformationController.toScene(viewportCenter);

    final t1 = Matrix4.translation(
      Vector3(focalPointScene.dx, focalPointScene.dy, 0),
    );
    final s = Matrix4.diagonal3(Vector3(nextScale, nextScale, 1));
    final t2 = Matrix4.translation(
      Vector3(-focalPointScene.dx, -focalPointScene.dy, 0),
    );

    final nextMatrix = t1 * s * t2;
    _animateToMatrix(nextMatrix);
  }

  void _animateToMatrix(Matrix4 targetMatrix) {
    _animationController.stop();

    _animation =
        Matrix4Tween(
          begin: _transformationController.value,
          end: targetMatrix,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController
      ..reset()
      ..forward();

    _animation!.addListener(() {
      _transformationController.value = _animation!.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;

    return InteractiveViewer(
      transformationController: _transformationController,
      minScale: 1.0,
      maxScale: 4.0,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      constrained: false,
      panEnabled: true,
      scaleEnabled: true,
      child: Container(
        width: context.screenWidth,
        height: 500,
        color: colorScheme.surfaceContainerLowest,
        alignment: Alignment.center,
        child: Image.network(
          'https://s3-api.fpt.vn/fptvn-storage/2025-07-02/1751431933_xem-nha-tren-google-maps-1.jpg',
        ),
      ),
    );
  }
}
