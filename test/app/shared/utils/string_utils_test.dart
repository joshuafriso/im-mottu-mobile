import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/app/shared/utils/string_utils.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  late StringUtils stringUtils;
  setUp(() {
    TestHelpers.setupGetX();
    stringUtils = StringUtils();
  });

  tearDown(() {
    TestHelpers.tearDownGetX();
  });
  group('StringUtils capitalize', () {
    test('should capitalize a normal string', () {
      const input = 'hello';
      const expected = 'Hello';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
    test('should capitalize a string with numbers', () {
      const input = 'hello123';
      const expected = 'Hello123';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });

    test('should capitalize a string with special characters', () {
      const input = 'hello@123';
      const expected = 'Hello@123';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });

    test("should capitalize a string capitalized", () {
      const input = 'Hello';
      const expected = 'Hello';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });

    test("should capitalize a string with multiples words", () {
      const input = 'hello world';
      const expected = 'Hello world';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });

    test("should return an empty string when the input was empty", () {
      const input = '';
      const expected = '';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });

    test("should capitalize a string with one character", () {
      const input = 'a';
      const expected = 'A';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
    test("should capitalize a string starts with a number", () {
      const input = '123abc';
      const expected = '123abc';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
    test("should capitalize a string starts with a symbol", () {
      const input = '@hello';
      const expected = '@hello';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
    test("should capitalize a string starts with a space", () {
      const input = ' hello';
      const expected = ' hello';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
    test("should capitalize a string with a special character", () {
      const input = 'çãoção';
      const expected = 'Çãoção';

      final result = stringUtils.capitalize(input);

      expect(result, equals(expected));
    });
  });
}
