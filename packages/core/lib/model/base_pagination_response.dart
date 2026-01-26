import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_pagination_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BasePaginationResponse<T> {
  final bool? success;
  final String? message;
  final Pagination<T>? data;
  final String? errorCode;

  const BasePaginationResponse({
    this.success,
    this.message,
    this.data,
    this.errorCode,
  });

  bool get isSuccess => success == true && errorCode == null;

  factory BasePaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BasePaginationResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class Pagination<T> {
  final int? total;
  final int? page;
  final int? totalPages;
  final int? size;
  final T? data;

  const Pagination({
    this.total,
    this.page,
    this.totalPages,
    this.size,
    this.data,
  });

  factory Pagination.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginationFromJson(json, fromJsonT);
}
