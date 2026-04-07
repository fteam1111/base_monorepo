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
  String get vehicleChargingInfoTitle => 'Thông tin sạc xả';

  @override
  String get vehicleChargingInfoSubtitle => 'Chi tiết phương tiện';

  @override
  String get vehicleChargingInfoStatusLabel => 'Trạng thái';

  @override
  String get vehicleChargingInfoSubAreaLabel => 'Khu vực con';

  @override
  String get vehicleChargingInfoCheckAgingDateLabel => 'Ngày check aging';

  @override
  String get vehicleChargingCloseInfo => 'Đóng thông tin';

  @override
  String get enterVinToViewHistory => 'Nhập mã VIN để xem lịch sử thao tác';

  @override
  String get map => 'Bản đồ';

  @override
  String get doList => 'Danh sách DO';

  @override
  String get deliveryOrderListTitle => 'Danh sách DO';

  @override
  String get deliveryOrderBatchTitle => 'Lệnh giao hàng theo đợt';

  @override
  String get customer => 'Khách hàng';

  @override
  String get progress => 'Tiến độ';

  @override
  String get filterList => 'Bộ lọc danh sách';

  @override
  String get findVinCode => 'Tìm theo mã VIN...';

  @override
  String get allModels => 'Tất cả model';

  @override
  String get allColors => 'Tất cả màu';

  @override
  String get pickUpGuide => 'Hướng dẫn lấy xe';

  @override
  String results(Object count) {
    return '$count Kết quả';
  }

  @override
  String resultsCount(Object count) {
    return '$count Kết quả';
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
  String get confirmParking => 'Xác nhận đỗ xe';

  @override
  String get selectPositionToFinish => 'Chọn vị trí và hoàn tất đỗ xe này';

  @override
  String get moveToChargingArea => 'Chuyển sang khu sạc xả';

  @override
  String get confirmChargingTransfer => 'Chuyển xe sang khu vực sạc xả';

  @override
  String get enterReasonToMoveQc => 'Nhập lý do chuyển xe sang khu QC';

  @override
  String get reasonToMoveRequired => 'Lý do di chuyển (bắt buộc)';

  @override
  String get enterMoveReason => 'Nhập lý do chuyển xe...';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get confirmTransferToCharging =>
      'Bạn có chắc chắn muốn chuyển xe này sang khu sạc xả không?';

  @override
  String get transferToChargingTitle => 'Chuyển sang khu sạc xả';

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
  String get deliveryOrderStatusPending => 'Chờ xử lý';

  @override
  String get deliveryOrderStatusPreparing => 'Đang chuẩn bị';

  @override
  String get deliveryOrderStatusReady => 'Sẵn sàng';

  @override
  String get all => 'All';

  @override
  String allWithCount(Object count) {
    return 'Tất cả ($count)';
  }

  @override
  String preparingWithCount(Object count) {
    return 'Đang chuẩn bị ($count)';
  }

  @override
  String readyWithCount(Object count) {
    return 'Sẵn sàng ($count)';
  }

  @override
  String get unitVehicle => 'Vehicles';

  @override
  String get unitUnit => 'Units';

  @override
  String get deliveryOrderCodeLabel => 'Mã lệnh giao hàng';

  @override
  String get deliveryOrderVehicleModelLabel => 'Model xe';

  @override
  String get deliveryOrderColorLabel => 'Màu sắc';

  @override
  String get deliveryOrderQuantityLabel => 'Số lượng';

  @override
  String get deliveryOrderQuantityUnit => 'Chiếc';

  @override
  String locationFormat(Object area, Object position) {
    return '$area - $position';
  }

  @override
  String get deliveryOrderDeadlineLabel => 'Deadline';

  @override
  String get deliveryOrderCompletionProgressLabel => 'Tiến độ hoàn thành';

  @override
  String deliveryOrderDetailTitle(Object code) {
    return 'DO: $code';
  }

  @override
  String get deliveryOrderPickupGuideTitle => 'Hướng dẫn lấy xe';

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
  String get vehicleChargingEmptyTitle => 'Tất cả xe đều ổn định';

  @override
  String get vehicleChargingEmptySubtitle =>
      'Không tìm thấy xe nào có số ngày trên 30 ngày cần sạc xả.';

  @override
  String vehicleChargingPriority(int number) {
    return 'Ưu tiên #$number';
  }

  @override
  String get vehicleChargingMaintenaceActionHint =>
      'Nhấn để thao tác bảo dưỡng';

  @override
  String get vehicleChargingMaintenanceRequestTitle => 'Yêu cầu bảo dưỡng pin';

  @override
  String get vehicleChargingCurrentAgingLabel => 'Số ngày hiện tại:';

  @override
  String get vehicleChargingMoveToChargeAction => 'Mang xe đi sạc';

  @override
  String get vehicleChargingNoNeedAction => 'Không cần mang xe';

  @override
  String get vehicleChargingLocationLabel => 'Vị trí hiện tại';

  @override
  String get vehicleChargingTimeInAreaLabel => 'Vào khu tp';

  @override
  String agingDays(Object count) {
    return '$count ngày';
  }

  @override
  String get back => 'Quay lại';

  @override
  String get dischargingStatusUpdated => 'Đã cập nhật trạng thái';

  @override
  String get dischargingVehicleStatus => 'Trạng thái xe:';

  @override
  String get dischargingInstruction =>
      'Vui lòng mang xe đến khu vực sạc xả để tiếp tục quy trình bảo dưỡng.';

  @override
  String get dischargingVinLabel => 'Mã vin';

  @override
  String get dischargingLocationLabel => 'Vị trí ban đầu';

  @override
  String get dischargingTimeLabel => 'Thời gian';

  @override
  String get dischargingCompleteAction => 'Hoàn thành cập nhật';

  @override
  String get deliveryOrderSuggestedVehiclesTab => 'Hướng dẫn lấy xe';

  @override
  String get deliveryOrderAssignedVehiclesTab => 'Danh sách xe trong DO';

  @override
  String get noData => 'Không có dữ liệu';

  @override
  String get vehicleAddedSuccess => 'Thêm xe thành công';

  @override
  String get vehicleAddFailed => 'Thêm xe thất bại';

  @override
  String get scanConfirmTitle => 'Xác nhận chọn xe';

  @override
  String scanConfirmMessage(String vin, String zone) {
    return 'Xác nhận lấy xe $vin tại $zone?';
  }

  @override
  String get scanConfirmAction => 'Xác nhận & quét mã';

  @override
  String get scanMatchTitle => 'Xác nhận đưa xe vào DO';

  @override
  String scanMatchMessage(String vin, String doCode) {
    return 'Xe $vin trùng khớp với xe đã chọn. Bạn có muốn đưa xe này vào DO $doCode không?';
  }

  @override
  String get scanMatchAction => 'Xác nhận';

  @override
  String get scanCompatibleTitle => 'Phát hiện xe khác';

  @override
  String scanCompatibleMessage(String vin, String doCode) {
    return 'Bạn vừa scan xe $vin, không trùng với xe đã chọn. Tuy nhiên xe này phù hợp với DO $doCode.';
  }

  @override
  String get scanCompatibleAction => 'Đồng ý - đưa xe vào DO';

  @override
  String get scanIncompatibleTitle => 'Xe không phù hợp DO';

  @override
  String scanIncompatibleMessage(String vin, String doCode) {
    return 'Bạn vừa scan xe $vin. Xe này không phù hợp (sai model/màu) với DO $doCode.';
  }

  @override
  String get scanBackToList => 'Ok - quay lại danh sách';

  @override
  String get cancelBackToList => 'Hủy - quay lại danh sách';

  @override
  String get cancelAction => 'Hủy bỏ';

  @override
  String exportAreaDoTitle(String areaName) {
    return 'DO trong $areaName';
  }

  @override
  String get exportAreaDoSubtitle => 'Danh sách lệnh giao hàng';

  @override
  String get exportAreaDoEmpty => 'Không có đơn xuất hàng nào';

  @override
  String get exportAreaConfirmTitle => 'Xác nhận đỗ xe vào DO';

  @override
  String exportAreaConfirmMessage(String doCode) {
    return 'Bạn có chắc chắn muốn đỗ xe vào DO $doCode hay không?';
  }

  @override
  String get exportAreaDeliveryOrderLabel => 'Lệnh giao hàng';

  @override
  String get exportAreaConfirmAction => 'Xác nhận đỗ xe';

  @override
  String get exportAreaStatusFull => 'Đã đủ xe';

  @override
  String get exportAreaStatusWaiting => 'Chờ xuất';

  @override
  String exportAreaVehicleCount(int count) {
    return 'Số lượng xe: $count xe';
  }

  @override
  String get exportAreaSelectAction => 'Chọn đỗ';

  @override
  String get parkingHistoryScanPrompt => 'Vui lòng quét QR để tra cứu xe';

  @override
  String get parkingHistoryErrorLoading => 'Lỗi lấy dữ liệu lịch sử';

  @override
  String get parkingHistoryEmpty => 'Không có dữ liệu lịch sử.';

  @override
  String get parkingHistoryPerformedBy => 'Người thực hiện';

  @override
  String get parkingHistoryTime => 'Thời gian';

  @override
  String get parkingHistoryDoCode => 'Mã DO';

  @override
  String get parkingHistoryNotes => 'Ghi chú';

  @override
  String parkingHistoryStatus(String status) {
    return 'Trạng thái: $status';
  }

  @override
  String get parkingHistoryImport => 'Nhập kho';

  @override
  String get parkingHistoryMoveToCharge => 'Chuyển sang khu sạc xả';

  @override
  String get parkingHistoryMoveToQc => 'Chuyển sang khu QC';

  @override
  String get parkingHistoryAssignToDo => 'Gắn vào DO';

  @override
  String get parkingHistoryFactory => 'Xưởng';

  @override
  String get parkingHistoryArea => 'Khu vực';

  @override
  String get parkingHistoryPosition => 'Vị trí';

  @override
  String get parkingHistoryEmployee => 'Nhân viên';

  @override
  String get parkingHistoryAccount => 'Tài khoản';

  @override
  String get parkingHistoryStorageDays => 'Số ngày đã đỗ';
}
