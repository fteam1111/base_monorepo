import 'dart:async';
import 'dart:math' as math;

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:share/share.dart';
import 'package:features_qr_scanner/presentation/cubit/qr_scan_cubit.dart';
import 'package:features_qr_scanner/presentation/cubit/qr_scan_state.dart';

/// QR Scanner page.
///
/// Requires [QrScanCubit] to be provided via [BlocProvider] from the caller.
/// [onVehicleFound] is called when a vehicle is successfully fetched.
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key, this.onVehicleFound});

  final void Function(String serialNumber)? onVehicleFound;

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final MobileScannerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (capture.barcodes.isEmpty) return;
    final value = capture.barcodes.first.rawValue;
    if (value == null) return;

    await _controller.stop();
    if (!mounted) return;
    unawaited(context.read<QrScanCubit>().onBarcodeDetected(value));
  }

  Future<void> _resumeScanner() async {
    context.read<QrScanCubit>().reset();
    await _controller.start();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: context.colorScheme.error,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Thử lại',
            textColor: context.colorScheme.onError,
            onPressed: _resumeScanner,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final typography = context.appTypography;
    final l10n = context.l10n;

    return BlocListener<QrScanCubit, QrScanState>(
      listener: (context, state) {
        switch (state) {
          case QrScanInvalidVin():
            _showErrorSnackBar(state.message);
            _resumeScanner();
          case QrScanFailure():
            _showErrorSnackBar(state.message);
            _resumeScanner();
          case QrScanSuccess():
            widget.onVehicleFound?.call(state.vehicle.serialNumber);
          case QrScanInitial() || QrScanLoading():
            break;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        appBar: CustomAppBar(
          isDarkBackground: true,
          backgroundColor: AppColors.backgroundDark,
          shadowColor: Colors.transparent,
          centerTitle: true,
          titleWidget: Text(
            l10n.qrScannerTitle,
            style: typography.sectionHeader.copyWith(
              color: AppColors.onBackgroundDark,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.appSpacing.pageHorizontal,
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: _QrScannerViewport(
                        controller: _controller,
                        onDetect: _onDetect,
                      ),
                    ),
                    const Gap(AppSpacing.small),
                    Text(
                      l10n.qrScannerHint,
                      style: typography.bodyMedium.copyWith(
                        color: AppColors.onBackgroundDark.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const _LoadingOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Semi-transparent loading overlay shown while the API call is in progress.
class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrScanCubit, QrScanState>(
      buildWhen: (previous, current) =>
          previous is QrScanLoading != current is QrScanLoading,
      builder: (context, state) {
        if (state is! QrScanLoading) return const SizedBox.shrink();
        return ColoredBox(
          color: Colors.black.withValues(alpha: 0.5),
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _QrScannerViewport extends StatefulWidget {
  const _QrScannerViewport({required this.controller, required this.onDetect});

  final MobileScannerController controller;
  final void Function(BarcodeCapture capture) onDetect;

  @override
  State<_QrScannerViewport> createState() => _QrScannerViewportState();
}

class _QrScannerViewportState extends State<_QrScannerViewport>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scanController;
  late final Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scanAnimation = CurvedAnimation(
      parent: _scanController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final primary = colorScheme.primary;

    return AspectRatio(
      aspectRatio: 1,
      child: CustomCard(
        backgroundColor: AppColors.neutral0,
        borderRadius: AppRadius.cardLarge,
        padding: EdgeInsets.zero,
        elevation: 0,
        shadowColor: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                AppSpacing.paddingXL + AppSpacing.small,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.card),
                child: MobileScanner(
                  controller: widget.controller,
                  fit: BoxFit.cover,
                  onDetect: widget.onDetect,
                ),
              ),
            ),

            _CornerOverlay(color: primary),

            AnimatedBuilder(
              animation: _scanAnimation,
              builder: (context, _) {
                return _ScanBarOverlay(
                  progress: _scanAnimation.value,
                  color: primary,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CornerOverlay extends StatelessWidget {
  const _CornerOverlay({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.paddingLG),
      child: CustomPaint(
        painter: _CornerPainter(color: color),
        size: Size.infinite,
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  _CornerPainter({required this.color});

  final Color color;

  // Độ dài cạnh góc quét (ngắn hơn để giống thiết kế)
  static const double _cornerLength = AppSpacing.huge;
  static const double _strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final radiusBase = AppRadius.large;
    final double radius = math.min(radiusBase, _cornerLength / 2);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final inset = _strokeWidth / 2;
    final maxWidth = size.width;
    final maxHeight = size.height;

    final length = _cornerLength.clamp(
      0.0,
      (maxWidth < maxHeight ? maxWidth : maxHeight) / 2,
    );

    final topLeft = Path()
      ..moveTo(inset, length + inset)
      ..lineTo(inset, inset + radius)
      ..quadraticBezierTo(inset, inset, inset + radius, inset)
      ..lineTo(length + inset, inset);
    canvas.drawPath(topLeft, paint);

    final topRight = Path()
      ..moveTo(maxWidth - length - inset, inset)
      ..lineTo(maxWidth - inset - radius, inset)
      ..quadraticBezierTo(
        maxWidth - inset,
        inset,
        maxWidth - inset,
        inset + radius,
      )
      ..lineTo(maxWidth - inset, length + inset);
    canvas.drawPath(topRight, paint);

    final bottomLeft = Path()
      ..moveTo(inset, maxHeight - length - inset)
      ..lineTo(inset, maxHeight - inset - radius)
      ..quadraticBezierTo(
        inset,
        maxHeight - inset,
        inset + radius,
        maxHeight - inset,
      )
      ..lineTo(length + inset, maxHeight - inset);
    canvas.drawPath(bottomLeft, paint);

    final bottomRight = Path()
      ..moveTo(maxWidth - length - inset, maxHeight - inset)
      ..lineTo(maxWidth - inset - radius, maxHeight - inset)
      ..quadraticBezierTo(
        maxWidth - inset,
        maxHeight - inset,
        maxWidth - inset,
        maxHeight - inset - radius,
      )
      ..lineTo(maxWidth - inset, maxHeight - length - inset);
    canvas.drawPath(bottomRight, paint);
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _ScanBarOverlay extends StatelessWidget {
  const _ScanBarOverlay({required this.progress, required this.color});

  static const double _scanInset = AppSpacing.paddingXL + AppSpacing.small;

  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final alignmentY = -1.0 + (progress * 2.0);

    return Padding(
      padding: const EdgeInsets.all(_scanInset),
      child: Align(
        alignment: Alignment(0, alignmentY.clamp(-1.0, 1.0)),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.full),
              color: color.withValues(alpha: 0.85),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.4),
                  blurRadius: 6,
                  spreadRadius: 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
