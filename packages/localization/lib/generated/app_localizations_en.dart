// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get next => 'Next';

  @override
  String get skip => 'Skip';

  @override
  String get getStarted => 'Get started';

  @override
  String get parkingHistoryTitle => 'History';

  @override
  String get vehicleChargingAreaTitle => 'Pending Charging Maintenance';

  @override
  String get vehicleChargingAreaSubtitle =>
      'Vehicles pending for more than 30 days';

  @override
  String get vehicleChargingSearchHint => 'Search by VIN...';

  @override
  String get vehicleChargingInfoTitle => 'CHARGING INFO';

  @override
  String get vehicleChargingInfoSubtitle => 'VEHICLE DETAILS';

  @override
  String get vehicleChargingInfoStatusLabel => 'STATUS';

  @override
  String get vehicleChargingInfoSubAreaLabel => 'SUB AREA';

  @override
  String get vehicleChargingInfoCheckAgingDateLabel => 'CHECK AGING DATE';

  @override
  String get vehicleChargingCloseInfo => 'CLOSE INFO';

  @override
  String get enterVinToViewHistory => 'Enter VIN to view history';

  @override
  String get map => 'Map';

  @override
  String get doList => 'DO list';

  @override
  String get deliveryOrderListTitle => 'DO List';

  @override
  String get deliveryOrderBatchTitle => 'BATCH DELIVERY ORDERS';

  @override
  String get customer => 'CUSTOMER';

  @override
  String get progress => 'PROGRESS';

  @override
  String get filterList => 'LIST FILTER';

  @override
  String get findVinCode => 'Search VIN...';

  @override
  String get allModels => 'ALL MODELS';

  @override
  String get allColors => 'ALL COLORS';

  @override
  String get pickUpGuide => 'PICKUP GUIDE';

  @override
  String results(Object count) {
    return '$count RESULTS';
  }

  @override
  String resultsCount(Object count) {
    return '$count RESULTS';
  }

  @override
  String warehouse(Object date) {
    return 'Warehouse entry: $date';
  }

  @override
  String get charging => 'Charging';

  @override
  String get vehicleDetailTitle => 'Vehicle details';

  @override
  String get vinIdentifier => 'Vin identifier';

  @override
  String get vehicleModel => 'Vehicle model';

  @override
  String get vehicleColor => 'Color';

  @override
  String get batteryCapacity => 'Battery capacity';

  @override
  String get aging => 'Aging';

  @override
  String get currentLocation => 'Current location';

  @override
  String get availableActions => 'Available actions';

  @override
  String get moveToExportArea => 'Move to export waiting area';

  @override
  String get prepareForDelivery => 'Prepare for delivery transport';

  @override
  String get moveToQCArea => 'Move to QC area';

  @override
  String get recheckQuality => 'Recheck quality';

  @override
  String get chooseParkingLocation => 'Choose parking location';

  @override
  String get businessAreaClassification => 'Business area classification';

  @override
  String get finishedProduct => 'Finished product';

  @override
  String get chargingDischarging => 'Charging/discharging';

  @override
  String get exportWaiting => 'Export waiting';

  @override
  String get qcArea => 'QC area';

  @override
  String get chargingStatus => 'Charging';

  @override
  String get entryTime => 'Entry time';

  @override
  String get remainingSlots => 'Remaining slots';

  @override
  String get capacity => 'Capacity';

  @override
  String deliveryOrders(Object count) {
    return '$count delivery orders (DO)';
  }

  @override
  String get youSelectedParkingSlot => 'You have selected a parking slot';

  @override
  String get factory => 'Factory';

  @override
  String get area => 'Area';

  @override
  String get position => 'Position';

  @override
  String get parkingSelectionNote =>
      'By selecting \"Confirm parking slot reservation\", the system will hold this empty slot for you for 15 minutes to perform vehicle operations.';

  @override
  String get confirmParkingSelection => 'Confirm parking slot reservation';

  @override
  String get factoryMapTitle => 'Factory map';

  @override
  String get exportWaitingAreaSubtitle => 'Export waiting area';

  @override
  String get deliveryOrderStatusPreparing => 'PREPARING';

  @override
  String get deliveryOrderStatusReady => 'READY';

  @override
  String get all => 'ALL';

  @override
  String allWithCount(Object count) {
    return 'ALL ($count)';
  }

  @override
  String preparingWithCount(Object count) {
    return 'PREPARING ($count)';
  }

  @override
  String readyWithCount(Object count) {
    return 'READY ($count)';
  }

  @override
  String get unitVehicle => 'VEHICLES';

  @override
  String get unitUnit => 'UNITS';

  @override
  String get deliveryOrderCodeLabel => 'DELIVERY ORDER CODE';

  @override
  String get deliveryOrderVehicleModelLabel => 'VEHICLE MODEL';

  @override
  String get deliveryOrderColorLabel => 'COLOR';

  @override
  String get deliveryOrderQuantityLabel => 'QUANTITY';

  @override
  String get deliveryOrderQuantityUnit => 'UNITS';

  @override
  String locationFormat(Object area, Object position) {
    return 'Area $area - Position $position';
  }

  @override
  String get deliveryOrderDeadlineLabel => 'DEADLINE';

  @override
  String get deliveryOrderCompletionProgressLabel => 'COMPLETION PROGRESS';

  @override
  String deliveryOrderDetailTitle(Object code) {
    return 'DO: $code';
  }

  @override
  String get deliveryOrderPickupGuideTitle => 'PICKUP GUIDE';

  @override
  String fifoBadge(Object number) {
    return 'FIFO #$number';
  }

  @override
  String errorExceedingLength(int max) {
    return 'Giá trị vượt quá độ dài tối đa cho phép ($max ký tự)';
  }

  @override
  String errorSubceedLength(int min) {
    return 'Giá trị ngắn hơn độ dài tối thiểu yêu cầu ($min ký tự)';
  }

  @override
  String get errorEmpty => 'Giá trị không được để trống';

  @override
  String get errorMultiline => 'Giá trị chỉ được phép một dòng';

  @override
  String get errorInvalidEmail => 'Email không đúng định dạng';

  @override
  String get errorNotVinGroupEmail => 'Email phải thuộc domain @vingroup.net';

  @override
  String get errorPasswordNotMatchRequirements =>
      'Mật khẩu không đạt đủ yêu cầu';

  @override
  String get errorInvalidJWT => 'JWT không hợp lệ';

  @override
  String get errorInvalidJWTPayload => 'JWT payload không hợp lệ';

  @override
  String get errorMustOneUpperCaseCharacter =>
      'Mật khẩu phải có ít nhất một ký tự viết hoa';

  @override
  String get errorMustOneLowerCaseCharacter =>
      'Mật khẩu phải có ít nhất một ký tự viết thường';

  @override
  String get errorMustOneNumericCharacter =>
      'Mật khẩu phải có ít nhất một ký tự số';

  @override
  String get errorMustOneSpecialCharacter =>
      'Mật khẩu phải có ít nhất một ký tự đặc biệt';

  @override
  String get errorContainsForbiddenSubstring =>
      'Mật khẩu không được chứa tên người dùng';

  @override
  String get errorMustNotMatchOldPassword =>
      'Mật khẩu mới không được trùng với mật khẩu cũ';

  @override
  String get errorMustMatchNewPassword => 'Mật khẩu nhập lại không khớp';

  @override
  String get errorIsEmpty => 'Giá trị không được để trống';

  @override
  String get errorNumberMustBiggerThanZero => 'Giá trị phải lớn hơn 0';

  @override
  String get errorExceedingMaxValue =>
      'Giá trị vượt quá giới hạn tối đa cho phép';

  @override
  String get errorInvalidDateValue => 'Ngày tháng không hợp lệ';

  @override
  String get errorInvalidDoubleValue => 'Giá trị số thực không hợp lệ';

  @override
  String get errorInvalidIntegerValue => 'Giá trị số nguyên không hợp lệ';

  @override
  String get errorInvalidVin => 'VIN không hợp lệ';

  @override
  String get qrScannerTitle => 'Scan vehicle QR code';

  @override
  String get qrScannerHint => 'Place the QR code inside the frame';

  @override
  String vehicleChargingAgingWarning(int count) {
    return 'There are $count vehicles with a high aging index that need to be processed';
  }

  @override
  String get vehicleChargingFetchError => 'Unable to load vehicle list.';

  @override
  String get vehicleChargingEmptyTitle => 'ALL VEHICLES ARE STABLE';

  @override
  String get vehicleChargingEmptySubtitle =>
      'No vehicles found with Aging index over 30 days requiring charging.';

  @override
  String vehicleChargingPriority(int number) {
    return 'PRIORITY #$number';
  }

  @override
  String get vehicleChargingMaintenaceActionHint =>
      'TAP TO PERFORM MAINTENANCE';

  @override
  String get vehicleChargingMaintenanceRequestTitle =>
      'BATTERY MAINTENANCE REQUEST';

  @override
  String get vehicleChargingCurrentAgingLabel => 'CURRENT AGING:';

  @override
  String get vehicleChargingMoveToChargeAction => 'TAKE VEHICLE TO CHARGE';

  @override
  String get vehicleChargingNoNeedAction => 'NO CHARGE NEEDED';

  @override
  String get vehicleChargingLocationLabel => 'CURRENT LOCATION';

  @override
  String get vehicleChargingTimeInAreaLabel => 'ENTER AREA';

  @override
  String agingDays(Object count) {
    return '$count days';
  }

  @override
  String get back => 'Back';

  @override
  String get dischargingStatusUpdated => 'STATUS UPDATED';

  @override
  String get dischargingVehicleStatus => 'VEHICLE STATUS:';

  @override
  String get dischargingInstruction =>
      'PLEASE BRING THE VEHICLE TO THE CHARGE/DISCHARGE AREA TO CONTINUE THE MAINTENANCE PROCESS.';

  @override
  String get dischargingVinLabel => 'VIN CODE';

  @override
  String get dischargingLocationLabel => 'ORIGINAL LOCATION';

  @override
  String get dischargingTimeLabel => 'TIME';

  @override
  String get dischargingCompleteAction => 'COMPLETE UPDATE';
}
