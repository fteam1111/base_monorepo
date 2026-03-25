// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'factory_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FactoryModelDto _$FactoryModelDtoFromJson(Map<String, dynamic> json) =>
    _FactoryModelDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$FactoryModelDtoToJson(_FactoryModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };
