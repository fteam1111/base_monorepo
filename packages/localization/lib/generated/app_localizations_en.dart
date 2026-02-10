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
  String get enterVinToViewHistory => 'Enter VIN to view history';

  @override
  String get map => 'Map';

  @override
  String get doList => 'DO list';

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
}
