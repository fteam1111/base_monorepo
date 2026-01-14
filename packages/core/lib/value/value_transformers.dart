import 'dart:convert';

import 'package:core/value/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

Map<String, dynamic> getJWTPayload(String token) {
  final splitToken = token.split('.'); // Split the token by '.'
  if (splitToken.length != 3) {
    throw const FormatException('Invalid token');
  }
  try {
    final payloadBase64 = splitToken[1]; // Payload is always the index 1
    // Base64 should be multiple of 4. Normalize the payload before decode it
    final normalizedPayload = base64.normalize(payloadBase64);
    // Decode payload, the result is a String
    final payloadString = utf8.decode(base64.decode(normalizedPayload));
    // Parse the String to a Map<String, dynamic>

    return jsonDecode(payloadString);
  } catch (error) {
    throw const FormatException('Invalid payload');
  }
}

/// Returns token expiration date
DateTime getJWTExpirationDate(String token) {
  if (token.isEmpty) return DateTime.now();
  final decodedToken = getJWTPayload(token);

  return DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['exp'].toInt()),
  );
}

/// Returns token issuing date (iat)
Duration getJWTTime(String token) {
  if (token.isEmpty) return const Duration();
  final decodedToken = getJWTPayload(token);
  final issuedAtDate = DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['iat']),
  );

  return DateTime.now().difference(issuedAtDate);
}

/// Returns remaining time until expiry date.
Duration getJWTRemainingTime(String token) {
  if (token.isEmpty) return const Duration();
  final expirationDate = getJWTExpirationDate(token);

  return expirationDate.difference(DateTime.now());
}

String getJwtUserId(String token) {
  if (token.isEmpty) return '';
  final decodedToken = getJWTPayload(token);

  return decodedToken['id'].toString();
}

/// Tells whether a token is expired.
bool isJWTExpired(String token) {
  if (token.isEmpty) return true;
  final expirationDate = getJWTExpirationDate(token);

  return DateTime.now().isAfter(expirationDate);
}

List getJWTSalesOrg(String token) {
  if (token.isEmpty) return [];
  final payload = getJWTPayload(token);

  return payload['salesOrgs'];
}

/// Viết hoa ký tự đầu, phần còn lại viết thường. Input rỗng trả về chuỗi rỗng.
String stringCapitalize(String text) {
  if (text.isEmpty) return '';
  if (text.length == 1) return text;

  return '${text[0].toUpperCase()}${text.characters.getRange(1).toLowerCase()}';
}

/// Kiểm tra chuỗi KHÔNG rỗng và KHÔNG chỉ là khoảng trắng.
bool isNotEmpty(String text) {
  final pattern = RegExp(
    r'^\s*$',
  ); // matches any string is not empty or white space

  return !pattern.hasMatch(text);
}

/// Kiểm tra chuỗi có độ dài đúng bằng [n].
bool hasLengthN(String text, int n) {
  final pattern = RegExp('^.{$n}\$'); // matches any string of length n

  return pattern.hasMatch(text);
}

/// Kiểm tra chuỗi có độ dài >= [n] (bỏ xuống dòng trước khi so khớp).
bool hasLengthGreaterThanN(String text, int n) {
  final regex = RegExp('^.{$n,}\$'); // matches any string of length n or more

  return regex.hasMatch(text.replaceAll('\n', ' '));
}

/// True nếu độ dài == n hoặc >= n.
bool hasLengthEqualOrGreaterThanN(String text, int n) =>
    hasLengthN(text, n) || hasLengthGreaterThanN(text, n);

/// Bỏ các số 0 ở đầu chuỗi (nhưng không để chuỗi thành rỗng nếu có ký tự khác).
String removeLeadingZero(String text) {
  return text.isEmpty ? '' : text.replaceAll(RegExp(r'^0+(?=.)'), '');
}

/// Trả về 'NA' nếu chuỗi rỗng, ngược lại trả về chính chuỗi.
String naIfEmpty(String text) {
  return text.isEmpty ? 'NA' : text;
}

/// Kiểm tra chuỗi sau khi trim có rỗng không.
bool checkIfTrimmedValueNotEmpty(String text) => text.trim().isNotEmpty;

/// Trim hai đầu và thay nhiều khoảng trắng liên tiếp thành một khoảng trắng.
String trimAndRemoveConsecutiveSpace(String text) =>
    text.trim().replaceAll(RegExp(r'\s+'), ' ');

/// Kiểm tra tồn kho: trả true nếu [text] bằng 'Yes' (không phân biệt hoa thường).
bool getInStock(String text) {
  return isEqualsIgnoreCase(text, 'Yes');
}

/// Giữ lại chỉ chữ số trong số điện thoại, giới hạn tối đa 16 ký tự.
String getValidPhoneNumber(String text) {
  return text.replaceAll(RegExp(r'[^\d]+'), '').characters.take(16).toString();
}

/// Kiểm tra chuỗi có độ dài tối thiểu [minLength].
bool isMinCharacter({required String input, required int minLength}) =>
    hasLengthEqualOrGreaterThanN(input, minLength);

/// Có ít nhất 1 chữ thường.
bool isAtLeastOneLowerCharacter({required String input}) =>
    RegExp(r'[a-z]').hasMatch(input);

/// Có ít nhất 1 chữ hoa.
bool isAtLeastOneUpperCharacter({required String input}) =>
    RegExp(r'[A-Z]').hasMatch(input);

/// Có ít nhất 1 chữ số.
bool isAtLeastOneNumericCharacter({required String input}) =>
    RegExp(r'[0-9]').hasMatch(input);

/// Có ít nhất 1 ký tự đặc biệt trong nhóm quy định.
bool isAtLeastOneSpecialCharacter({required String input}) =>
    RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(input);

/// Chuẩn hóa hiển thị số hợp đồng thầu.
/// Nếu text là 'No contract (Price remains same)' -> 'Tender Contract available'
/// Ngược lại -> 'Contract: text.
String getTenderContractNumber(String text) {
  if (text.isEmpty) return text;

  return isEqualsIgnoreCase(text, 'No contract (Price remains same)')
      ? 'Tender Contract available'
      : 'Contract: $text';
}

/// Format ngày/giờ BỎ timezone (cắt phần +HH:MM ở cuối) theo [format].
String displayDateTimeStringIgnoringTimezone(String text, String format) {
  final dateTimeWithoutTimeZoneOffset = text.replaceAll(
    RegExp(r'\+\d{2}:\d{2}$'),
    '',
  );
  final parsedDate = DateTime.tryParse(dateTimeWithoutTimeZoneOffset);

  return parsedDate == null ? text : DateFormat(format).format(parsedDate);
}

/// Parse chuỗi ngày/giờ theo nhiều định dạng và format lại theo [format].
/// Nếu giờ là 00:00:00 thì loại bỏ phần thời gian trong chuỗi kết quả.
String displayDateTimeString(String text, String format) {
  final parsedDate = tryParseDateTime(text);
  if (parsedDate == null) {
    return text;
  }

  return DateFormat(format)
      .format(parsedDate)
      //remove time part if time is 00:00:00
      .replaceFirst(' 00:00:00', '');
}

/// Kiểm tra [textToValidate] có chứa bất kỳ chuỗi con 3 ký tự từ [sourceString] (case-insensitive) không.
bool containsSubstringFromSourceOfSizeThree({
  required String textToValidate,
  required String sourceString,
}) {
  for (var i = 0; i <= sourceString.length - 3; i++) {
    final substring = sourceString.characters
        .getRange(i, i + 3)
        .string
        .toLowerCase();
    if (textToValidate.toLowerCase().contains(substring)) return true;
  }

  return false;
}

/// Kiểm tra chuỗi chỉ gồm chữ số.
bool isNumericOnly(String text) => RegExp(r'^\d+$').hasMatch(text);

/// Cố gắng parse nhiều định dạng datetime:
/// - 'YYYYMMDD|timestamp' (timestamp giây)
/// - 'yyyy-MM-dd HH:mm:ss'
/// - 'MM/dd/yyyy HH:mm' (có/không AM|PM)
/// - Dạng số ghép yyyymmddhhmmss (padding tới 14)
/// - Fallback DateFormat.yMd().add_jm() hoặc DateTime.parse
/// Trả null nếu không parse được.
DateTime? tryParseDateTime(String input) {
  if (isNotEmpty(input)) {
    try {
      //Case 'date|time' example: '20230905|1693894295'
      if (RegExp(r'^\d{8}\|\d*$').hasMatch(input)) {
        final parts = input.split('|');
        final dateStr = parts.first;
        final date = DateTime.parse(dateStr);

        final timeStr = parts[1];
        if (timeStr.isEmpty) {
          return DateTime.utc(date.year, date.month, date.day).toLocal();
        } else {
          final timestamp = int.parse(timeStr);
          final time = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

          return DateTime.utc(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
            time.second,
          ).toLocal();
        }
      }

      //Case Date and Time(YYYY-MM-DD HH:mm:ss)example: '2023-11-20 07:36:33'
      if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$').hasMatch(input)) {
        return DateFormat('yyyy-MM-dd HH:mm:ss').parse(input, true).toLocal();
      }

      //Case Date and Time(MM/dd/yyyy HH:mm)example: '01/30/2024 04:32'
      if (RegExp(r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2}$').hasMatch(input)) {
        return DateFormat(
          DateTimeFormatString.announcementDateFormat,
        ).parse(input, false).toLocal();
      }

      //Case Date and Time and(MM/dd/yyyy HH:mm a)example: '01/30/2024 04:32 PM'
      if (RegExp(
        r'^\d{1,2}/\d{1,2}/\d{4} \d{1,2}:\d{1,2} (AM|PM)$',
      ).hasMatch(input)) {
        return DateFormat(
          DateTimeFormatString.announcementDateFormat,
        ).parse(input, false).toLocal();
      }

      //input with format yyyyddmmhh
      final intVal = getDateTimeIntValue(input);
      if (intVal > 0) {
        final standardInput = input.padRight(14, '0');
        final year = int.parse(
          standardInput.characters.getRange(0, 4).toString(),
        );
        final month = int.parse(
          standardInput.characters.getRange(4, 6).toString(),
        );
        final day = int.parse(
          standardInput.characters.getRange(6, 8).toString(),
        );
        final hour = int.parse(
          standardInput.characters.getRange(8, 10).toString(),
        );
        final minute = int.parse(
          standardInput.characters.getRange(10, 12).toString(),
        );
        final second = int.parse(
          standardInput.characters.getRange(12, 14).toString(),
        );

        //if length is 10, then it convert dateTime till hour
        //yyyyddmmhh (only for principal Date)
        if (hasLengthN(input, 10)) {
          return DateTime.utc(year, month, day, hour).toLocal();
        }

        return DateTime(year, month, day, hour, minute, second).toLocal();
      } else {
        try {
          //input for announcement date
          return DateFormat.yMd().add_jm().parse(input);
        } catch (_) {
          //input for invoices date string with format yyyy-MM-dd
          return input.replaceAll(RegExp(r'^0+(?=.)'), '') == '0'
              ? null
              : DateTime.parse(input).toLocal();
        }
      }
    } on FormatException {
      return null;
    }
  }

  return null;
}

/// Parse được thì trả DateTime, không thì trả DateTime.now().
DateTime getDateTimeByDateString(String value) =>
    tryParseDateTime(value) ?? DateTime.now();

/// Tính chênh lệch thời gian với hiện tại, trả về "Xd"/"Xh"/"Xm".
String calculateDifferenceTime(String value) {
  final dateTime = getDateTimeByDateString(value);
  final difference = DateTime.now().difference(dateTime);
  final minutes = difference.inMinutes;
  if (minutes >= 1440) {
    final days = difference.inDays;

    return '$days d';
  } else if (minutes >= 60) {
    final hours = difference.inHours;

    return '$hours h';
  } else {
    return '$minutes m';
  }
}

/// Format DateTime theo định dạng API chuẩn.
String getDateStringByDateTime(DateTime dateTime) =>
    DateFormat(DateTimeFormatString.apiDateFormat).format(dateTime);

/// Trả chuỗi rỗng nếu [value] == 0, ngược lại trả value.toString().
String emptyIfZero(num value) {
  return value == 0 ? '' : value.toString();
}

/// Trả int nếu [value] là numeric, ngược lại 0.
int getDateTimeIntValue(String value) =>
    isNumericOnly(value) ? int.parse(value) : 0;

/// Lấy viết tắt timezone theo offset giờ (map cục bộ một số TZ phổ biến).
String getTimeZoneAbbreviation(Duration timeZoneOffset) {
  final abbreviationMap = {
    -8: 'PST',
    -7: 'MST',
    -6: 'CST',
    -5: 'EST',
    -4: 'AST',
    -3: 'ADT',
    0: 'GMT',
    1: 'CET',
    7: 'ICT',
    8: 'SGT',
  };

  return abbreviationMap[timeZoneOffset.inHours] ?? '';
}

/// Trả '-' nếu chuỗi rỗng.
String dashIfEmpty(String text) {
  return text.isEmpty ? '-' : text;
}

/// Parse số nguyên từ chuỗi quantity, rỗng thì 0.
int getIntegerReturnQuantity(String quantity) =>
    quantity.isEmpty ? 0 : int.parse(quantity);

/// Kiểm tra số khác 0.
bool notZero(int number) => number != 0;

/// Lấy chuỗi datetime sau 3 ngày, theo defaultDateTimeFormat.
String getThreeDaysAfterString(DateTime dateTime) => DateFormat(
  DateTimeFormatString.defaultDateTimeFormat,
).format(dateTime.add(const Duration(days: 3)));

/// Số ngày còn lại từ hiện tại đến (date + 3 ngày).
int paymentAttentionExpiryInDays(DateTime date) =>
    date.add(const Duration(days: 3)).difference(DateTime.now()).inDays;

/// True nếu chênh lệch từ [date] đến hiện tại < 7 ngày và không âm.
bool differenceNGTWeek(DateTime date) {
  final diff = DateTime.now().difference(date).inDays;

  return (!diff.isNegative) && diff < 7;
}

/// True nếu [date] cách hiện tại > 7 ngày (trong tương lai).
bool checkIfDateMoreThanAWeekAway(DateTime date) {
  final diff = date.difference(DateTime.now()).inDays;

  return diff > 7;
}

/// Map country code ('en','vn') sang locale string ('en-US','vi-VN').
String getLocale(String country) {
  final marketLocaleMap = {'en': 'en-US', 'vn': 'vi-VN'};

  return marketLocaleMap[country] ?? 'en-US';
}

/// Viết hoa toàn bộ chuỗi.
String getUpperCaseValue(String value) => value.toUpperCase();

/// Map mã ngôn ngữ API ('VI','EN') sang tên hiển thị.
String getLanguageString(String apiLanguageCode) {
  final languageString = {'VI': 'Tiếng Việt', 'EN': 'English'};

  return languageString[apiLanguageCode] ?? 'English';
}

/// Map 'en'→'en-US', 'vi'→'vi-VN' (fallback trả lowercase input nếu không khớp).
String languageCodeToLanguageCumCountryCode(String languageCode) {
  final languageCodesMap = {'en': 'en-US', 'vi': 'vi-VN'};

  return languageCodesMap[languageCode.toLowerCase()] ??
      languageCode.toLowerCase();
}

/// Chỉ chấp nhận 'VI' hoặc 'EN'. Khác trả 'EN'.
String toSupportedLanguage(String value) {
  final supportedLanguageList = ['VI', 'EN'];

  return supportedLanguageList.contains(value) ? value : 'EN';
}

/// Trả đối tượng Locale từ apiLanguageCode (lowercase).
Locale toLocale(String apiLanguageCode) =>
    Locale(apiLanguageCode.toLowerCase());

/// Lấy tên file từ đường dẫn.
String fileNameFromPath(String source) => path.basename(source);

/// Lấy phần mở rộng (extension) từ đường dẫn.
String fileTypeFromPath(String source) {
  return path.extension(source);
}

/// Kiểm tra path có đúng deeplink ví dụ '/example/deeplink'.
bool isExampleDeepLink(String path) => path == '/example/deeplink';

/// So sánh bằng nhau, trim và không phân biệt hoa thường.
bool isEqualsIgnoreCase(String value, String matcher) =>
    value.trim().toLowerCase() == matcher.trim().toLowerCase();

/// Kiểm tra [value] có chứa [containValue], trim và không phân biệt hoa thường.
bool isContainIgnoreCase(String value, String containValue) =>
    value.trim().toLowerCase().contains(containValue.trim().toLowerCase());

// Query params từ deep linking (gợi ý: thêm hàm parse query nếu cần)
