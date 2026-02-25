import 'package:json_annotation/json_annotation.dart';

part 'user_role_page_dto.g.dart';

/// DTO cho từng role trong danh sách role client.
@JsonSerializable(createToJson: false)
class UserRoleItemDto {
  UserRoleItemDto({
    required this.id,
    required this.name,
  });

  factory UserRoleItemDto.fromJson(Map<String, dynamic> json) =>
      _$UserRoleItemDtoFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;
}

/// DTO cho trang kết quả role:
/// {
///   "total": 4,
///   "page": 1,
///   "size": 10,
///   "totalPages": 1,
///   "data": [UserRoleItemDto...]
/// }
@JsonSerializable(createToJson: false)
class UserRolePageDto {
  UserRolePageDto({
    required this.total,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.data,
  });

  factory UserRolePageDto.fromJson(Map<String, dynamic> json) =>
      _$UserRolePageDtoFromJson(json);

  final int total;
  final int page;
  final int size;
  final int totalPages;
  final List<UserRoleItemDto> data;
}

