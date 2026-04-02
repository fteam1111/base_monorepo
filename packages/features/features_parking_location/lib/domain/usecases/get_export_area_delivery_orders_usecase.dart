import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';
import 'package:features_parking_location/domain/repositories/export_area_repository.dart';

class GetExportAreaDeliveryOrdersUseCase {
  final ExportAreaRepository _repository;

  GetExportAreaDeliveryOrdersUseCase(this._repository);

  Future<Either<ApiFailure, List<ExportAreaDeliveryOrderEntity>>> call(
    int areaId,
  ) async {
    return _repository.getExportAreaDeliveryOrders(areaId: areaId);
  }
}
