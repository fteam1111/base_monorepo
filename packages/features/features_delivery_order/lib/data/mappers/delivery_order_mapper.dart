import 'package:features_delivery_order/data/models/delivery_order_dto.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_entity.dart';
import 'package:features_delivery_order/domain/entities/delivery_order_vehicle_entity.dart';

/// Mapper extension for [DeliveryOrderDto] → [DeliveryOrderEntity].
extension DeliveryOrderMapper on DeliveryOrderDto {
  DeliveryOrderEntity toEntity() {
    return DeliveryOrderEntity(
      id: id ?? 0,
      doCode: doCode ?? '',
      factoryId: factoryId ?? 0,
      storeName: storeName,
      storeBranch: storeBranch,
      status: status ?? '',
      totalQuantity: totalQuantity ?? 0,
      fulfilledQuantity: fulfilledQuantity ?? 0,
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
      items: items?.map((i) => i.toEntity()).toList() ?? [],
    );
  }
}

/// Mapper extension for [DeliveryOrderItemDto] →
/// [DeliveryOrderItemEntity].
extension DeliveryOrderItemMapper on DeliveryOrderItemDto {
  DeliveryOrderItemEntity toEntity() {
    return DeliveryOrderItemEntity(
      id: id ?? 0,
      vehicleModel: vehicleModel ?? '',
      color: color ?? '',
      quantity: quantity ?? 0,
    );
  }
}

/// Mapper extension for [DeliveryOrderVehicleDto] →
/// [DeliveryOrderVehicleEntity].
extension DeliveryOrderVehicleMapper on DeliveryOrderVehicleDto {
  DeliveryOrderVehicleEntity toEntity() {
    return DeliveryOrderVehicleEntity(
      id: id ?? 0,
      serialNumber: serialNumber ?? '',
      model: model ?? '',
      color: color ?? '',
      materialCode: materialCode,
      manufacturingDate: manufacturingDate,
      status: status ?? 0,
      statusLabel: statusLabel ?? '',
      warehouseImportedAt: warehouseImportedAt,
      exportedAt: exportedAt,
      storageDays: storageDays ?? 0,
    );
  }
}
