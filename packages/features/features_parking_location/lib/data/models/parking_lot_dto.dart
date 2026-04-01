import 'package:freezed_annotation/freezed_annotation.dart';

part 'parking_lot_dto.freezed.dart';
part 'parking_lot_dto.g.dart';

@freezed
abstract class ParkingLotDto with _$ParkingLotDto {
  const factory ParkingLotDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'parkingZoneId') int? parkingZoneId,
    @JsonKey(name: 'maxCapacity') int? maxCapacity,
    @JsonKey(name: 'currentOccupied') int? currentOccupied,
  }) = _ParkingLotDto;

  factory ParkingLotDto.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotDtoFromJson(json);
}
