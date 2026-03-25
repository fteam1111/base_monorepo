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
  String get vehicleChargingAreaTitle => 'Xe cần bảo dưỡng sạc';

  @override
  String get vehicleChargingAreaSubtitle => 'Danh sách xe Aging > 30 ngày';

  @override
  String get vehicleChargingSearchHint => 'Tìm theo mã VIN...';

  @override
  String get vehicleChargingInfoTitle => 'THÔNG TIN SẠC XẢ';

  @override
  String get vehicleChargingInfoSubtitle => 'CHI TIẾT PHƯƠNG TIỆN';

  @override
  String get vehicleChargingInfoStatusLabel => 'TRẠNG THÁI';

  @override
  String get vehicleChargingInfoSubAreaLabel => 'KHU VỰC CON';

  @override
  String get vehicleChargingInfoCheckAgingDateLabel => 'NGÀY CHECK AGING';

  @override
  String get vehicleChargingCloseInfo => 'ĐÓNG THÔNG TIN';

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
  String get customer => 'KHÁCH HÀNG';

  @override
  String get progress => 'TIẾN ĐỘ';

  @override
  String get filterList => 'BỘ LỌC DANH SÁCH';

  @override
  String get findVinCode => 'Tìm theo mã VIN...';

  @override
  String get allModels => 'TẤT CẢ MODEL';

  @override
  String get allColors => 'TẤT CẢ MÀU';

  @override
  String get pickUpGuide => 'HƯỚNG DẪN LẤY XE';

  @override
  String results(Object count) {
    return '$count KẾT QUẢ';
  }

  @override
  String resultsCount(Object count) {
    return '$count KẾT QUẢ';
  }

  @override
  String warehouse(Object date) {
    return 'Nhập kho: $date';
  }

  @override
  String get charging => 'Sạc xe';

  @override
  String get vehicleDetailTitle => 'Chi tiết phương tiện';

  @override
  String get vinIdentifier => 'Mã định danh VIN';

  @override
  String get vehicleModel => 'Dòng xe';

  @override
  String get vehicleColor => 'Màu sắc';

  @override
  String get batteryCapacity => 'Dung lượng pin';

  @override
  String get aging => 'Ngày';

  @override
  String get currentLocation => 'Vị trí hiện tại';

  @override
  String get availableActions => 'Thao tác khả dụng';

  @override
  String get moveToExportArea => 'Di chuyển sang khu chờ xuất';

  @override
  String get prepareForDelivery => 'Chuẩn bị bàn giao vận chuyển';

  @override
  String get moveToQCArea => 'Di chuyển sang khu QC';

  @override
  String get recheckQuality => 'Kiểm tra chất lượng lại';

  @override
  String get chooseParkingLocation => 'Chọn vị trí đỗ';

  @override
  String get businessAreaClassification => 'Phân loại khu vực nghiệp vụ';

  @override
  String get finishedProduct => 'Thành phẩm';

  @override
  String get chargingDischarging => 'Sạc xả';

  @override
  String get exportWaiting => 'Chờ xuất';

  @override
  String get qcArea => 'Khu QC';

  @override
  String get chargingStatus => 'Đang sạc';

  @override
  String get entryTime => 'Thời gian vào khu';

  @override
  String get remainingSlots => 'Còn chỗ';

  @override
  String get capacity => 'Sức chứa';

  @override
  String deliveryOrders(Object count) {
    return '$count lệnh giao hàng (DO)';
  }

  @override
  String get youSelectedParkingSlot => 'Bạn đã chọn ô đỗ';

  @override
  String get factory => 'Xưởng';

  @override
  String get area => 'Khu vực';

  @override
  String get position => 'Vị trí';

  @override
  String get parkingSelectionNote =>
      'Bằng việc chọn \"Xác nhận giữ ô đỗ xe\", hệ thống sẽ giữ ô trống này cho bạn trong 15 phút để bạn thực hiện thao tác với xe.';

  @override
  String get confirmParkingSelection => 'Xác nhận giữ ô đỗ xe';

  @override
  String get factoryMapTitle => 'Sơ đồ nhà máy';

  @override
  String get exportWaitingAreaSubtitle => 'Khu chờ xuất';

  @override
  String get deliveryOrderStatusPreparing => 'ĐANG CHUẨN BỊ';

  @override
  String get deliveryOrderStatusReady => 'SẴN SÀNG';

  @override
  String get all => 'ALL';

  @override
  String allWithCount(Object count) {
    return 'TẤT CẢ ($count)';
  }

  @override
  String preparingWithCount(Object count) {
    return 'ĐANG CHUẨN BỊ ($count)';
  }

  @override
  String readyWithCount(Object count) {
    return 'SẴN SÀNG ($count)';
  }

  @override
  String get unitVehicle => 'VEHICLES';

  @override
  String get unitUnit => 'UNITS';

  @override
  String get deliveryOrderCodeLabel => 'MÃ LỆNH GIAO HÀNG';

  @override
  String get deliveryOrderVehicleModelLabel => 'MODEL XE';

  @override
  String get deliveryOrderColorLabel => 'MÀU SẮC';

  @override
  String get deliveryOrderQuantityLabel => 'SỐ LƯỢNG';

  @override
  String get deliveryOrderQuantityUnit => 'CHIẾC';

  @override
  String locationFormat(Object area, Object position) {
    return 'Khu $area - Vị trí $position';
  }

  @override
  String get deliveryOrderDeadlineLabel => 'DEADLINE';

  @override
  String get deliveryOrderCompletionProgressLabel => 'TIẾN ĐỘ HOÀN THÀNH';

  @override
  String deliveryOrderDetailTitle(Object code) {
    return 'DO: $code';
  }

  @override
  String get deliveryOrderPickupGuideTitle => 'HƯỚNG DẪN LẤY XE';

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
  String get qrScannerTitle => 'Quét mã QR xe';

  @override
  String get qrScannerHint => 'Đưa mã QR vào khung quét';

  @override
  String vehicleChargingAgingWarning(int count) {
    return 'Cần xử lý $count phương tiện có chỉ số aging cao';
  }

  @override
  String get vehicleChargingFetchError => 'Không thể tải danh sách xe.';

  @override
  String get vehicleChargingEmptyTitle => 'TẤT CẢ XE ĐỀU ỔN ĐỊNH';

  @override
  String get vehicleChargingEmptySubtitle =>
      'Không tìm thấy xe nào có số ngày trên 30 ngày cần sạc xả.';

  @override
  String vehicleChargingPriority(int number) {
    return 'ƯU TIÊN #$number';
  }

  @override
  String get vehicleChargingMaintenaceActionHint =>
      'NHẤN ĐỂ THAO TÁC BẢO DƯỠNG';

  @override
  String get vehicleChargingMaintenanceRequestTitle => 'YÊU CẦU BẢO DƯỠNG PIN';

  @override
  String get vehicleChargingCurrentAgingLabel => 'SỐ NGÀY HIỆN TẠI:';

  @override
  String get vehicleChargingMoveToChargeAction => 'MANG XE ĐI SẠC';

  @override
  String get vehicleChargingNoNeedAction => 'KHÔNG CẦN MANG XE';

  @override
  String get vehicleChargingLocationLabel => 'VỊ TRÍ HIỆN TẠI';

  @override
  String get vehicleChargingTimeInAreaLabel => 'VÀO KHU TP';

  @override
  String agingDays(Object count) {
    return '$count ngày';
  }

  @override
  String get back => 'Quay lại';

  @override
  String get dischargingStatusUpdated => 'ĐÃ CẬP NHẬT TRẠNG THÁI';

  @override
  String get dischargingVehicleStatus => 'TRẠNG THÁI XE:';

  @override
  String get dischargingInstruction =>
      'VUI LÒNG MANG XE ĐẾN KHU VỰC SẠC XẢ ĐỂ TIẾP TỤC QUY TRÌNH BẢO DƯỠNG.';

  @override
  String get dischargingVinLabel => 'MÃ VIN';

  @override
  String get dischargingLocationLabel => 'VỊ TRÍ BAN ĐẦU';

  @override
  String get dischargingTimeLabel => 'THỜI GIAN';

  @override
  String get dischargingCompleteAction => 'HOÀN THÀNH CẬP NHẬT';
}
