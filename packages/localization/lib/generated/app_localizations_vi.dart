// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get welcome => 'Chào mừng';

  @override
  String get login => 'Đăng nhập';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mật khẩu';

  @override
  String get enterEmail => 'Nhập email của bạn';

  @override
  String get home => 'Trang chủ';

  @override
  String get settings => 'Cài đặt';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get loading => 'Đang tải...';

  @override
  String get error => 'Lỗi';

  @override
  String get retry => 'Thử lại';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get next => 'Tiếp theo';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get parkingHistoryTitle => 'Lịch sử';

  @override
  String get enterVinToViewHistory => 'Nhập mã VIN để xem lịch sử thao tác';

  @override
  String get map => 'Bản đồ';

  @override
  String get doList => 'Danh sách DO';

  @override
  String get deliveryOrderListTitle => 'Danh sách DO';

  @override
  String get deliveryOrderBatchTitle => 'LỆNH GIAO HÀNG THEO ĐỢT';

  @override
  String get charging => 'Sạc xe';

  @override
  String get vehicleDetailTitle => 'Chi tiết phương tiện';

  @override
  String get vinIdentifier => 'MÃ ĐỊNH DANH VIN';

  @override
  String get vehicleModel => 'DÒNG XE';

  @override
  String get vehicleColor => 'MÀU SẮC';

  @override
  String get batteryCapacity => 'DUNG LƯỢNG PIN';

  @override
  String get aging => 'AGING';

  @override
  String get currentLocation => 'VỊ TRÍ HIỆN TẠI';

  @override
  String get availableActions => 'THAO TÁC KHẢ DỤNG';

  @override
  String get moveToExportArea => 'DI CHUYỂN SANG KHU CHỜ XUẤT';

  @override
  String get prepareForDelivery => 'CHUẨN BỊ BÀN GIAO VẬN CHUYỂN';

  @override
  String get moveToQCArea => 'DI CHUYỂN SANG KHU QC';

  @override
  String get recheckQuality => 'KIỂM TRA CHẤT LƯỢNG LẠI';

  @override
  String get chooseParkingLocation => 'CHỌN VỊ TRÍ ĐỖ';

  @override
  String get businessAreaClassification => 'PHÂN LOẠI KHU VỰC NGHIỆP VỤ';

  @override
  String get finishedProduct => 'THÀNH PHẨM';

  @override
  String get chargingDischarging => 'SẠC XẢ';

  @override
  String get exportWaiting => 'CHỜ XUẤT';

  @override
  String get qcArea => 'KHU QC';

  @override
  String get chargingStatus => 'ĐANG SẠC';

  @override
  String get entryTime => 'THỜI GIAN VÀO KHU';

  @override
  String get remainingSlots => 'CÒN CHỖ';

  @override
  String get capacity => 'SỨC CHỨA';

  @override
  String deliveryOrders(Object count) {
    return '$count LỆNH GIAO HÀNG (DO)';
  }
}
