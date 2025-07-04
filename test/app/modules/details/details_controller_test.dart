import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/details/details_controller.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';

import '../../../helpers/test_helpers.dart';

void main() {
  late PokemonModel mockPokemon1;
  late DetailsController controller;
  setUp(() {
    TestHelpers.setupGetX();
    controller = DetailsController();
    mockPokemon1 = PokemonModel(name: "pikachu", url: 'url1');
    Get.routing.args = mockPokemon1;
  });

  tearDown(() {
    TestHelpers.tearDownGetX();
    controller.dispose();
  });

  group("DetailsController", () {
    test("should init with right values ", () {
      controller.onInit();
      expect(controller.pokemonModel, equals(mockPokemon1));
      expect(controller.pokemonModel.name, equals('pikachu'));
    });
  });
}
