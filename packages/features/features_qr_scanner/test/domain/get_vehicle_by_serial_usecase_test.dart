import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_qr_scanner/domain/entities/vehicle_entity.dart';
import 'package:features_qr_scanner/domain/repositories/vehicle_repository.dart';
import 'package:features_qr_scanner/domain/usecases/get_vehicle_by_serial_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

/// Minimal fake repository — không cần mocktail/mockito.
final class _FakeVehicleRepository implements VehicleRepository {
  _FakeVehicleRepository(this._result);

  final Either<ApiFailure, VehicleEntity> _result;

  @override
  Future<Either<ApiFailure, VehicleEntity>> getVehicleBySerial(
    String serialNumber,
  ) async => _result;
}

VehicleEntity _fakeVehicle({String serialNumber = 'RPXS2LHHVSE258693'}) =>
    VehicleEntity(
      id: 1,
      serialNumber: serialNumber,
      materialCode: 'A1',
      model: 'Model A',
      manufacturingDate: '2025-10-30',
      color: 'XANH',
      status: VehicleStatus.inStock,
      statusLabel: 'TRONG KHO',
      warehouseImportedAt: '2025-01-15',
      storageDays: 30,
    );

void main() {
  group('GetVehicleBySerialUseCase', () {
    test('returns VehicleEntity when repository succeeds', () async {
      // Arrange
      final vehicle = _fakeVehicle();
      final useCase = GetVehicleBySerialUseCase(
        _FakeVehicleRepository(Right(vehicle)),
      );

      // Act
      final result = await useCase('RPXS2LHHVSE258693');

      // Assert
      expect(result, Right(vehicle));
    });

    test('returns ApiFailure when repository fails', () async {
      // Arrange
      const failure = ApiFailure.serverError('Vehicle not found');
      final useCase = GetVehicleBySerialUseCase(
        _FakeVehicleRepository(const Left(failure)),
      );

      // Act
      final result = await useCase('RPXS2LHHVSE258693');

      // Assert
      expect(result, const Left(failure));
    });

    test('passes serialNumber correctly to repository', () async {
      // Arrange
      const expectedSerial = 'RPXS2LHHVSE258693';
      String? capturedSerial;

      final repo = _CapturingRepository(
        onCall: (s) {
          capturedSerial = s;
          return Right(_fakeVehicle(serialNumber: s));
        },
      );
      final useCase = GetVehicleBySerialUseCase(repo);

      // Act
      await useCase(expectedSerial);

      // Assert
      expect(capturedSerial, expectedSerial);
    });
  });

  group('VinID ValueObject', () {
    test('validates a correct VIN', () {
      final vin = VinID('RPXS2LHHVSE258693');
      expect(vin.isValid(), isTrue);
    });

    test('rejects an empty string', () {
      final vin = VinID('');
      expect(vin.isValid(), isFalse);
    });

    test('rejects a string that is too short', () {
      final vin = VinID('SHORT');
      expect(vin.isValid(), isFalse);
    });

    test('rejects a string with invalid characters (I, O, Q)', () {
      // Standard VIN does not allow I, O, Q
      final vin = VinID('IOQABCDEFGH12345');
      expect(vin.isValid(), isFalse);
    });
  });
}

/// Capturing repository to verify argument passing.
final class _CapturingRepository implements VehicleRepository {
  _CapturingRepository({required this.onCall});

  final Either<ApiFailure, VehicleEntity> Function(String) onCall;

  @override
  Future<Either<ApiFailure, VehicleEntity>> getVehicleBySerial(
    String serialNumber,
  ) async => onCall(serialNumber);
}
