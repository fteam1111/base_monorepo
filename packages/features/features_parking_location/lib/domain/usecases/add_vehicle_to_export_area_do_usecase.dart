import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/repositories/export_area_repository.dart';

class AddVehicleToExportAreaDoParams {
  final int doId;
  final String vehicleId;

  AddVehicleToExportAreaDoParams({required this.doId, required this.vehicleId});
}

class AddVehicleToExportAreaDoUseCase {
  final ExportAreaRepository _repository;

  AddVehicleToExportAreaDoUseCase(this._repository);

  Future<Either<ApiFailure, Unit>> call(
    AddVehicleToExportAreaDoParams params,
  ) async {
    return _repository.addVehicleToDeliveryOrder(
      doId: params.doId,
      vehicleId: params.vehicleId,
    );
  }
}
