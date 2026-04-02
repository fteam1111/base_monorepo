import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/data/datasources/remote/export_area_remote_datasource.dart';
import 'package:features_parking_location/data/mappers/export_area_mapper.dart';
import 'package:features_parking_location/data/models/export_add_vehicle_to_do_request_dto.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';
import 'package:features_parking_location/domain/repositories/export_area_repository.dart';

class ExportAreaRepositoryImpl implements ExportAreaRepository {
  final ExportAreaRemoteDataSource _remoteDataSource;

  ExportAreaRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ApiFailure, List<ExportAreaEntity>>> getAvailableExportAreas({
    required int factoryId,
  }) async {
    try {
      final response = await _remoteDataSource.getAvailableExportAreas(
        factoryId,
      );
      final items = response.data?.map((e) => e.toEntity()).toList() ?? [];
      return right(items);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, List<ExportAreaDeliveryOrderEntity>>>
  getExportAreaDeliveryOrders({required int areaId}) async {
    try {
      final response = await _remoteDataSource.getExportAreaDeliveryOrders(
        areaId,
      );
      final items = response.data?.map((e) => e.toEntity()).toList() ?? [];
      return right(items);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> addVehicleToDeliveryOrder({
    required int doId,
    required String vehicleId,
  }) async {
    try {
      await _remoteDataSource.addVehicleToDeliveryOrder(
        doId,
        ExportAddVehicleToDoRequestDto(vehicleId: vehicleId),
      );
      return right(unit);
    } catch (e) {
      return left(e.toApiFailure());
    }
  }
}
