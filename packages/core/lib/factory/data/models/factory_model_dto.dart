import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_model_dto.freezed.dart';
part 'factory_model_dto.g.dart';

@Freezed(toJson: true)
abstract class FactoryModelDto with _$FactoryModelDto {
  const factory FactoryModelDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') String? address,
  }) = _FactoryModelDto;

  factory FactoryModelDto.fromJson(Map<String, Object?> json) =>
      _$FactoryModelDtoFromJson(json);
}
