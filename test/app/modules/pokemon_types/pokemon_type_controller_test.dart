import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_types/pokemon_type_controller.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_details_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.dart';
import '../../../mocks/pokemon_repository.mocks.dart';

void main() {
  late PokemonTypeController controller;
  late MockPokemonRepository mockPokemonRepository;

  late List<PokemonModel> mockPokemonList;
  late PokemonModel mockPokemon1;
  late PokemonModel mockPokemon2;
  late PokemonModel mockPokemon3;

  setUp(() {
    TestHelpers.setupGetX();
    mockPokemonRepository = MockPokemonRepository();
    controller = PokemonTypeController(pokemonRepository: mockPokemonRepository);
    Get.routing.args = 'eletric';
    mockPokemon1 = PokemonModel(name: "pikachu", url: 'url1');
    mockPokemon2 = PokemonModel(name: "charmander", url: 'url2');
    mockPokemon3 = PokemonModel(name: "squirtle", url: 'url3');
    mockPokemonList = [mockPokemon1, mockPokemon2, mockPokemon3];
    when(mockPokemonRepository.cachedList).thenReturn(mockPokemonList);
  });

  tearDown(() {
    TestHelpers.tearDownGetX();
    controller.dispose();
  });

  group("PokemonTypeController - init", () {
    test("should init with right values", () {
      expect(controller.pokemons, isEmpty);
      expect(controller.loadError.value, isEmpty);
      expect(controller.isLoading.value, isTrue);
    });

    test("should get arguments in onInit", () async {
      controller.onInit();

      expect(controller.type, equals('eletric'));
    });
    test("should call getPokemonsByType in onInit", () async {
      controller.onInit();

      await Future.delayed(Duration(milliseconds: 100));

      verify(mockPokemonRepository.getPokemonsByType(controller.type)).called(1);
    });
  });

  group("getPokemonsByType", () {
    test("should load Pokemons successfully", () async {
      when(mockPokemonRepository.getPokemonsByType(any)).thenAnswer((_) async => mockPokemonList);

      controller.onInit();

      await Future.delayed(Duration(milliseconds: 100));

      verify(mockPokemonRepository.getPokemonsByType(controller.type)).called(1);
      expect(controller.pokemons, isNotEmpty);
      expect(controller.isLoading, isFalse);
    });

    test("should handle with error when load Pokemons", () async {
      when(mockPokemonRepository.getPokemonsByType(any)).thenThrow(Exception());

      controller.onInit();

      await Future.delayed(Duration(milliseconds: 100));

      expect(controller.loadError.value, equals(AppTexts.failedLoadPokemons));
      expect(controller.isLoading.value, isFalse);
    });
  });

  group("getPokemonsDetials", () {
    test("should load Pokemon details successfully", () async {
      controller.pokemons.add(mockPokemon1);

      final mockDetails = PokemonDetailsModel(id: 1, height: 4, weight: 60, imgUrl: 'imgUrl1');
      when(mockPokemonRepository.getPokemonDetails(0)).thenAnswer((_) async => mockDetails);

      await controller.getPokemonsDetails('pikachu', 0);

      verify(mockPokemonRepository.getPokemonDetails(0)).called(1);
      expect(controller.pokemons[0].details, equals(mockDetails));
    });
    test("should handle with error when load details", () async {
      controller.pokemons.add(mockPokemon1);

      when(mockPokemonRepository.getPokemonDetails(0)).thenThrow(Exception());

      await controller.getPokemonsDetails('pikachu', 0);

      expect(controller.loadError.value, equals(AppTexts.failedLoadPokemonDetails));
    });
  });
}
