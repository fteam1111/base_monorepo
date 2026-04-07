// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleHistoryDto _$VehicleHistoryDtoFromJson(Map<String, dynamic> json) =>
    _VehicleHistoryDto(
      id: (json['id'] as num).toInt(),
      action: json['action'] as String,
      performedBy: json['performedBy'] as String,
      performedAt: json['performedAt'] == null
          ? null
          : DateTime.parse(json['performedAt'] as String),
      status: (json['status'] as num).toInt(),
      notes: json['notes'] as String?,
      performedByName: json['performedByName'] as String?,
      performedByAccount: json['performedByAccount'] as String?,
      factory: json['factory'] == null
          ? null
          : FactoryRefDto.fromJson(json['factory'] as Map<String, dynamic>),
      area: json['area'] == null
          ? null
          : AreaRefDto.fromJson(json['area'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : LocationRefDto.fromJson(json['position'] as Map<String, dynamic>),
      parkingLot: json['parkingLot'] == null
          ? null
          : LocationRefDto.fromJson(json['parkingLot'] as Map<String, dynamic>),
      parkingZone: json['parkingZone'] == null
          ? null
          : LocationRefDto.fromJson(
              json['parkingZone'] as Map<String, dynamic>,
            ),
      storageDays: (json['storageDays'] as num?)?.toInt(),
      deliveryOrder: json['deliveryOrder'] == null
          ? null
          : DeliveryOrderRefDto.fromJson(
              json['deliveryOrder'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VehicleHistoryDtoToJson(_VehicleHistoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': instance.action,
      'performedBy': instance.performedBy,
      'performedAt': instance.performedAt?.toIso8601String(),
      'status': instance.status,
      'notes': instance.notes,
      'performedByName': instance.performedByName,
      'performedByAccount': instance.performedByAccount,
      'factory': instance.factory,
      'area': instance.area,
      'position': instance.position,
      'parkingLot': instance.parkingLot,
      'parkingZone': instance.parkingZone,
      'storageDays': instance.storageDays,
      'deliveryOrder': instance.deliveryOrder,
    };

_DeliveryOrderRefDto _$DeliveryOrderRefDtoFromJson(Map<String, dynamic> json) =>
    _DeliveryOrderRefDto(
      id: (json['id'] as num).toInt(),
      doCode: json['doCode'] as String,
    );

Map<String, dynamic> _$DeliveryOrderRefDtoToJson(
  _DeliveryOrderRefDto instance,
) => <String, dynamic>{'id': instance.id, 'doCode': instance.doCode};

_FactoryRefDto _$FactoryRefDtoFromJson(Map<String, dynamic> json) =>
    _FactoryRefDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$FactoryRefDtoToJson(_FactoryRefDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

_AreaRefDto _$AreaRefDtoFromJson(Map<String, dynamic> json) => _AreaRefDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  type: json['type'] as String?,
);

Map<String, dynamic> _$AreaRefDtoToJson(_AreaRefDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

_LocationRefDto _$LocationRefDtoFromJson(Map<String, dynamic> json) =>
    _LocationRefDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocationRefDtoToJson(_LocationRefDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
