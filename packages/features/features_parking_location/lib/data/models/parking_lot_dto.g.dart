// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_lot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingLotDto _$ParkingLotDtoFromJson(Map<String, dynamic> json) =>
    _ParkingLotDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      parkingZoneId: (json['parkingZoneId'] as num?)?.toInt(),
      maxCapacity: (json['maxCapacity'] as num?)?.toInt(),
      currentOccupied: (json['currentOccupied'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ParkingLotDtoToJson(_ParkingLotDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'parkingZoneId': instance.parkingZoneId,
      'maxCapacity': instance.maxCapacity,
      'currentOccupied': instance.currentOccupied,
    };
