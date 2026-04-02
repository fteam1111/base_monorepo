import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';

abstract class ExportAreaRepository {
  Future<Either<ApiFailure, List<ExportAreaEntity>>> getAvailableExportAreas({
    required int factoryId,
  });

  Future<Either<ApiFailure, List<ExportAreaDeliveryOrderEntity>>>
  getExportAreaDeliveryOrders({required int areaId});

  Future<Either<ApiFailure, Unit>> addVehicleToDeliveryOrder({
    required int doId,
    required String vehicleId,
  });
}
