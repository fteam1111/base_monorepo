import 'package:intl/intl.dart';

/// Helper class để đọc giá trị từ `Map` (thường là JSON) một cách an toàn,
/// tránh `null` và đảm bảo luôn trả về kiểu mong muốn.
///
/// Dùng tốt cho việc mapping JSON thủ công, khi không dùng `json_serializable`.
class JsonReadValueHelper {
  /// Đọc một **String** từ `json[key]`.
  ///
  /// - Nếu key không tồn tại hoặc giá trị là `null` → trả về `''`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'name': 'John'};
  /// final name = JsonReadValueHelper.readString(json, 'name'); // 'John'
  /// final city = JsonReadValueHelper.readString(json, 'city'); // ''
  /// ```
  static String readString(Map json, String key) => json[key] ?? '';

  /// Đọc một giá trị boolean từ JSON khi API trả dạng **string** hoặc dynamic.
  ///
  /// - Nếu `json[key]` là `null` hoặc `''` → trả về `false`.
  /// - Ngược lại, trả về `json[key]` (thường là `true`/`false`).
  ///
  /// Lưu ý: Hàm này giả định API trả boolean/dynamic, không convert `'true'/'false'`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'isActive': true, 'isDeleted': ''};
  /// final isActive = JsonReadValueHelper.readBoolStringFormat(json, 'isActive'); // true
  /// final isDeleted = JsonReadValueHelper.readBoolStringFormat(json, 'isDeleted'); // false
  /// final isNew = JsonReadValueHelper.readBoolStringFormat(json, 'isNew'); // false
  /// ```
  static bool readBoolStringFormat(Map json, String key) =>
      json[key] == null || json[key] == '' ? false : json[key];

  /// Đọc một **`List<dynamic>`** từ `json[key]`.
  ///
  /// - Nếu key không tồn tại hoặc là `null` → trả về `[]`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'tags': ['flutter', 'dart']};
  /// final tags = JsonReadValueHelper.readList(json, 'tags'); // ['flutter', 'dart']
  /// final comments = JsonReadValueHelper.readList(json, 'comments'); // []
  /// ```
  static List<dynamic> readList(Map json, String key) => json[key] ?? [];

  /// Đọc một **`Map<String, dynamic>`** từ `json[key]`.
  ///
  /// - Nếu key không tồn tại hoặc là `null` → trả về `{}`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'profile': {'age': 30, 'city': 'HCM'}};
  /// final profile = JsonReadValueHelper.readValueMapDynamic(json, 'profile');
  /// // { 'age': 30, 'city': 'HCM' }
  ///
  /// final settings = JsonReadValueHelper.readValueMapDynamic(json, 'settings');
  /// // {}
  /// ```
  static Map<String, dynamic> readValueMapDynamic(Map json, String key) =>
      json[key] ?? <String, dynamic>{};

  /// Đọc một chuỗi thời gian ISO từ `json[key]` và format lại thành
  /// chuỗi ngày theo format `yMMMMd` (ví dụ: `January 1, 2024`).
  ///
  /// - Nếu giá trị rỗng hoặc `null` → trả về `''`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'createdAt': '2024-01-01T12:34:56.000Z'};
  /// final dateString =
  ///   JsonReadValueHelper.readDateTimeStringFormat(json, 'createdAt');
  /// // 'January 1, 2024' (tùy locale)
  /// ```
  static String readDateTimeStringFormat(Map json, String key) =>
      (json[key] ?? '').isNotEmpty
      ? DateFormat('yMMMMd').format(DateTime.parse(json[key]))
      : '';

  /// Đọc ngày `yyyy-MM-dd...` từ `json[key]` và **bỏ dấu gạch ngang**.
  ///
  /// - Ví dụ: `'2024-01-01'` → `'20240101'`.
  /// - Nếu `null` → trả về `''`.
  ///
  /// Thích hợp cho các API/logic yêu cầu ngày ở dạng `yyyyMMdd`.
  ///
  /// Ví dụ:
  /// ```dart
  /// final json = {'createdAt': '2024-01-01'};
  /// final createdAt =
  ///   JsonReadValueHelper.createdAtDate(json, 'createdAt'); // '20240101'
  /// ```
  static String createdAtDate(Map json, String key) =>
      json[key]?.replaceAll('-', '') ?? '';
}
