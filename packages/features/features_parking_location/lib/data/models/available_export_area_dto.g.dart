// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_export_area_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvailableExportAreaDto _$AvailableExportAreaDtoFromJson(
  Map<String, dynamic> json,
) => _AvailableExportAreaDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  currentCapacity: (json['currentCapacity'] as num?)?.toInt(),
  availableCapacity: (json['availableCapacity'] as num?)?.toInt(),
  factoryId: (json['factoryId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AvailableExportAreaDtoToJson(
  _AvailableExportAreaDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'capacity': instance.capacity,
  'currentCapacity': instance.currentCapacity,
  'availableCapacity': instance.availableCapacity,
  'factoryId': instance.factoryId,
};
