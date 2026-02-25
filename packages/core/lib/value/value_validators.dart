import 'package:core/error/failures.dart';
import 'package:core/value/value_transformers.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateTrimmedStringNotEmpty(
  String input,
) => input.trim().isNotEmpty
    ? right(input)
    : left(ValueFailure.empty(failedValue: input));

Either<ValueFailure<Map<String, String>>, Map<String, String>>
validateMapNotEmpty(Map<String, String> input) {
  return input.isNotEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<String>, String> validateDateString(String input) {
  final dateTime = tryParseDateTime(input);

  return dateTime != null
      ? right(input)
      : left(ValueFailure.invalidDateValue(failedValue: input));
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  return RegExp(emailRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.invalidEmail(failedValue: input));
}

Either<ValueFailure<String>, String> validateEmailVinAddress(String input) {
  const emailRegex =
      r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
  const vinGroupNet = '@vingroup.net';

  if (!RegExp(emailRegex).hasMatch(input)) {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }

  if (!input.endsWith(vinGroupNet)) {
    return left(ValueFailure.notVinGroupEmail(failedValue: input));
  }

  return right(input);
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // Password should be alphanumeric and consist of at least one upper case letter,
  // one special character and should be 10-20 characters long
  const passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,20}$';

  return RegExp(passwordRegex).hasMatch(input)
      ? right(input)
      : left(ValueFailure.passwordNotMatchRequirements(failedValue: input));
}

Either<ValueFailure<String>, String> validateMinStringLength(
  String input,
  int minLength,
) {
  return isMinCharacter(input: input, minLength: minLength)
      ? right(input)
      : left(ValueFailure.subceedLength(failedValue: input, min: minLength));
}

Either<ValueFailure<String>, String> atLeastOneUpperCharacter(String input) {
  return isAtLeastOneUpperCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneUpperCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneLowerCharacter(String input) {
  return isAtLeastOneLowerCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneLowerCaseCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneNumericCharacter(String input) {
  return isAtLeastOneNumericCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneNumericCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> atLeastOneSpecialCharacter(String input) {
  return isAtLeastOneSpecialCharacter(input: input)
      ? right(input)
      : left(ValueFailure.mustOneSpecialCharacter(failedValue: input));
}

Either<ValueFailure<String>, String> validateAbsenceOfSourceSubstrings(
  String textToValidate,
  String sourceText,
) {
  return containsSubstringFromSourceOfSizeThree(
        textToValidate: textToValidate,
        sourceString: sourceText,
      )
      ? left(
          ValueFailure.containsForbiddenSubstring(failedValue: textToValidate),
        )
      : right(textToValidate);
}

Either<ValueFailure<String>, String> validateStringIsEmpty(String input) {
  return input.isEmpty
      ? right(input)
      : left(ValueFailure.empty(failedValue: input));
}

Either<ValueFailure<double>, double> validateNumberIsBiggerThanZero(
  double input,
) {
  return input > 0.0
      ? right(input)
      : left(ValueFailure.numberMustBiggerThanZero(failedValue: input));
}

Either<ValueFailure<String>, String> validateStringIsBiggerThanZero(
  String input,
) {
  return double.parse(input) > 0.0
      ? right(input)
      : left(ValueFailure.numberMustBiggerThanZero(failedValue: input));
}

// Check if input does not exceed maxValue
Either<ValueFailure<String>, String> validateInputNotExceedMaxValue(
  String input,
  int maxValue,
) {
  return int.parse(input) <= maxValue
      ? right(input)
      : left(ValueFailure.exceedingMaxValue(failedValue: maxValue.toString()));
}

// Check if input is less than maxValue
Either<ValueFailure<String>, String> validateInputIsLessThanMaxValue(
  String input,
  double maxValue,
) {
  return double.parse(input) < maxValue
      ? right(input)
      : left(ValueFailure.exceedingMaxValue(failedValue: maxValue.toString()));
}

Either<ValueFailure<double>, double> validateDoubleValue(String input) {
  if (double.tryParse(input) == null) {
    return left(const ValueFailure.invalidDoubleValue(failedValue: 0));
  }

  return Right(double.parse(input));
}

Either<ValueFailure<int>, int> validateIntegerValue(String input) {
  input = input.split('.').first;
  if (int.tryParse(input) == null) {
    return left(const ValueFailure.invalidIntegerValue(failedValue: 0));
  }

  return Right(int.parse(input));
}

Either<ValueFailure<String>, String> validateJWT(String token) {
  try {
    getJWTPayload(token);

    return right(token);
  } catch (error) {
    return left(ValueFailure.invalidJWT(failedValue: token));
  }
}

Either<ValueFailure<String>, String> validateVinID(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  }

  if (input.length != 17) {
    return left(ValueFailure.invalidVin(failedValue: input));
  }

  final myVin = input.replaceAll(RegExp('[^a-zA-Z0-9]'), '').toUpperCase();

  if (myVin.length != 17) {
    return left(ValueFailure.invalidVin(failedValue: input));
  }

  const weights = <int>[8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2];
  const transliterations = <String, int>{
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
    'E': 5,
    'F': 6,
    'G': 7,
    'H': 8,
    'J': 1,
    'K': 2,
    'L': 3,
    'M': 4,
    'N': 5,
    'P': 7,
    'R': 9,
    'S': 2,
    'T': 3,
    'U': 4,
    'V': 5,
    'W': 6,
    'X': 7,
    'Y': 8,
    'Z': 9,
  };

  var sum = 0;
  for (var i = 0; i < myVin.length; i++) {
    final val = transliterations[myVin[i]];
    if (val == null) {
      return left(ValueFailure.invalidVin(failedValue: input));
    }
    sum += val * weights[i];
  }

  final checkDigit = sum % 11;
  final isValid = checkDigit == 10
      ? myVin[8] == 'X'
      : myVin[8] == checkDigit.toString();

  if (!isValid) {
    return left(ValueFailure.invalidVin(failedValue: input));
  }

  return right(myVin);
}
