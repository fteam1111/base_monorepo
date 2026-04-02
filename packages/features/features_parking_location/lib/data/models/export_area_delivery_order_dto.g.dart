// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_area_delivery_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExportAreaDeliveryOrderDto _$ExportAreaDeliveryOrderDtoFromJson(
  Map<String, dynamic> json,
) => _ExportAreaDeliveryOrderDto(
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
);

Map<String, dynamic> _$ExportAreaDeliveryOrderDtoToJson(
  _ExportAreaDeliveryOrderDto instance,
) => <String, dynamic>{
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
};
