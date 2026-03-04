import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_qr_scanner/domain/usecases/get_vehicle_by_serial_usecase.dart';
import 'package:features_qr_scanner/presentation/cubit/qr_scan_cubit.dart';
import 'package:features_qr_scanner/presentation/cubit/qr_scan_state.dart';
import 'package:features_qr_scanner/presentation/pages/qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

// ---------------------------------------------------------------------------
// Fake use case
// ---------------------------------------------------------------------------
final class _FakeGetVehicleBySerialUseCase
    implements GetVehicleBySerialUseCase {
  _FakeGetVehicleBySerialUseCase(this._result);

  final Either<ApiFailure, VehicleEntity> _result;

  @override
  Future<Either<ApiFailure, VehicleEntity>> call(String serialNumber) async =>
      _result;
}

VehicleEntity _fakeVehicle() => const VehicleEntity(
  id: 1,
  serialNumber: 'RPXS2LHHVSE258693',
  materialCode: 'A1',
  model: 'Model A',
  manufacturingDate: '2025-10-30',
  color: 'XANH',
  status: 1,
  statusLabel: 'TRONG KHO',
  warehouseImportedAt: '2025-01-15',
  storageDays: 30,
);

// ---------------------------------------------------------------------------
// Helper — pump the page with a given cubit
// ---------------------------------------------------------------------------
Widget _buildTestApp(QrScanCubit cubit) {
  return MaterialApp(
    home: BlocProvider<QrScanCubit>.value(
      value: cubit,
      child: const QrScannerPage(),
    ),
  );
}

void main() {
  group('QrScannerPage', () {
    testWidgets('shows scanner viewport in initial state', (tester) async {
      // Arrange
      final cubit = QrScanCubit(
        _FakeGetVehicleBySerialUseCase(Right(_fakeVehicle())),
      );

      // Act
      await tester.pumpWidget(_buildTestApp(cubit));
      await tester.pump();

      // Assert — page renders without crashing; loading overlay not visible
      expect(find.byType(QrScannerPage), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      cubit.close();
    });

    testWidgets('shows CircularProgressIndicator when loading', (tester) async {
      // Arrange
      final cubit = QrScanCubit(
        _FakeGetVehicleBySerialUseCase(Right(_fakeVehicle())),
      );

      // Act — manually emit loading state
      await tester.pumpWidget(_buildTestApp(cubit));
      cubit.emit(const QrScanLoading());
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      cubit.close();
    });

    testWidgets('shows SnackBar on QrScanFailure state', (tester) async {
      // Arrange
      final cubit = QrScanCubit(
        _FakeGetVehicleBySerialUseCase(const Left(ApiFailure.noInternet())),
      );

      // Act
      await tester.pumpWidget(_buildTestApp(cubit));
      cubit.emit(const QrScanFailure('No internet connection'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('No internet connection'), findsOneWidget);

      cubit.close();
    });

    testWidgets('shows SnackBar on QrScanInvalidVin state', (tester) async {
      // Arrange
      final cubit = QrScanCubit(
        _FakeGetVehicleBySerialUseCase(Right(_fakeVehicle())),
      );

      // Act
      await tester.pumpWidget(_buildTestApp(cubit));
      cubit.emit(const QrScanInvalidVin('Mã VIN không hợp lệ'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Mã VIN không hợp lệ'), findsOneWidget);

      cubit.close();
    });

    testWidgets('calls onVehicleFound callback on QrScanSuccess', (
      tester,
    ) async {
      // Arrange
      String? receivedSerial;
      final cubit = QrScanCubit(
        _FakeGetVehicleBySerialUseCase(Right(_fakeVehicle())),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<QrScanCubit>.value(
            value: cubit,
            child: QrScannerPage(
              onVehicleFound: (serial) => receivedSerial = serial,
            ),
          ),
        ),
      );
      cubit.emit(QrScanSuccess(_fakeVehicle()));
      await tester.pump();

      // Assert
      expect(receivedSerial, 'RPXS2LHHVSE258693');

      cubit.close();
    });
  });
}
