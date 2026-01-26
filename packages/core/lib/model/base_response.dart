import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseResponse<T> {
  final int? errorCode;
  final bool? success;
  final String? message;
  final T? data;

  BaseResponse({this.errorCode, this.success, this.message, this.data});

  bool get isSuccess => errorCode == 200;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}
