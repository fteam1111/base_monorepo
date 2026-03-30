// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_charging_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleChargingDto _$VehicleChargingDtoFromJson(Map<String, dynamic> json) =>
    _VehicleChargingDto(
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
          : VehicleChargingFactoryDto.fromJson(
              json['factory'] as Map<String, dynamic>,
            ),
      parkingLot: json['parkingLot'] == null
          ? null
          : VehicleChargingParkingLotDto.fromJson(
              json['parkingLot'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VehicleChargingDtoToJson(_VehicleChargingDto instance) =>
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

_VehicleChargingFactoryDto _$VehicleChargingFactoryDtoFromJson(
  Map<String, dynamic> json,
) => _VehicleChargingFactoryDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$VehicleChargingFactoryDtoToJson(
  _VehicleChargingFactoryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
};

_VehicleChargingParkingZoneDto _$VehicleChargingParkingZoneDtoFromJson(
  Map<String, dynamic> json,
) => _VehicleChargingParkingZoneDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  isActive: json['isActive'] as bool?,
  factoryId: (json['factoryId'] as num?)?.toInt(),
);

Map<String, dynamic> _$VehicleChargingParkingZoneDtoToJson(
  _VehicleChargingParkingZoneDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'isActive': instance.isActive,
  'factoryId': instance.factoryId,
};

_VehicleChargingParkingLotDto _$VehicleChargingParkingLotDtoFromJson(
  Map<String, dynamic> json,
) => _VehicleChargingParkingLotDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  parkingZoneId: (json['parkingZoneId'] as num?)?.toInt(),
  parkingZone: json['parkingZone'] == null
      ? null
      : VehicleChargingParkingZoneDto.fromJson(
          json['parkingZone'] as Map<String, dynamic>,
        ),
  maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
  currentOccupied: (json['currentOccupied'] as num?)?.toInt(),
);

Map<String, dynamic> _$VehicleChargingParkingLotDtoToJson(
  _VehicleChargingParkingLotDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'parkingZoneId': instance.parkingZoneId,
  'parkingZone': instance.parkingZone,
  'maxCapacity': instance.maxCapacity,
  'currentOccupied': instance.currentOccupied,
};
