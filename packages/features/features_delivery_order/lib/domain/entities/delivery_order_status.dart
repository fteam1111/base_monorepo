import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

enum DeliveryOrderStatus {
  pending,
  preparing,
  ready;

  /// API string value for sending to server.
  String get apiValue => name.toUpperCase();

  /// Creates a [DeliveryOrderStatus] from an API status string.
  static DeliveryOrderStatus fromString(String? value) {
    switch (value?.toUpperCase()) {
      case 'PREPARING':
        return DeliveryOrderStatus.preparing;
      case 'READY':
        return DeliveryOrderStatus.ready;
      case 'PENDING':
      default:
        return DeliveryOrderStatus.pending;
    }
  }

  String label(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case DeliveryOrderStatus.pending:
        return l10n.deliveryOrderStatusPending;
      case DeliveryOrderStatus.preparing:
        return l10n.deliveryOrderStatusPreparing;
      case DeliveryOrderStatus.ready:
        return l10n.deliveryOrderStatusReady;
    }
  }

  Color labelColor(BuildContext context) {
    switch (this) {
      case DeliveryOrderStatus.pending:
        return context.appColors.warning;
      case DeliveryOrderStatus.preparing:
        return context.colorScheme.primary;
      case DeliveryOrderStatus.ready:
        return AppColors.successLight;
    }
  }

  Color backgroundLabel(BuildContext context) {
    switch (this) {
      case DeliveryOrderStatus.pending:
        return context.appColors.warning.withValues(alpha: 0.1);
      case DeliveryOrderStatus.preparing:
        return context.colorScheme.primary.withValues(alpha: 0.1);
      case DeliveryOrderStatus.ready:
        return AppColors.successLight.withValues(alpha: 0.1);
    }
  }
}
