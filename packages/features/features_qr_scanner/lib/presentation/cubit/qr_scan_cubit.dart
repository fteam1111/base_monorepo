import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:features_qr_scanner/domain/usecases/get_vehicle_by_serial_usecase.dart';
import 'package:features_qr_scanner/presentation/cubit/qr_scan_state.dart';

/// Cubit managing the QR scan → VIN validation → vehicle API flow.
class QrScanCubit extends Cubit<QrScanState> {
  QrScanCubit(this._getVehicleBySerial) : super(const QrScanInitial());

  final GetVehicleBySerialUseCase _getVehicleBySerial;

  /// Called when the scanner detects a barcode value.
  ///
  /// 1. Validates [rawValue] via [VinID] value object.
  /// 2. Calls the use case to fetch vehicle details.
  Future<void> onBarcodeDetected(String rawValue) async {
    final vinId = VinID(rawValue);

    if (!vinId.isValid()) {
      logger.w('Invalid VIN scanned: $rawValue');
      emit(const QrScanInvalidVin('Mã VIN không hợp lệ'));
      return;
    }

    emit(const QrScanLoading());

    final result = await _getVehicleBySerial(rawValue);

    result.fold(
      (failure) {
        logger.e(
          'Vehicle fetch failed: ${failure.nonTranslatedFailureMessage}',
        );
        emit(QrScanFailure(failure.nonTranslatedFailureMessage));
      },
      (vehicle) {
        logger.i('Vehicle fetched: ${vehicle.serialNumber}');
        emit(QrScanSuccess(vehicle));
      },
    );
  }

  /// Resets the cubit back to initial state (e.g. to retry scanning).
  void reset() => emit(const QrScanInitial());
}
