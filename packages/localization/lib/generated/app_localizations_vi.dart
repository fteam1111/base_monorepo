// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Ứng dụng Clean Architecture';

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
  String get enterPassword => 'Nhập mật khẩu của bạn';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get dontHaveAccount => 'Chưa có tài khoản?';

  @override
  String get signUp => 'Đăng ký';

  @override
  String get home => 'Trang chủ';

  @override
  String get settings => 'Cài đặt';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get theme => 'Giao diện';

  @override
  String get lightMode => 'Chế độ sáng';

  @override
  String get darkMode => 'Chế độ tối';

  @override
  String get systemDefault => 'Theo hệ thống';

  @override
  String get authenticated => 'Đã đăng nhập';

  @override
  String get notAuthenticated => 'Chưa đăng nhập';

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
  String get onboardingTitle1 => 'Chào mừng đến với Clean Architecture';

  @override
  String get onboardingDesc1 =>
      'Xây dựng ứng dụng Flutter có thể mở rộng và dễ bảo trì với kiến trúc chuẩn và tách biệt rõ ràng các lớp.';

  @override
  String get onboardingTitle2 => 'Cấu trúc package theo module';

  @override
  String get onboardingDesc2 =>
      'Mỗi tính năng được tách riêng trong package với đầy đủ domain, data và presentation, sử dụng Melos.';

  @override
  String get onboardingTitle3 => 'Quản lý state với BLoC';

  @override
  String get onboardingDesc3 =>
      'Quản lý state một cách phản ứng với pattern BLoC, đảm bảo code dễ đoán và dễ test.';

  @override
  String get onboardingTitle4 => 'Tầng network vững chắc';

  @override
  String get onboardingDesc4 =>
      'Tích hợp sẵn xử lý lỗi, retry, refresh token và interceptor cho việc gọi API mượt mà.';

  @override
  String get parkingHistoryTitle => 'Lịch sử';

  @override
  String get enterVinToViewHistory => 'Nhập mã VIN để xem lịch sử thao tác';
}
