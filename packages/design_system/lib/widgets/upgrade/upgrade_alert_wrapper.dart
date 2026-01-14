import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeAlertWrapper extends StatefulWidget {
  final Widget child;

  final Upgrader upgrader;

  /// Cho phép tắt hoàn toàn upgrade alert (ví dụ Flavor.mock).
  final bool enabled;

  /// Hook để app tự tracking/logging khi upgrader emit state.
  final void Function(UpgraderState state)? onStateChanged;

  const UpgradeAlertWrapper({
    super.key,
    required this.child,
    required this.upgrader,
    this.enabled = true,
    this.onStateChanged,
  });

  @override
  State<UpgradeAlertWrapper> createState() => _UpgradeAlertWrapperState();
}

class _UpgradeAlertWrapperState extends State<UpgradeAlertWrapper> {
  StreamSubscription<UpgraderState>? _streamSubscription;

  @override
  void initState() {
    super.initState();

    _streamSubscription = widget.upgrader.stateStream.listen((state) {
      widget.onStateChanged?.call(state);
    });
  }

  @override
  void didUpdateWidget(covariant UpgradeAlertWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Nếu upgrader instance thay đổi, resubscribe
    if (!identical(oldWidget.upgrader, widget.upgrader)) {
      _streamSubscription?.cancel();
      _streamSubscription = widget.upgrader.stateStream.listen((state) {
        widget.onStateChanged?.call(state);
      });
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return UpgradeAlert(
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      upgrader: widget.upgrader,
      child: widget.child,
    );
  }
}