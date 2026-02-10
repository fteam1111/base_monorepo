import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @parkingHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get parkingHistoryTitle;

  /// No description provided for @enterVinToViewHistory.
  ///
  /// In en, this message translates to:
  /// **'Enter VIN to view history'**
  String get enterVinToViewHistory;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @doList.
  ///
  /// In en, this message translates to:
  /// **'DO list'**
  String get doList;

  /// No description provided for @charging.
  ///
  /// In en, this message translates to:
  /// **'Charging'**
  String get charging;

  /// No description provided for @vehicleDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle details'**
  String get vehicleDetailTitle;

  /// No description provided for @vinIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Vin identifier'**
  String get vinIdentifier;

  /// No description provided for @vehicleModel.
  ///
  /// In en, this message translates to:
  /// **'Vehicle model'**
  String get vehicleModel;

  /// No description provided for @vehicleColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get vehicleColor;

  /// No description provided for @batteryCapacity.
  ///
  /// In en, this message translates to:
  /// **'Battery capacity'**
  String get batteryCapacity;

  /// No description provided for @aging.
  ///
  /// In en, this message translates to:
  /// **'Aging'**
  String get aging;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get currentLocation;

  /// No description provided for @availableActions.
  ///
  /// In en, this message translates to:
  /// **'Available actions'**
  String get availableActions;

  /// No description provided for @moveToExportArea.
  ///
  /// In en, this message translates to:
  /// **'Move to export waiting area'**
  String get moveToExportArea;

  /// No description provided for @prepareForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Prepare for delivery transport'**
  String get prepareForDelivery;

  /// No description provided for @moveToQCArea.
  ///
  /// In en, this message translates to:
  /// **'Move to QC area'**
  String get moveToQCArea;

  /// No description provided for @recheckQuality.
  ///
  /// In en, this message translates to:
  /// **'Recheck quality'**
  String get recheckQuality;

  /// No description provided for @chooseParkingLocation.
  ///
  /// In en, this message translates to:
  /// **'Choose parking location'**
  String get chooseParkingLocation;

  /// No description provided for @businessAreaClassification.
  ///
  /// In en, this message translates to:
  /// **'Business area classification'**
  String get businessAreaClassification;

  /// No description provided for @finishedProduct.
  ///
  /// In en, this message translates to:
  /// **'Finished product'**
  String get finishedProduct;

  /// No description provided for @chargingDischarging.
  ///
  /// In en, this message translates to:
  /// **'Charging/discharging'**
  String get chargingDischarging;

  /// No description provided for @exportWaiting.
  ///
  /// In en, this message translates to:
  /// **'Export waiting'**
  String get exportWaiting;

  /// No description provided for @qcArea.
  ///
  /// In en, this message translates to:
  /// **'QC area'**
  String get qcArea;

  /// No description provided for @chargingStatus.
  ///
  /// In en, this message translates to:
  /// **'Charging'**
  String get chargingStatus;

  /// No description provided for @entryTime.
  ///
  /// In en, this message translates to:
  /// **'Entry time'**
  String get entryTime;

  /// No description provided for @remainingSlots.
  ///
  /// In en, this message translates to:
  /// **'Remaining slots'**
  String get remainingSlots;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @deliveryOrders.
  ///
  /// In en, this message translates to:
  /// **'{count} delivery orders (DO)'**
  String deliveryOrders(Object count);

  /// No description provided for @youSelectedParkingSlot.
  ///
  /// In en, this message translates to:
  /// **'You have selected a parking slot'**
  String get youSelectedParkingSlot;

  /// No description provided for @factory.
  ///
  /// In en, this message translates to:
  /// **'Factory'**
  String get factory;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @parkingSelectionNote.
  ///
  /// In en, this message translates to:
  /// **'By selecting \"Confirm parking slot reservation\", the system will hold this empty slot for you for 15 minutes to perform vehicle operations.'**
  String get parkingSelectionNote;

  /// No description provided for @confirmParkingSelection.
  ///
  /// In en, this message translates to:
  /// **'Confirm parking slot reservation'**
  String get confirmParkingSelection;

  /// No description provided for @factoryMapTitle.
  ///
  /// In en, this message translates to:
  /// **'Factory map'**
  String get factoryMapTitle;

  /// No description provided for @exportWaitingAreaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Export waiting area'**
  String get exportWaitingAreaSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
