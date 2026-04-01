// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingVehicleDto _$ParkingVehicleDtoFromJson(Map<String, dynamic> json) =>
    _ParkingVehicleDto(
      id: (json['id'] as num?)?.toInt(),
      serialNumber: json['serialNumber'] as String?,
      materialCode: json['materialCode'] as String?,
      model: json['model'] as String?,
      color: json['color'] as String?,
      status: (json['status'] as num?)?.toInt(),
      statusLabel: json['statusLabel'] as String?,
      warehouseImportedAt: json['warehouseImportedAt'] as String?,
      exportedAt: json['exportedAt'] as String?,
      type: json['type'] as String?,
      agingDays: (json['agingDays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParkingVehicleDtoToJson(_ParkingVehicleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'materialCode': instance.materialCode,
      'model': instance.model,
      'color': instance.color,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'warehouseImportedAt': instance.warehouseImportedAt,
      'exportedAt': instance.exportedAt,
      'type': instance.type,
      'agingDays': instance.agingDays,
    };
