import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchKey', () {
    test('should be valid when empty via empty() constructor', () {
      final searchKey = SearchKey.empty();
      expect(searchKey.isValid(), isTrue);
      expect(searchKey.searchValueOrEmpty, '');
      expect(searchKey.isValueEmpty, isTrue);
      expect(searchKey.countWhenValid, 0);
    });

    test('should be valid when empty via search() constructor', () {
      final searchKey = SearchKey.search('');
      expect(searchKey.isValid(), isTrue);
      expect(searchKey.searchValueOrEmpty, '');
    });

    test('should be invalid when search text length is less than 2', () {
      final searchKey = SearchKey.search('a');
      expect(searchKey.isValid(), isFalse);
      expect(searchKey.isInvalidSearchKey, isTrue);
      searchKey.value.fold(
        (f) => f.maybeMap(
          subceedLength: (value) => expect(value.min, 2),
          orElse: () => fail('Expected subceedLength failure'),
        ),
        (_) => fail('Expected failure'),
      );
    });

    test('should be valid when search text length is 2 or more', () {
      final searchKey = SearchKey.search('ab');
      expect(searchKey.isValid(), isTrue);
      expect(searchKey.searchValueOrEmpty, 'ab');
      expect(searchKey.upperCaseValue, 'AB');
      expect(searchKey.countWhenValid, 1);
      expect(searchKey.validateNotEmpty, isTrue);
    });

    test('should return correct values for accessors on valid search key', () {
      final searchKey = SearchKey.search('hello');
      expect(searchKey.isValid(), isTrue);
      expect(searchKey.upperCaseValue, 'HELLO');
      expect(searchKey.countWhenValid, 1);
      expect(searchKey.validateNotEmpty, isTrue);
      expect(searchKey.isValueEmpty, isFalse);
    });
  });
}
