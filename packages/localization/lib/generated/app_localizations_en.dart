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
  String get getStarted => 'Get Started';

  @override
  String get parkingHistoryTitle => 'History';

  @override
  String get enterVinToViewHistory => 'Enter VIN to view history';

  @override
  String get map => 'Map';

  @override
  String get doList => 'DO List';

  @override
  String get deliveryOrderListTitle => 'DO List';

  @override
  String get deliveryOrderBatchTitle => 'BATCH DELIVERY ORDERS';

  @override
  String get charging => 'Charging';

  @override
  String get vehicleDetailTitle => 'Vehicle Details';

  @override
  String get vinIdentifier => 'VIN IDENTIFIER';

  @override
  String get vehicleModel => 'VEHICLE MODEL';

  @override
  String get vehicleColor => 'COLOR';

  @override
  String get batteryCapacity => 'BATTERY CAPACITY';

  @override
  String get aging => 'AGING';

  @override
  String get currentLocation => 'CURRENT LOCATION';

  @override
  String get availableActions => 'AVAILABLE ACTIONS';

  @override
  String get moveToExportArea => 'MOVE TO EXPORT WAITING AREA';

  @override
  String get prepareForDelivery => 'PREPARE FOR DELIVERY TRANSPORT';

  @override
  String get moveToQCArea => 'MOVE TO QC AREA';

  @override
  String get recheckQuality => 'RECHECK QUALITY';

  @override
  String get chooseParkingLocation => 'CHOOSE PARKING LOCATION';

  @override
  String get businessAreaClassification => 'BUSINESS AREA CLASSIFICATION';

  @override
  String get finishedProduct => 'FINISHED PRODUCT';

  @override
  String get chargingDischarging => 'CHARGING/DISCHARGING';

  @override
  String get exportWaiting => 'EXPORT WAITING';

  @override
  String get qcArea => 'QC AREA';

  @override
  String get chargingStatus => 'CHARGING';

  @override
  String get entryTime => 'ENTRY TIME';

  @override
  String get remainingSlots => 'REMAINING SLOTS';

  @override
  String get capacity => 'CAPACITY';

  @override
  String deliveryOrders(Object count) {
    return '$count DELIVERY ORDERS (DO)';
  }
}
