// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingZoneDto _$ParkingZoneDtoFromJson(Map<String, dynamic> json) =>
    _ParkingZoneDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      factoryId: (json['factoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParkingZoneDtoToJson(_ParkingZoneDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isActive': instance.isActive,
      'factoryId': instance.factoryId,
    };

_ParkingLotDto _$ParkingLotDtoFromJson(Map<String, dynamic> json) =>
    _ParkingLotDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      parkingZoneId: (json['parkingZoneId'] as num?)?.toInt(),
      parkingZone: json['parkingZone'] == null
          ? null
          : ParkingZoneDto.fromJson(
              json['parkingZone'] as Map<String, dynamic>,
            ),
      maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
      currentOccupied: (json['currentOccupied'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParkingLotDtoToJson(_ParkingLotDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parkingZoneId': instance.parkingZoneId,
      'parkingZone': instance.parkingZone,
      'maxCapacity': instance.maxCapacity,
      'currentOccupied': instance.currentOccupied,
    };

_VehicleFactoryDto _$VehicleFactoryDtoFromJson(Map<String, dynamic> json) =>
    _VehicleFactoryDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$VehicleFactoryDtoToJson(_VehicleFactoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

_VehicleDto _$VehicleDtoFromJson(Map<String, dynamic> json) => _VehicleDto(
  id: (json['id'] as num?)?.toInt(),
  serialNumber: json['serialNumber'] as String?,
  materialCode: json['materialCode'] as String?,
  model: json['model'] as String?,
  manufacturingDate: json['manufacturingDate'] as String?,
  color: json['color'] as String?,
  status: (json['status'] as num?)?.toInt(),
  statusLabel: json['statusLabel'] as String?,
  warehouseImportedAt: json['warehouseImportedAt'] as String?,
  storageDays: (json['storageDays'] as num?)?.toInt(),
  exportedAt: json['exportedAt'] as String?,
  qcDefectDescription: json['qcDefectDescription'] as String?,
  factory: json['factory'] == null
      ? null
      : VehicleFactoryDto.fromJson(json['factory'] as Map<String, dynamic>),
  parkingLot: json['parkingLot'] == null
      ? null
      : ParkingLotDto.fromJson(json['parkingLot'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VehicleDtoToJson(_VehicleDto instance) =>
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
      'storageDays': instance.storageDays,
      'exportedAt': instance.exportedAt,
      'qcDefectDescription': instance.qcDefectDescription,
      'factory': instance.factory,
      'parkingLot': instance.parkingLot,
    };
