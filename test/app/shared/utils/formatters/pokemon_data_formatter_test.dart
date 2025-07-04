import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/app/shared/utils/formatters/pokemon_data_formatter.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  late PokemonDataFormatter pokemonDataFormatter;
  setUp(() {
    TestHelpers.setupGetX();
    pokemonDataFormatter = PokemonDataFormatter();
  });

  tearDown(() {
    TestHelpers.tearDownGetX();
  });

  group("convertWeight", () {
    test("should convert weight correctly", () {
      expect(pokemonDataFormatter.convertWeight(100), equals(10.0));
      expect(pokemonDataFormatter.convertWeight(650), equals(65.0));
      expect(pokemonDataFormatter.convertWeight(1000), equals(100.0));
    });
    test("should convert weight zero", () {
      expect(pokemonDataFormatter.convertWeight(0), equals(0.0));
    });
    test("should convert small weight", () {
      expect(pokemonDataFormatter.convertWeight(1), equals(0.1));
      expect(pokemonDataFormatter.convertWeight(5), equals(0.5));
    });
    test("should convert very large weight", () {
      expect(pokemonDataFormatter.convertWeight(10000), equals(1000.0));
      expect(pokemonDataFormatter.convertWeight(50000), equals(5000.0));
    });
    test("should maintain the decimal precision", () {
      expect(pokemonDataFormatter.convertWeight(123), equals(12.3));
      expect(pokemonDataFormatter.convertWeight(456), equals(45.6));
      expect(pokemonDataFormatter.convertWeight(789), equals(78.9));
    });
  });

  group("convertHeight", () {
    test("should convert height correctly", () {
      expect(pokemonDataFormatter.convertHeight(10), equals(100.0));
      expect(pokemonDataFormatter.convertHeight(15), equals(150.0));
      expect(pokemonDataFormatter.convertHeight(20), equals(200.0));
    });
    test("should convert height zero", () {
      expect(pokemonDataFormatter.convertHeight(0), equals(0.0));
    });
    test("should convert small height", () {
      expect(pokemonDataFormatter.convertHeight(1), equals(10.0));
      expect(pokemonDataFormatter.convertHeight(3), equals(30.0));
    });
    test("should convert very large height", () {
      expect(pokemonDataFormatter.convertHeight(100), equals(1000.0));
      expect(pokemonDataFormatter.convertHeight(500), equals(5000.0));
    });
  });
}
