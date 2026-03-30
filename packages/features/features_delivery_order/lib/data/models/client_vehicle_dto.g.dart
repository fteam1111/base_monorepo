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

_ClientVehicleParkingZoneDto _$ClientVehicleParkingZoneDtoFromJson(
  Map<String, dynamic> json,
) => _ClientVehicleParkingZoneDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  isActive: json['isActive'] as bool?,
  factoryId: (json['factoryId'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientVehicleParkingZoneDtoToJson(
  _ClientVehicleParkingZoneDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'isActive': instance.isActive,
  'factoryId': instance.factoryId,
};

_ClientVehicleParkingLotDto _$ClientVehicleParkingLotDtoFromJson(
  Map<String, dynamic> json,
) => _ClientVehicleParkingLotDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  parkingZoneId: (json['parkingZoneId'] as num?)?.toInt(),
  parkingZone: json['parkingZone'] == null
      ? null
      : ClientVehicleParkingZoneDto.fromJson(
          json['parkingZone'] as Map<String, dynamic>,
        ),
  maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
  currentOccupied: (json['currentOccupied'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientVehicleParkingLotDtoToJson(
  _ClientVehicleParkingLotDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'parkingZoneId': instance.parkingZoneId,
  'parkingZone': instance.parkingZone,
  'maxCapacity': instance.maxCapacity,
  'currentOccupied': instance.currentOccupied,
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
      parkingLot: json['parkingLot'] == null
          ? null
          : ClientVehicleParkingLotDto.fromJson(
              json['parkingLot'] as Map<String, dynamic>,
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
      'parkingLot': instance.parkingLot,
    };
