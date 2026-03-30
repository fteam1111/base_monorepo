// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryOrderDto _$DeliveryOrderDtoFromJson(Map<String, dynamic> json) =>
    _DeliveryOrderDto(
      id: (json['id'] as num?)?.toInt(),
      doCode: json['doCode'] as String?,
      factoryId: (json['factoryId'] as num?)?.toInt(),
      storeName: json['storeName'] as String?,
      storeBranch: json['storeBranch'] as String?,
      status: json['status'] as String?,
      totalQuantity: (json['totalQuantity'] as num?)?.toInt(),
      fulfilledQuantity: (json['fulfilledQuantity'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DeliveryOrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map(
            (e) => DeliveryOrderVehicleDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$DeliveryOrderDtoToJson(_DeliveryOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doCode': instance.doCode,
      'factoryId': instance.factoryId,
      'storeName': instance.storeName,
      'storeBranch': instance.storeBranch,
      'status': instance.status,
      'totalQuantity': instance.totalQuantity,
      'fulfilledQuantity': instance.fulfilledQuantity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'items': instance.items,
      'vehicles': instance.vehicles,
    };

_DeliveryOrderItemDto _$DeliveryOrderItemDtoFromJson(
  Map<String, dynamic> json,
) => _DeliveryOrderItemDto(
  id: (json['id'] as num?)?.toInt(),
  vehicleModel: json['vehicleModel'] as String?,
  color: json['color'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeliveryOrderItemDtoToJson(
  _DeliveryOrderItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'vehicleModel': instance.vehicleModel,
  'color': instance.color,
  'quantity': instance.quantity,
};

_DeliveryOrderVehicleDto _$DeliveryOrderVehicleDtoFromJson(
  Map<String, dynamic> json,
) => _DeliveryOrderVehicleDto(
  id: (json['id'] as num?)?.toInt(),
  serialNumber: json['serialNumber'] as String?,
  model: json['model'] as String?,
  color: json['color'] as String?,
  materialCode: json['materialCode'] as String?,
  manufacturingDate: json['manufacturingDate'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusLabel: json['statusLabel'] as String?,
  warehouseImportedAt: json['warehouseImportedAt'] as String?,
  exportedAt: json['exportedAt'] as String?,
  storageDays: (json['storageDays'] as num?)?.toInt(),
  qcDefectDescription: json['qcDefectDescription'] as String?,
);

Map<String, dynamic> _$DeliveryOrderVehicleDtoToJson(
  _DeliveryOrderVehicleDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'serialNumber': instance.serialNumber,
  'model': instance.model,
  'color': instance.color,
  'materialCode': instance.materialCode,
  'manufacturingDate': instance.manufacturingDate,
  'status': instance.status,
  'statusLabel': instance.statusLabel,
  'warehouseImportedAt': instance.warehouseImportedAt,
  'exportedAt': instance.exportedAt,
  'storageDays': instance.storageDays,
  'qcDefectDescription': instance.qcDefectDescription,
};

_AddVehicleToDeliveryOrderRequestDto
_$AddVehicleToDeliveryOrderRequestDtoFromJson(Map<String, dynamic> json) =>
    _AddVehicleToDeliveryOrderRequestDto(
      vehicleId: json['vehicleId'] as String,
    );

Map<String, dynamic> _$AddVehicleToDeliveryOrderRequestDtoToJson(
  _AddVehicleToDeliveryOrderRequestDto instance,
) => <String, dynamic>{'vehicleId': instance.vehicleId};
