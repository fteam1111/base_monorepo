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

  /// No description provided for @vehicleChargingAreaTitle.
  ///
  /// In en, this message translates to:
  /// **'Pending Charging Maintenance'**
  String get vehicleChargingAreaTitle;

  /// No description provided for @vehicleChargingAreaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicles pending for more than 30 days'**
  String get vehicleChargingAreaSubtitle;

  /// No description provided for @vehicleChargingSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by VIN...'**
  String get vehicleChargingSearchHint;

  /// No description provided for @vehicleChargingInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'CHARGING INFO'**
  String get vehicleChargingInfoTitle;

  /// No description provided for @vehicleChargingInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'VEHICLE DETAILS'**
  String get vehicleChargingInfoSubtitle;

  /// No description provided for @vehicleChargingInfoStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get vehicleChargingInfoStatusLabel;

  /// No description provided for @vehicleChargingInfoSubAreaLabel.
  ///
  /// In en, this message translates to:
  /// **'SUB AREA'**
  String get vehicleChargingInfoSubAreaLabel;

  /// No description provided for @vehicleChargingInfoCheckAgingDateLabel.
  ///
  /// In en, this message translates to:
  /// **'CHECK AGING DATE'**
  String get vehicleChargingInfoCheckAgingDateLabel;

  /// No description provided for @vehicleChargingCloseInfo.
  ///
  /// In en, this message translates to:
  /// **'CLOSE INFO'**
  String get vehicleChargingCloseInfo;

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

  /// No description provided for @deliveryOrderListTitle.
  ///
  /// In en, this message translates to:
  /// **'DO List'**
  String get deliveryOrderListTitle;

  /// No description provided for @deliveryOrderBatchTitle.
  ///
  /// In en, this message translates to:
  /// **'BATCH DELIVERY ORDERS'**
  String get deliveryOrderBatchTitle;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'CUSTOMER'**
  String get customer;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'PROGRESS'**
  String get progress;

  /// No description provided for @filterList.
  ///
  /// In en, this message translates to:
  /// **'LIST FILTER'**
  String get filterList;

  /// No description provided for @findVinCode.
  ///
  /// In en, this message translates to:
  /// **'Search VIN...'**
  String get findVinCode;

  /// No description provided for @allModels.
  ///
  /// In en, this message translates to:
  /// **'ALL MODELS'**
  String get allModels;

  /// No description provided for @allColors.
  ///
  /// In en, this message translates to:
  /// **'ALL COLORS'**
  String get allColors;

  /// No description provided for @pickUpGuide.
  ///
  /// In en, this message translates to:
  /// **'PICKUP GUIDE'**
  String get pickUpGuide;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'{count} RESULTS'**
  String results(Object count);

  /// No description provided for @resultsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} RESULTS'**
  String resultsCount(Object count);

  /// No description provided for @warehouse.
  ///
  /// In en, this message translates to:
  /// **'Warehouse entry: {date}'**
  String warehouse(Object date);

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

  /// No description provided for @deliveryOrderStatusPreparing.
  ///
  /// In en, this message translates to:
  /// **'PREPARING'**
  String get deliveryOrderStatusPreparing;

  /// No description provided for @deliveryOrderStatusReady.
  ///
  /// In en, this message translates to:
  /// **'READY'**
  String get deliveryOrderStatusReady;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get all;

  /// No description provided for @allWithCount.
  ///
  /// In en, this message translates to:
  /// **'ALL ({count})'**
  String allWithCount(Object count);

  /// No description provided for @preparingWithCount.
  ///
  /// In en, this message translates to:
  /// **'PREPARING ({count})'**
  String preparingWithCount(Object count);

  /// No description provided for @readyWithCount.
  ///
  /// In en, this message translates to:
  /// **'READY ({count})'**
  String readyWithCount(Object count);

  /// No description provided for @unitVehicle.
  ///
  /// In en, this message translates to:
  /// **'VEHICLES'**
  String get unitVehicle;

  /// No description provided for @unitUnit.
  ///
  /// In en, this message translates to:
  /// **'UNITS'**
  String get unitUnit;

  /// No description provided for @deliveryOrderCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'DELIVERY ORDER CODE'**
  String get deliveryOrderCodeLabel;

  /// No description provided for @deliveryOrderVehicleModelLabel.
  ///
  /// In en, this message translates to:
  /// **'VEHICLE MODEL'**
  String get deliveryOrderVehicleModelLabel;

  /// No description provided for @deliveryOrderColorLabel.
  ///
  /// In en, this message translates to:
  /// **'COLOR'**
  String get deliveryOrderColorLabel;

  /// No description provided for @deliveryOrderQuantityLabel.
  ///
  /// In en, this message translates to:
  /// **'QUANTITY'**
  String get deliveryOrderQuantityLabel;

  /// No description provided for @deliveryOrderQuantityUnit.
  ///
  /// In en, this message translates to:
  /// **'UNITS'**
  String get deliveryOrderQuantityUnit;

  /// No description provided for @locationFormat.
  ///
  /// In en, this message translates to:
  /// **'Area {area} - Position {position}'**
  String locationFormat(Object area, Object position);

  /// No description provided for @deliveryOrderDeadlineLabel.
  ///
  /// In en, this message translates to:
  /// **'DEADLINE'**
  String get deliveryOrderDeadlineLabel;

  /// No description provided for @deliveryOrderCompletionProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'COMPLETION PROGRESS'**
  String get deliveryOrderCompletionProgressLabel;

  /// No description provided for @deliveryOrderDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'DO: {code}'**
  String deliveryOrderDetailTitle(Object code);

  /// No description provided for @deliveryOrderPickupGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'PICKUP GUIDE'**
  String get deliveryOrderPickupGuideTitle;

  /// No description provided for @fifoBadge.
  ///
  /// In en, this message translates to:
  /// **'FIFO #{number}'**
  String fifoBadge(Object number);

  /// No description provided for @errorExceedingLength.
  ///
  /// In en, this message translates to:
  /// **'Giá trị vượt quá độ dài tối đa cho phép ({max} ký tự)'**
  String errorExceedingLength(int max);

  /// No description provided for @errorSubceedLength.
  ///
  /// In en, this message translates to:
  /// **'Giá trị ngắn hơn độ dài tối thiểu yêu cầu ({min} ký tự)'**
  String errorSubceedLength(int min);

  /// No description provided for @errorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Giá trị không được để trống'**
  String get errorEmpty;

  /// No description provided for @errorMultiline.
  ///
  /// In en, this message translates to:
  /// **'Giá trị chỉ được phép một dòng'**
  String get errorMultiline;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Email không đúng định dạng'**
  String get errorInvalidEmail;

  /// No description provided for @errorNotVinGroupEmail.
  ///
  /// In en, this message translates to:
  /// **'Email phải thuộc domain @vingroup.net'**
  String get errorNotVinGroupEmail;

  /// No description provided for @errorPasswordNotMatchRequirements.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu không đạt đủ yêu cầu'**
  String get errorPasswordNotMatchRequirements;

  /// No description provided for @errorInvalidJWT.
  ///
  /// In en, this message translates to:
  /// **'JWT không hợp lệ'**
  String get errorInvalidJWT;

  /// No description provided for @errorInvalidJWTPayload.
  ///
  /// In en, this message translates to:
  /// **'JWT payload không hợp lệ'**
  String get errorInvalidJWTPayload;

  /// No description provided for @errorMustOneUpperCaseCharacter.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu phải có ít nhất một ký tự viết hoa'**
  String get errorMustOneUpperCaseCharacter;

  /// No description provided for @errorMustOneLowerCaseCharacter.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu phải có ít nhất một ký tự viết thường'**
  String get errorMustOneLowerCaseCharacter;

  /// No description provided for @errorMustOneNumericCharacter.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu phải có ít nhất một ký tự số'**
  String get errorMustOneNumericCharacter;

  /// No description provided for @errorMustOneSpecialCharacter.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu phải có ít nhất một ký tự đặc biệt'**
  String get errorMustOneSpecialCharacter;

  /// No description provided for @errorContainsForbiddenSubstring.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu không được chứa tên người dùng'**
  String get errorContainsForbiddenSubstring;

  /// No description provided for @errorMustNotMatchOldPassword.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu mới không được trùng với mật khẩu cũ'**
  String get errorMustNotMatchOldPassword;

  /// No description provided for @errorMustMatchNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Mật khẩu nhập lại không khớp'**
  String get errorMustMatchNewPassword;

  /// No description provided for @errorIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Giá trị không được để trống'**
  String get errorIsEmpty;

  /// No description provided for @errorNumberMustBiggerThanZero.
  ///
  /// In en, this message translates to:
  /// **'Giá trị phải lớn hơn 0'**
  String get errorNumberMustBiggerThanZero;

  /// No description provided for @errorExceedingMaxValue.
  ///
  /// In en, this message translates to:
  /// **'Giá trị vượt quá giới hạn tối đa cho phép'**
  String get errorExceedingMaxValue;

  /// No description provided for @errorInvalidDateValue.
  ///
  /// In en, this message translates to:
  /// **'Ngày tháng không hợp lệ'**
  String get errorInvalidDateValue;

  /// No description provided for @errorInvalidDoubleValue.
  ///
  /// In en, this message translates to:
  /// **'Giá trị số thực không hợp lệ'**
  String get errorInvalidDoubleValue;

  /// No description provided for @errorInvalidIntegerValue.
  ///
  /// In en, this message translates to:
  /// **'Giá trị số nguyên không hợp lệ'**
  String get errorInvalidIntegerValue;

  /// No description provided for @errorInvalidVin.
  ///
  /// In en, this message translates to:
  /// **'VIN không hợp lệ'**
  String get errorInvalidVin;

  /// No description provided for @qrScannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan vehicle QR code'**
  String get qrScannerTitle;

  /// No description provided for @qrScannerHint.
  ///
  /// In en, this message translates to:
  /// **'Place the QR code inside the frame'**
  String get qrScannerHint;

  /// No description provided for @vehicleChargingAgingWarning.
  ///
  /// In en, this message translates to:
  /// **'There are {count} vehicles with a high aging index that need to be processed'**
  String vehicleChargingAgingWarning(int count);

  /// No description provided for @vehicleChargingFetchError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load vehicle list.'**
  String get vehicleChargingFetchError;

  /// No description provided for @vehicleChargingEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'ALL VEHICLES ARE STABLE'**
  String get vehicleChargingEmptyTitle;

  /// No description provided for @vehicleChargingEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'No vehicles found with Aging index over 30 days requiring charging.'**
  String get vehicleChargingEmptySubtitle;

  /// No description provided for @vehicleChargingPriority.
  ///
  /// In en, this message translates to:
  /// **'PRIORITY #{number}'**
  String vehicleChargingPriority(int number);

  /// No description provided for @vehicleChargingMaintenaceActionHint.
  ///
  /// In en, this message translates to:
  /// **'TAP TO PERFORM MAINTENANCE'**
  String get vehicleChargingMaintenaceActionHint;

  /// No description provided for @vehicleChargingMaintenanceRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'BATTERY MAINTENANCE REQUEST'**
  String get vehicleChargingMaintenanceRequestTitle;

  /// No description provided for @vehicleChargingCurrentAgingLabel.
  ///
  /// In en, this message translates to:
  /// **'CURRENT AGING:'**
  String get vehicleChargingCurrentAgingLabel;

  /// No description provided for @vehicleChargingMoveToChargeAction.
  ///
  /// In en, this message translates to:
  /// **'TAKE VEHICLE TO CHARGE'**
  String get vehicleChargingMoveToChargeAction;

  /// No description provided for @vehicleChargingNoNeedAction.
  ///
  /// In en, this message translates to:
  /// **'NO CHARGE NEEDED'**
  String get vehicleChargingNoNeedAction;

  /// No description provided for @vehicleChargingLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'CURRENT LOCATION'**
  String get vehicleChargingLocationLabel;

  /// No description provided for @vehicleChargingTimeInAreaLabel.
  ///
  /// In en, this message translates to:
  /// **'ENTER AREA'**
  String get vehicleChargingTimeInAreaLabel;

  /// No description provided for @agingDays.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String agingDays(Object count);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @dischargingStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'STATUS UPDATED'**
  String get dischargingStatusUpdated;

  /// No description provided for @dischargingVehicleStatus.
  ///
  /// In en, this message translates to:
  /// **'VEHICLE STATUS:'**
  String get dischargingVehicleStatus;

  /// No description provided for @dischargingInstruction.
  ///
  /// In en, this message translates to:
  /// **'PLEASE BRING THE VEHICLE TO THE CHARGE/DISCHARGE AREA TO CONTINUE THE MAINTENANCE PROCESS.'**
  String get dischargingInstruction;

  /// No description provided for @dischargingVinLabel.
  ///
  /// In en, this message translates to:
  /// **'VIN CODE'**
  String get dischargingVinLabel;

  /// No description provided for @dischargingLocationLabel.
  ///
  /// In en, this message translates to:
  /// **'ORIGINAL LOCATION'**
  String get dischargingLocationLabel;

  /// No description provided for @dischargingTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'TIME'**
  String get dischargingTimeLabel;

  /// No description provided for @dischargingCompleteAction.
  ///
  /// In en, this message translates to:
  /// **'COMPLETE UPDATE'**
  String get dischargingCompleteAction;
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
