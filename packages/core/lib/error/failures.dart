import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  /// Giá trị vượt quá độ dài tối đa cho phép
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  /// Giá trị ngắn hơn độ dài tối thiểu yêu cầu
  const factory ValueFailure.subceedLength({
    required T failedValue,
    required int min,
  }) = SubceedLength<T>;

  /// Giá trị bị bỏ trống (empty string hoặc null)
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  /// Giá trị chứa nhiều dòng (multiline) trong khi chỉ cho phép một dòng
  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;

  /// Email không đúng định dạng (sai pattern)
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  /// Mật khẩu không đạt đủ yêu cầu (ví dụ: độ dài, ký tự đặc biệt,…)
  const factory ValueFailure.passwordNotMatchRequirements({
    required T failedValue,
  }) = ShortPassword<T>;

  /// JWT (JSON Web Token) không hợp lệ về cấu trúc
  const factory ValueFailure.invalidJWT({
    required T failedValue,
  }) = InvalidJWT<T>;

  /// JWT hợp lệ về format nhưng payload bên trong không hợp lệ
  const factory ValueFailure.invalidJWTPayload({
    required T failedValue,
  }) = InvalidJWTPayload<T>;

  /// Mật khẩu thiếu ký tự viết hoa
  const factory ValueFailure.mustOneUpperCaseCharacter({
    required T failedValue,
  }) = OneUpperCase<T>;

  /// Mật khẩu thiếu ký tự viết thường
  const factory ValueFailure.mustOneLowerCaseCharacter({
    required T failedValue,
  }) = OneLowerCase<T>;

  /// Mật khẩu thiếu ký tự số
  const factory ValueFailure.mustOneNumericCharacter({
    required T failedValue,
  }) = OneNumeric<T>;

  /// Mật khẩu thiếu ký tự đặc biệt (ví dụ: @, #, $, %,...)
  const factory ValueFailure.mustOneSpecialCharacter({
    required T failedValue,
  }) = OneSpecial<T>;

  /// Mật khẩu chứa từ cấm, ví dụ như tên người dùng
  const factory ValueFailure.containsForbiddenSubstring({
    required T failedValue,
  }) = NotContainUserName<T>;

  /// Mật khẩu mới trùng với mật khẩu cũ (không được phép)
  const factory ValueFailure.mustNotMatchOldPassword({
    required T failedValue,
  }) = NotMatchOldPassword<T>;

  /// Mật khẩu nhập lại không trùng với mật khẩu mới
  const factory ValueFailure.mustMatchNewPassword({
    required T failedValue,
  }) = MatchNewPassword<T>;

  /// Dữ liệu rỗng hoặc null (tên trùng nhưng khác case so với `empty`)
  const factory ValueFailure.isEmpty({
    required T failedValue,
  }) = _isEmpty<T>;

  /// Giá trị số phải lớn hơn 0 (ví dụ: giá trị âm là không hợp lệ)
  const factory ValueFailure.numberMustBiggerThanZero({
    required T failedValue,
  }) = _numberMustBiggerThanZero<T>;

  /// Giá trị vượt quá giới hạn tối đa cho phép (ví dụ: max value)
  const factory ValueFailure.exceedingMaxValue({
    required T failedValue,
  }) = validateExceedsMaxValue<T>;

  /// Giá trị ngày tháng không hợp lệ (ví dụ: 30/02/2024)
  const factory ValueFailure.invalidDateValue({
    required T failedValue,
  }) = InvalidDateValue<T>;

  /// Giá trị số thực (double) không hợp lệ (parse lỗi hoặc ngoài phạm vi)
  const factory ValueFailure.invalidDoubleValue({
    required T failedValue,
  }) = InvalidDoubleValue<T>;

  /// Giá trị số nguyên (int) không hợp lệ
  const factory ValueFailure.invalidIntegerValue({
    required T failedValue,
  }) = InvalidIntegerValue<T>;
}
