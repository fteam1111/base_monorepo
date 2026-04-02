import 'package:features_parking_location/data/models/available_export_area_dto.dart';
import 'package:features_parking_location/data/models/export_area_delivery_order_dto.dart';
import 'package:features_parking_location/domain/entities/export_area_delivery_order_entity.dart';
import 'package:features_parking_location/domain/entities/export_area_entity.dart';

extension AvailableExportAreaDtoMapper on AvailableExportAreaDto {
  ExportAreaEntity toEntity() {
    return ExportAreaEntity(
      id: id ?? 0,
      name: name ?? '',
      address: address ?? '',
      capacity: capacity ?? 0,
      currentCapacity: currentCapacity ?? 0,
      availableCapacity: availableCapacity ?? 0,
      factoryId: factoryId ?? 0,
    );
  }
}

extension ExportAreaDeliveryOrderDtoMapper on ExportAreaDeliveryOrderDto {
  ExportAreaDeliveryOrderEntity toEntity() {
    return ExportAreaDeliveryOrderEntity(
      id: id ?? 0,
      doCode: doCode ?? '',
      storeName: storeName ?? '',
      storeBranch: storeBranch ?? '',
      status: status ?? '',
      totalQuantity: totalQuantity ?? 0,
      fulfilledQuantity: fulfilledQuantity ?? 0,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}
