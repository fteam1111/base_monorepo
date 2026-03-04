// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_charging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleModelDto _$VehicleModelDtoFromJson(Map<String, dynamic> json) =>
    _VehicleModelDto(
      id: (json['id'] as num?)?.toInt(),
      serialNumber: json['serialNumber'] as String?,
      materialCode: json['materialCode'] as String?,
      model: json['model'] as String?,
      manufacturingDate: json['manufacturingDate'] as String?,
      color: json['color'] as String?,
      status: (json['status'] as num?)?.toInt(),
      statusLabel: json['statusLabel'] as String?,
      warehouseImportedAt: json['warehouseImportedAt'] as String?,
      exportedAt: json['exportedAt'] as String?,
      storageDays: (json['storageDays'] as num?)?.toInt(),
      qcDefectDescription: json['qcDefectDescription'] as String?,
      factory: json['factory'] == null
          ? null
          : VehicleFactoryModelDto.fromJson(
              json['factory'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VehicleModelDtoToJson(_VehicleModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNumber': instance.serialNumber,
      'materialCode': instance.materialCode,
      'model': instance.model,
      'manufacturingDate': instance.manufacturingDate,
      'color': instance.color,
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'warehouseImportedAt': instance.warehouseImportedAt,
      'exportedAt': instance.exportedAt,
      'storageDays': instance.storageDays,
      'qcDefectDescription': instance.qcDefectDescription,
      'factory': instance.factory,
    };

_VehicleFactoryModelDto _$VehicleFactoryModelDtoFromJson(
  Map<String, dynamic> json,
) => _VehicleFactoryModelDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$VehicleFactoryModelDtoToJson(
  _VehicleFactoryModelDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
};
