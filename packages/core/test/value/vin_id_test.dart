import 'package:core/core.dart';
import 'package:core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VinID', () {
    test('hợp lệ khi VIN đúng', () {
      final validVin = '2FZAAZCV14AN14496';
      final vinId = VinID(validVin);

      expect(vinId.isValid(), isTrue);
      expect(vinId.isNotEmpty, isTrue);
      expect(vinId.displayDashIfEmpty, validVin);
    });

    test('không hợp lệ khi độ dài VIN khác 17', () {
      final vinId = VinID('2FZAAZCV14AN1449');
      expect(vinId.isValid(), isFalse);
      expect(vinId.isNotEmpty, isFalse);
    });

    test('không hợp lệ khi checksum VIN sai', () {
      final validVin = '2FZAAZCV14AN14496';
      // thay đổi 1 ký tự để làm sai checksum
      final brokenVin = validVin.replaceRange(
        0,
        1,
        validVin[0] == '1' ? '2' : '1',
      );
      final vinId = VinID(brokenVin);

      expect(vinId.isValid(), isFalse);
    });

    test('không hợp lệ khi VIN chứa ký tự không cho phép (I, O, Q)', () {
      // Đảm bảo chuỗi có 17 ký tự trước khi test
      final vinId = VinID('2FZAQZCV14AN496');
      expect(vinId.isValid(), isFalse);
    });

    test('xử lý input không hợp lệ một cách an toàn qua accessor', () {
      final vinId = VinID('');
      expect(vinId.isValid(), isFalse);
      expect(vinId.isNotEmpty, isFalse);
      expect(vinId.displayDashIfEmpty, '-');
    });
  });
}
