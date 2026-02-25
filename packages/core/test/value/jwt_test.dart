import 'dart:convert';
import 'package:core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JWT', () {
    String createMockToken(Map<String, dynamic> payload) {
      final header = base64UrlEncode(utf8.encode('{"alg":"HS256"}'));
      final body = base64UrlEncode(utf8.encode(jsonEncode(payload)));
      return '$header.$body.signature';
    }

    test('should be valid when token format is correct', () {
      final nowSeconds = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      // valid token with expiry 1 hour in the future, issued 1 hour ago
      final tokenString = createMockToken({
        'id': 'user-1234',
        'exp': nowSeconds + 3600,
        'iat': nowSeconds - 3600,
      });

      final jwt = JWT(tokenString);

      expect(jwt.isValid(), isTrue);
      expect(jwt.userId, 'user-1234');
      expect(jwt.isExpired, isFalse);
    });

    test('should be marked as expired if exp is in the past', () {
      final nowSeconds = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      final tokenString = createMockToken({
        'id': 'user-1234',
        'exp': nowSeconds - 3600,
        'iat': nowSeconds - 7200,
      });

      final jwt = JWT(tokenString);

      expect(jwt.isValid(), isTrue);
      expect(jwt.isExpired, isTrue);
    });

    test('should be invalid when token is malformed', () {
      final jwt = JWT('invalid.token.structure.extra');
      expect(jwt.isValid(), isFalse);

      final jwt2 = JWT('invalid_random_string');
      expect(jwt2.isValid(), isFalse);
    });

    test('should get safe default properties when invalid', () {
      final jwt = JWT('');
      expect(jwt.isValid(), isFalse);
      expect(jwt.userId, '');
      expect(jwt.isExpired, isTrue);
    });
  });
}
