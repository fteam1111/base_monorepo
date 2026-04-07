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
  String get vehicleChargingInfoTitle => 'Charging info';

  @override
  String get vehicleChargingInfoSubtitle => 'Vehicle details';

  @override
  String get vehicleChargingInfoStatusLabel => 'Status';

  @override
  String get vehicleChargingInfoSubAreaLabel => 'Sub area';

  @override
  String get vehicleChargingInfoCheckAgingDateLabel => 'Check aging date';

  @override
  String get vehicleChargingCloseInfo => 'Close info';

  @override
  String get enterVinToViewHistory => 'Enter VIN to view history';

  @override
  String get map => 'Map';

  @override
  String get doList => 'DO list';

  @override
  String get deliveryOrderListTitle => 'DO List';

  @override
  String get deliveryOrderBatchTitle => 'Batch delivery orders';

  @override
  String get customer => 'Customer';

  @override
  String get progress => 'Progress';

  @override
  String get filterList => 'List filter';

  @override
  String get findVinCode => 'Search VIN...';

  @override
  String get allModels => 'All models';

  @override
  String get allColors => 'All colors';

  @override
  String get pickUpGuide => 'Pickup guide';

  @override
  String results(Object count) {
    return '$count Results';
  }

  @override
  String resultsCount(Object count) {
    return '$count Results';
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
  String get confirmParking => 'Confirm parking';

  @override
  String get selectPositionToFinish => 'Select position and complete parking';

  @override
  String get moveToChargingArea => 'Move to charging area';

  @override
  String get confirmChargingTransfer => 'Transfer vehicle to charging area';

  @override
  String get enterReasonToMoveQc => 'Enter reason to move vehicle to QC';

  @override
  String get reasonToMoveRequired => 'Reason to move (required)';

  @override
  String get enterMoveReason => 'Enter reason to move...';

  @override
  String get confirm => 'Confirm';

  @override
  String get confirmTransferToCharging =>
      'Are you sure you want to transfer this vehicle to the charging area?';

  @override
  String get transferToChargingTitle => 'Transfer to charging area';

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
  String get deliveryOrderStatusPending => 'Pending';

  @override
  String get deliveryOrderStatusPreparing => 'Preparing';

  @override
  String get deliveryOrderStatusReady => 'Ready';

  @override
  String get all => 'All';

  @override
  String allWithCount(Object count) {
    return 'All ($count)';
  }

  @override
  String preparingWithCount(Object count) {
    return 'Preparing ($count)';
  }

  @override
  String readyWithCount(Object count) {
    return 'Ready ($count)';
  }

  @override
  String get unitVehicle => 'Vehicles';

  @override
  String get unitUnit => 'Units';

  @override
  String get deliveryOrderCodeLabel => 'Delivery order code';

  @override
  String get deliveryOrderVehicleModelLabel => 'Vehicle model';

  @override
  String get deliveryOrderColorLabel => 'Color';

  @override
  String get deliveryOrderQuantityLabel => 'Quantity';

  @override
  String get deliveryOrderQuantityUnit => 'Units';

  @override
  String locationFormat(Object area, Object position) {
    return '$area - $position';
  }

  @override
  String get deliveryOrderDeadlineLabel => 'Deadline';

  @override
  String get deliveryOrderCompletionProgressLabel => 'Completion progress';

  @override
  String deliveryOrderDetailTitle(Object code) {
    return 'DO: $code';
  }

  @override
  String get deliveryOrderPickupGuideTitle => 'Pickup guide';

  @override
  String fifoBadge(Object number) {
    return 'Fifo #$number';
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
  String get vehicleChargingEmptyTitle => 'All vehicles are stable';

  @override
  String get vehicleChargingEmptySubtitle =>
      'No vehicles found with Aging index over 30 days requiring charging.';

  @override
  String vehicleChargingPriority(int number) {
    return 'Priority #$number';
  }

  @override
  String get vehicleChargingMaintenaceActionHint =>
      'Tap to perform maintenance';

  @override
  String get vehicleChargingMaintenanceRequestTitle =>
      'Battery maintenance request';

  @override
  String get vehicleChargingCurrentAgingLabel => 'Current aging:';

  @override
  String get vehicleChargingMoveToChargeAction => 'Take vehicle to charge';

  @override
  String get vehicleChargingNoNeedAction => 'No charge needed';

  @override
  String get vehicleChargingLocationLabel => 'Current location';

  @override
  String get vehicleChargingTimeInAreaLabel => 'Enter area';

  @override
  String agingDays(Object count) {
    return '$count days';
  }

  @override
  String get back => 'Back';

  @override
  String get dischargingStatusUpdated => 'Status updated';

  @override
  String get dischargingVehicleStatus => 'Vehicle status:';

  @override
  String get dischargingInstruction =>
      'Please bring the vehicle to the charge/discharge area to continue the maintenance process.';

  @override
  String get dischargingVinLabel => 'Vin code';

  @override
  String get dischargingLocationLabel => 'Original location';

  @override
  String get dischargingTimeLabel => 'Time';

  @override
  String get dischargingCompleteAction => 'Complete update';

  @override
  String get deliveryOrderSuggestedVehiclesTab => 'Pickup guide';

  @override
  String get deliveryOrderAssignedVehiclesTab => 'Vehicles in DO';

  @override
  String get noData => 'No data available';

  @override
  String get vehicleAddedSuccess => 'Vehicle added successfully';

  @override
  String get vehicleAddFailed => 'Failed to add vehicle';

  @override
  String get scanConfirmTitle => 'Confirm vehicle';

  @override
  String scanConfirmMessage(String vin, String zone) {
    return 'Confirm pickup vehicle $vin at $zone?';
  }

  @override
  String get scanConfirmAction => 'Confirm & scan';

  @override
  String get scanMatchTitle => 'Confirm add to DO';

  @override
  String scanMatchMessage(String vin, String doCode) {
    return 'Vehicle $vin matches the selected vehicle. Add to DO $doCode?';
  }

  @override
  String get scanMatchAction => 'Confirm';

  @override
  String get scanCompatibleTitle => 'Different vehicle';

  @override
  String scanCompatibleMessage(String vin, String doCode) {
    return 'Scanned vehicle $vin differs from selected but is compatible with DO $doCode.';
  }

  @override
  String get scanCompatibleAction => 'Agree - add to DO';

  @override
  String get scanIncompatibleTitle => 'Not compatible';

  @override
  String scanIncompatibleMessage(String vin, String doCode) {
    return 'Scanned vehicle $vin is not compatible (wrong model/color) with DO $doCode.';
  }

  @override
  String get scanBackToList => 'Ok - back to list';

  @override
  String get cancelBackToList => 'Cancel - back to list';

  @override
  String get cancelAction => 'Cancel';

  @override
  String exportAreaDoTitle(String areaName) {
    return 'DO in $areaName';
  }

  @override
  String get exportAreaDoSubtitle => 'Delivery order list';

  @override
  String get exportAreaDoEmpty => 'No export orders found';

  @override
  String get exportAreaConfirmTitle => 'Confirm parking vehicle to DO';

  @override
  String exportAreaConfirmMessage(String doCode) {
    return 'Are you sure you want to park vehicle into DO $doCode?';
  }

  @override
  String get exportAreaDeliveryOrderLabel => 'Delivery order';

  @override
  String get exportAreaConfirmAction => 'Confirm parking';

  @override
  String get exportAreaStatusFull => 'Full';

  @override
  String get exportAreaStatusWaiting => 'Waiting';

  @override
  String get exportAreaVehicleCountLabel => 'Total vehicles: ';

  @override
  String exportAreaVehicleCount(int count) {
    return '$count vehicles';
  }

  @override
  String get exportAreaSelectAction => 'Select';

  @override
  String get parkingHistoryScanPrompt => 'Please scan QR to view history';

  @override
  String get parkingHistoryErrorLoading => 'Error loading history data';

  @override
  String get parkingHistoryEmpty => 'No history data found.';

  @override
  String get parkingHistoryPerformedBy => 'Performed by';

  @override
  String get parkingHistoryTime => 'Time';

  @override
  String get parkingHistoryDoCode => 'DO Code';

  @override
  String get parkingHistoryNotes => 'Notes';

  @override
  String parkingHistoryStatus(String status) {
    return 'Status: $status';
  }

  @override
  String get parkingHistoryImport => 'Import';

  @override
  String get parkingHistoryMoveToCharge => 'Move to charge';

  @override
  String get parkingHistoryMoveToQc => 'Move to QC';

  @override
  String get parkingHistoryAssignToDo => 'Assign DO';

  @override
  String get parkingHistoryFactory => 'Factory';

  @override
  String get parkingHistoryArea => 'Area';

  @override
  String get parkingHistoryPosition => 'Position';

  @override
  String get parkingHistoryEmployee => 'Employee';

  @override
  String get parkingHistoryAccount => 'Account';

  @override
  String get parkingHistoryStorageDays => 'Days Parked';
}
