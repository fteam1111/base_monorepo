import 'package:freezed_annotation/freezed_annotation.dart';

part 'factory_model_dto.freezed.dart';
part 'factory_model_dto.g.dart';

@freezed
abstract class FactoryModelDto with _$FactoryModelDto {
  const factory FactoryModelDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'address') required String address,
  }) = _FactoryModelDto;

  factory FactoryModelDto.fromJson(Map<String, Object?> json) =>
      _$FactoryModelDtoFromJson(json);
}

