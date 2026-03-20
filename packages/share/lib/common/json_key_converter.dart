import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

/// Convert JSON string có key dạng bất kỳ sang Map với **key camelCase**.
///
/// Cơ chế:
/// - Dùng RegExp để bắt các key trong JSON string
/// - Hạ chữ cái đầu của mỗi key (UserName -> userName)
/// - Sau đó `jsonDecode` để trả về Map/List Dart
///
/// Ví dụ:
/// ```dart
/// const rawJson = '{"UserName": "John", "EmailAddress": "john@test.com"}';
/// final result = makeResponseCamelCase(rawJson);
///
/// // result sẽ là:
/// // {
/// //   "userName": "John",
/// //   "emailAddress": "john@test.com",
/// // }
/// ```
dynamic makeResponseCamelCase(String resp) {
  final camelCaseJsonKeys = resp.replaceAllMapped(
    RegExp('(?<key>[\\w\\d]+)(?:\\"|\')(?:\\:\\s*)'),
    (Match m) {
      // m.group(0)! là toàn bộ match, ví dụ: "UserName":
      // [0]          -> ký tự đầu tiên của key
      // characters   -> để đảm bảo xử lý đúng với Unicode
      return m.group(0)![0].toLowerCase() +
          m.group(0)!.characters.getRange(1).toString();
    },
  );

  return jsonDecode(camelCaseJsonKeys);
}

/// Helper cho `toJson`: nếu string rỗng thì trả về `null` thay vì "".
///
/// Thường dùng trong `json_serializable` để tránh gửi field rỗng lên API.
///
/// Ví dụ:
/// ```dart
/// @JsonKey(toJson: valueOrNullToJson)
/// final String middleName;
///
/// // middleName = ''  -> JSON không chứa key `middleName` (hoặc là null)
/// // middleName = 'A' -> JSON: { "middleName": "A" }
/// ```
dynamic valueOrNullToJson(String value) => value.isNotEmpty ? value : null;

/// Converter cho `json_serializable`:
/// map **String** từ JSON sang **double** trong model.
///
/// Dùng khi API trả số dạng string, ví dụ `"price": "12.5"`.
///
/// Ví dụ sử dụng:
/// ```dart
/// @StringToDoubleConverter()
/// @JsonKey(name: 'price')
/// final double price;
/// ```
class StringToDoubleConverter extends JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) => double.tryParse(json) ?? 0;

  @override
  String toJson(double object) => object.toString();
}

/// Converter cho `json_serializable`:
/// map **String** từ JSON sang **int** trong model.
///
/// Hỗ trợ cả string số thực, ví dụ `"10.0"` -> `10`.
///
/// Ví dụ sử dụng:
/// ```dart
/// @StringToIntConverter()
/// @JsonKey(name: 'age')
/// final int age;
/// ```
class StringToIntConverter extends JsonConverter<int, String> {
  const StringToIntConverter();

  @override
  int fromJson(String json) => (double.tryParse(json) ?? 0).toInt();

  @override
  String toJson(int object) => object.toString();
}

