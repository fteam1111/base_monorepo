import 'package:core/error/errors.dart';
import 'package:core/error/failures.dart';
import 'package:core/value/constants.dart';
import 'package:core/value/value_transformers.dart';
import 'package:core/value/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrDefaultValue(T defaultValue) {
    return value.fold((f) => defaultValue, id);
  }

  T getValue() => value.fold((f) => f.failedValue, (r) => r);

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (r) => right(unit));
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class JWT extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory JWT(String input) {
    return JWT._(validateJWT(input));
  }

  DateTime get expirationDate {
    return getJWTExpirationDate(value.getOrElse(() => ''));
  }

  Duration get issueTime {
    return getJWTTime(value.getOrElse(() => ''));
  }

  Duration get remainingTime {
    return getJWTRemainingTime(value.getOrElse(() => ''));
  }

  String get userId {
    return getJwtUserId(value.getOrElse(() => ''));
  }

  bool get isExpired {
    return isJWTExpired(value.getOrElse(() => ''));
  }

  const JWT._(this.value);
}

class SearchKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchKey.empty() => SearchKey._(right(''));

  factory SearchKey.search(String searchText) {
    return SearchKey._(
      (validateStringIsEmpty(searchText).fold(
        (l) => validateMinStringLength(l.failedValue, 2),
        (r) => Right(r),
      )),
    );
  }

  bool get validateNotEmpty => searchValueOrEmpty.isNotEmpty;

  String get searchValueOrEmpty => value.getOrElse(() => '');

  int get countWhenValid => validateNotEmpty ? 1 : 0;

  bool get isValueEmpty => value.fold((l) => l.failedValue, (r) => r).isEmpty;

  String get upperCaseValue => getUpperCaseValue(searchValueOrEmpty);

  bool get isInvalidSearchKey => isValueEmpty || !isValid();

  const SearchKey._(this.value);
}

class DateTimeStringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DateTimeStringValue(String input) {
    return DateTimeStringValue._(validateDateString(input));
  }

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get _valueOrDash => value.getOrElse(() => '-');

  String get _valueOrNa => value.getOrElse(() => 'NA');

  bool get isNotEmpty => _valueOrEmpty.isNotEmpty;

  bool get isEmpty => _valueOrEmpty.isEmpty;

  String get dateOrNaString =>
      displayDateTimeString(_valueOrNa, DateTimeFormatString.displayDateFormat);

  String get dateTimeOrNaString =>
      displayDateTimeString(_valueOrNa, DateTimeFormatString.displayDateFormat);

  String get dateOrDashString => displayDateTimeString(
    _valueOrDash,
    DateTimeFormatString.displayDateFormat,
  );

  String get dateTimeOrDashString => displayDateTimeString(
    _valueOrDash,
    DateTimeFormatString.displayDateTimeFormat,
  );

  String get dateString => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.displayDateFormat,
  );

  String get dateStringIgnoreTimezone => displayDateTimeStringIgnoringTimezone(
    _valueOrEmpty,
    DateTimeFormatString.displayDateFormat,
  );

  String get simpleDateString => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.displaySimpleDateFormat,
  );

  String get dateTime12HoursString => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.displayDateTime12HoursFormat,
  );

  String get dateTimeWithTimeZone =>
      '$dateTime12HoursString ${getTimeZoneAbbreviation(dateTime.timeZoneOffset)}';

  String get time12HoursStringIgnoreTimezone =>
      displayDateTimeStringIgnoringTimezone(
        _valueOrEmpty,
        DateTimeFormatString.displayTime12HoursFormat,
      );

  String get dateTimeWithWeekDayString => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.displayDateTimeWithWeekDayFormat,
  );

  String get fullDateTimeWithTimeZone =>
      '$dateTimeWithWeekDayString ${getTimeZoneAbbreviation(dateTime.timeZoneOffset)}';

  String get apiDateTimeString =>
      displayDateTimeString(_valueOrEmpty, DateTimeFormatString.apiDateFormat);

  String get apiDateWithDashString => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.apiDateWithDashFormat,
  );

  int get intValue => getDateTimeIntValue(_valueOrEmpty);

  DateTime get dateTime => getDateTimeByDateString(_valueOrEmpty);

  DateTime? get dateTimeOrNull => tryParseDateTime(_valueOrEmpty);

  String get differenceTime => calculateDifferenceTime(_valueOrEmpty);

  String get notificationDateTime => displayDateTimeString(
    _valueOrEmpty,
    DateTimeFormatString.displayNotificationDateTimeFormat,
  );

  bool get aWeekDifference => differenceNGTWeek(dateTime);

  bool get isDateMoreThanAWeekAway => checkIfDateMoreThanAWeekAway(dateTime);

  DateTimeStringValue get threeDaysAfter =>
      DateTimeStringValue(getThreeDaysAfterString(dateTime));

  bool get withinAYearFromNow => dateTimeOrNull != null
      ? dateTimeOrNull!.difference(DateTime.now()).inDays <= 365
      : false;

  const DateTimeStringValue._(this.value);
}

class StringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringValue(String input) =>
      StringValue._(validateStringNotEmpty(input));

  factory StringValue.trimmed(String input) =>
      StringValue._(validateTrimmedStringNotEmpty(input));

  String get displayDashIfEmpty => dashIfEmpty((value.getOrElse(() => '')));

  String get displayNAIfEmpty => naIfEmpty(value.getOrElse(() => ''));

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  bool get isTrimmedValueNotEmpty =>
      checkIfTrimmedValueNotEmpty(value.getOrElse(() => ''));

  String get formattedValue =>
      trimAndRemoveConsecutiveSpace(value.getOrElse(() => ''));

  const StringValue._(this.value);
}

class RangeValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory RangeValue(String input) => RangeValue._(validateDoubleValue(input));

  String get apiParameterValue =>
      value.isLeft() ? '' : value.getOrElse(() => 0).toString();

  int get intValue => value.getOrElse(() => 0).toInt();

  double get doubleValue => value.getOrElse(() => 0);

  String get apiParameterValueIfNegative =>
      value.isLeft() ? '' : (-1 * value.getOrElse(() => 0)).toString();

  static bool checkIfRangeIsValid(RangeValue from, RangeValue to) =>
      (!from.isValid() && !to.isValid()) ||
      from.isValid() &&
          to.isValid() &&
          (to.getOrDefaultValue(0) >= from.getOrDefaultValue(0));

  static bool checkIfAnyIsEmpty(RangeValue from, RangeValue to) =>
      !from.isValid() && to.isValid() || from.isValid() && !to.isValid();

  const RangeValue._(this.value);
}

class IntegerValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory IntegerValue(String input) =>
      IntegerValue._(validateIntegerValue(input));

  String get apiParameterValue => emptyIfZero(value.getOrElse(() => 0));

  String get stringValue => value.getOrElse(() => 0).toString();

  bool get isGreaterThanZero => value.getOrElse(() => 0) > 0;

  bool get isZero => value.getOrElse(() => 0) == 0;

  const IntegerValue._(this.value);
}

class Language extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Language(String input) {
    return Language._(validateStringNotEmpty(input));
  }

  factory Language.english() {
    return const Language._(Right('EN'));
  }

  factory Language.shortEnglish() {
    return const Language._(Right('E'));
  }

  factory Language.vietnamese() {
    return const Language._(Right('VI'));
  }

  String get languageString => getLanguageString(value.getOrElse(() => ''));

  String get languageCode => toSupportedLanguage(value.getOrElse(() => 'EN'));

  String get languageCumCountryCode =>
      languageCodeToLanguageCumCountryCode(value.getOrElse(() => ''));

  Locale get locale => toLocale(languageCode);

  const Language._(this.value);
}

class AppLink extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AppLink(String input) {
    return AppLink._(validateStringNotEmpty(input));
  }

  Uri get uri => Uri.parse(value.getOrElse(() => ''));

  bool get isExampleLink => isExampleDeepLink(uri.path);

  const AppLink._(this.value);
}

class AppLinkQueryParameter extends ValueObject<Map<String, String>> {
  @override
  final Either<ValueFailure<Map<String, String>>, Map<String, String>> value;

  factory AppLinkQueryParameter(Map<String, String> input) {
    return AppLinkQueryParameter._(validateMapNotEmpty(input));
  }

  const AppLinkQueryParameter._(this.value);
}
