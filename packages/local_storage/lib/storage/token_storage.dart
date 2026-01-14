import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Interface cho token storage để quản lý authentication tokens
/// Implement interface này với storage solution bạn muốn
/// (SharedPreferences, FlutterSecureStorage, Hive, etc.)
abstract class TokenStorage {
  /// Lưu access token
  Future<void> saveAccessToken(String token);

  /// Lưu refresh token
  Future<void> saveRefreshToken(String token);

  /// Lấy access token
  Future<String?> getAccessToken();

  /// Lấy refresh token
  Future<String?> getRefreshToken();

  /// Xóa tất cả tokens
  Future<void> clearTokens();

  /// Kiểm tra xem user đã authenticated chưa (có token hợp lệ)
  Future<bool> isAuthenticated();

  /// Factory constructor - sử dụng SecureTokenStorage trong production
  factory TokenStorage() => SecureTokenStorage();
}

/// Secure token storage sẵn sàng cho production sử dụng FlutterSecureStorage
/// Mã hóa tokens trên thiết bị để đảm bảo bảo mật tối đa
class SecureTokenStorage implements TokenStorage {
  static final SecureTokenStorage _instance = SecureTokenStorage._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  factory SecureTokenStorage() => _instance;

  SecureTokenStorage._internal();

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  @override
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}

/// Token storage dựa trên memory cho testing/development
/// CẢNH BÁO: Tokens sẽ bị mất khi app restart
class MemoryTokenStorage implements TokenStorage {
  String? _accessToken;
  String? _refreshToken;

  @override
  Future<void> saveAccessToken(String token) async {
    _accessToken = token;
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    _refreshToken = token;
  }

  @override
  Future<String?> getAccessToken() async {
    return _accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    return _refreshToken;
  }

  @override
  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _accessToken != null && _accessToken!.isNotEmpty;
  }
}
