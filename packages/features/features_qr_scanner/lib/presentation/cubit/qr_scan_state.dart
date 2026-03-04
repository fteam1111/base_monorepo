import 'package:equatable/equatable.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';

/// States for the QR scan flow.
sealed class QrScanState extends Equatable {
  const QrScanState();

  @override
  List<Object?> get props => [];
}

/// Initial state — waiting for a scan.
final class QrScanInitial extends QrScanState {
  const QrScanInitial();
}

/// Scanned value is not a valid VIN format.
final class QrScanInvalidVin extends QrScanState {
  const QrScanInvalidVin(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

/// Calling the vehicle API.
final class QrScanLoading extends QrScanState {
  const QrScanLoading();
}

/// API call succeeded — vehicle data available.
final class QrScanSuccess extends QrScanState {
  const QrScanSuccess(this.vehicle);

  final VehicleEntity vehicle;

  @override
  List<Object?> get props => [vehicle];
}

/// API call failed.
final class QrScanFailure extends QrScanState {
  const QrScanFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
