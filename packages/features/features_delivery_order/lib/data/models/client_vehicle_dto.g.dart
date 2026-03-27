// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientVehicleFactoryDto _$ClientVehicleFactoryDtoFromJson(
  Map<String, dynamic> json,
) => _ClientVehicleFactoryDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$ClientVehicleFactoryDtoToJson(
  _ClientVehicleFactoryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
};

_ClientVehicleDto _$ClientVehicleDtoFromJson(Map<String, dynamic> json) =>
    _ClientVehicleDto(
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
          : ClientVehicleFactoryDto.fromJson(
              json['factory'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ClientVehicleDtoToJson(_ClientVehicleDto instance) =>
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
