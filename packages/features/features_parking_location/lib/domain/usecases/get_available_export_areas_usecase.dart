import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';
import 'package:features_parking_location/domain/repositories/export_area_repository.dart';

class GetAvailableExportAreasUseCase {
  final ExportAreaRepository _repository;

  GetAvailableExportAreasUseCase(this._repository);

  Future<Either<ApiFailure, List<ExportAreaEntity>>> call(int factoryId) async {
    return _repository.getAvailableExportAreas(factoryId: factoryId);
  }
}
