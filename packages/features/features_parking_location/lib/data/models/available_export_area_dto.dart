import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_export_area_dto.freezed.dart';
part 'available_export_area_dto.g.dart';

@freezed
abstract class AvailableExportAreaDto with _$AvailableExportAreaDto {
  const factory AvailableExportAreaDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'capacity') int? capacity,
    @JsonKey(name: 'currentCapacity') int? currentCapacity,
    @JsonKey(name: 'availableCapacity') int? availableCapacity,
    @JsonKey(name: 'factoryId') int? factoryId,
  }) = _AvailableExportAreaDto;

  factory AvailableExportAreaDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableExportAreaDtoFromJson(json);
}
