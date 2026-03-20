import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:share/extensions/context_ext.dart';

/// Extension để lấy message lỗi từ ValueFailure
/// example:
///   final email = EmailVinAddress(value ?? '');
///     return email.value.fold(
///       (failure) => failure.getMessage(context),
///       (_) => null,
///     );
extension ValueFailureX on ValueFailure {
  String getMessage(BuildContext context) {
    final l10n = context.l10n;

    return when(
      exceedingLength: (failedValue, max) => l10n.errorExceedingLength(max),

      subceedLength: (failedValue, min) => l10n.errorSubceedLength(min),

      empty: (_) => l10n.errorEmpty,

      multiline: (_) => l10n.errorMultiline,

      invalidEmail: (_) => l10n.errorInvalidEmail,

      notVinGroupEmail: (_) => l10n.errorNotVinGroupEmail,

      passwordNotMatchRequirements: (_) =>
          l10n.errorPasswordNotMatchRequirements,

      invalidJWT: (_) => l10n.errorInvalidJWT,

      invalidJWTPayload: (_) => l10n.errorInvalidJWTPayload,

      mustOneUpperCaseCharacter: (_) => l10n.errorMustOneUpperCaseCharacter,

      mustOneLowerCaseCharacter: (_) => l10n.errorMustOneLowerCaseCharacter,

      mustOneNumericCharacter: (_) => l10n.errorMustOneNumericCharacter,

      mustOneSpecialCharacter: (_) => l10n.errorMustOneSpecialCharacter,

      containsForbiddenSubstring: (_) => l10n.errorContainsForbiddenSubstring,

      mustNotMatchOldPassword: (_) => l10n.errorMustNotMatchOldPassword,

      mustMatchNewPassword: (_) => l10n.errorMustMatchNewPassword,

      isEmpty: (_) => l10n.errorIsEmpty,

      numberMustBiggerThanZero: (_) => l10n.errorNumberMustBiggerThanZero,

      exceedingMaxValue: (_) => l10n.errorExceedingMaxValue,

      invalidDateValue: (_) => l10n.errorInvalidDateValue,

      invalidDoubleValue: (_) => l10n.errorInvalidDoubleValue,

      invalidIntegerValue: (_) => l10n.errorInvalidIntegerValue,

      invalidVin: (_) => l10n.errorInvalidVin,
    );
  }
}
