// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:im_mottu_mobile/app/modules/home/home_controller.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_details_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.dart';
import '../../../mocks/pokemon_repository.mocks.dart';
import '../../../mocks/scroll_mocks.mocks.dart';

void main() {
  late HomeController controller;
  late MockPokemonRepository mockPokemonRepository;
  late MockScrollController mockScrollController;
  late MockScrollPosition mockScrollPosition;

  late List<PokemonModel> mockPokemonList;
  late List<PokemonModel> largePokemonList;
  late PokemonModel mockPokemon1;
  late PokemonModel mockPokemon2;
  late PokemonModel mockPokemon3;

  setUp(() {
    TestHelpers.setupGetX();
    mockPokemonRepository = MockPokemonRepository();
    mockScrollController = MockScrollController();
    mockScrollPosition = MockScrollPosition();

    mockPokemon1 = PokemonModel(name: "pikachu", url: 'url1');
    mockPokemon2 = PokemonModel(name: "charmander", url: 'url2');
    mockPokemon3 = PokemonModel(name: "squirtle", url: 'url3');
    mockPokemonList = [mockPokemon1, mockPokemon2, mockPokemon3];
    largePokemonList = List.generate(100, (index) => PokemonModel(name: 'pokemon$index', url: 'url$index'));

    when(mockScrollController.position).thenReturn(mockScrollPosition);
    when(mockPokemonRepository.getPokemons()).thenAnswer((_) async => mockPokemonList);
    when(mockPokemonRepository.cachedList).thenReturn(mockPokemonList);

    controller = HomeController(pokemonRepository: mockPokemonRepository);
  });

  tearDown(() {
    TestHelpers.tearDownGetX();
    controller.dispose();
  });

  group("HomeController - init", () {
    test("should init with right values", () {
      expect(controller.pokemons, isEmpty);
      expect(controller.basePokemonList, isEmpty);
      expect(controller.loadError.value, isEmpty);
      expect(controller.isLoading.value, isTrue);
      expect(controller.loadingIndexes, isEmpty);
      expect(controller.scrollController, isNotNull);
      expect(controller.searchController, isNotNull);
      expect(controller.offset, equals(0));
    });

    test("should configure scroll listener in onInit", () {
      controller.onInit();

      expect(controller.scrollController.hasListeners, isTrue);

      expect(controller.offset, equals(0));
    });

    test("should call getPokemons in onInit", () async {
      controller.onInit();

      await Future.delayed(Duration(milliseconds: 100));

      verify(mockPokemonRepository.getPokemons()).called(1);
    });
  });

  group("Offset Management", () {
    test("should increment offset correctly", () {
      final initialOffset = controller.offset;

      controller.incrementOffset();

      expect(controller.offset, initialOffset + 50);
    });

    test("should define offset through the setter", () {
      const newOffset = 100;

      controller.offset = newOffset;

      expect(controller.offset, equals(newOffset));
    });
  });

  group("getPokemons", () {
    test("should load Pokemons successfully", () async {
      when(mockPokemonRepository.getPokemons()).thenAnswer((_) async => largePokemonList);
      when(mockPokemonRepository.cachedList).thenReturn(largePokemonList);

      await controller.getPokemons();

      verify(mockPokemonRepository.getPokemons()).called(1);
      expect(controller.pokemons, isNotEmpty);
      expect(controller.basePokemonList, equals(largePokemonList));
      expect(controller.isLoading.value, isFalse);
      expect(controller.loadError.value, isEmpty);
    });

    test("should handle with error when load Pokemons", () async {
      when(mockPokemonRepository.getPokemons()).thenThrow(Exception());

      await controller.getPokemons();

      expect(controller.loadError.value, equals(AppTexts.failedLoadPokemons));
      expect(controller.isLoading.value, isFalse);
    });

    test("should apply pagination correctly", () async {
      when(mockPokemonRepository.getPokemons()).thenAnswer((_) async => largePokemonList);
      when(mockPokemonRepository.cachedList).thenReturn(largePokemonList);

      controller.offset = 50;

      await controller.getPokemons();

      expect(controller.pokemons.length, equals(50));
      expect(controller.pokemons.first.name, equals('pokemon50'));
    });
  });

  group("getPokemonsDetails", () {
    test("should load Pokemon details successfully", () async {
      controller.pokemons.add(mockPokemon1);
      controller.basePokemonList = [mockPokemon1];

      final mockDetails = PokemonDetailsModel(id: 1, height: 4, weight: 60, imgUrl: 'imgUrl1');
      when(mockPokemonRepository.getPokemonDetails(0)).thenAnswer((_) async => mockDetails);

      await controller.getPokemonsDetails('pikachu', 0);

      verify(mockPokemonRepository.getPokemonDetails(0)).called(1);
      expect(controller.pokemons[0].details, equals(mockDetails));
      expect(controller.loadingIndexes.contains(0), isFalse);
    });

    test("should add and remove index from loading", () async {
      controller.pokemons.add(mockPokemon1);
      controller.basePokemonList = [mockPokemon1];

      final mockDetails = PokemonDetailsModel(id: 1, height: 4, weight: 60, imgUrl: 'imgUrl1');
      when(mockPokemonRepository.getPokemonDetails(0)).thenAnswer((_) async {
        await Future.delayed(Duration(milliseconds: 50));
        return mockDetails;
      });

      final future = controller.getPokemonsDetails('pikachu', 0);

      expect(controller.loadingIndexes.contains(0), isTrue);

      await future;

      expect(controller.loadingIndexes.contains(0), isFalse);
    });

    test("shouldn't load details if exists", () async {
      final mockDetails = PokemonDetailsModel(id: 1, height: 4, weight: 60, imgUrl: 'imgUrl1');
      mockPokemon1.details = mockDetails;
      controller.pokemons.add(mockPokemon1);
      controller.basePokemonList = [mockPokemon1];

      await controller.getPokemonsDetails('pikachu', 0);

      verifyNever(mockPokemonRepository.getPokemonDetails(any));
    });

    test("should handle with error when load details", () async {
      controller.pokemons.add(mockPokemon1);
      controller.basePokemonList = [mockPokemon1];

      when(mockPokemonRepository.getPokemonDetails(0)).thenThrow(Exception());

      await controller.getPokemonsDetails('pikachu', 0);

      expect(controller.loadError.value, equals(AppTexts.failedLoadPokemonDetails));
    });
  });

  group("filterList", () {
    setUp(() {
      controller.basePokemonList = mockPokemonList;
    });

    test("should show all Pokemons when the filter is empty", () {
      controller.filterList('');

      expect(controller.pokemons.length, equals(mockPokemonList.length));
      expect(controller.isLoading.value, isFalse);
      expect(controller.loadError.value, equals(''));
    });

    test("should filter Pokemons correctly", () {
      controller.filterList('pika');

      expect(controller.pokemons.length, equals(1));
      expect(controller.pokemons.first.name, equals('pikachu'));
      expect(controller.isLoading.value, isFalse);
    });

    test("should be insensitive case ", () {
      controller.filterList('PIKA');
      expect(controller.pokemons.length, equals(1));
      expect(controller.pokemons.first.name, equals('pikachu'));
    });

    test("should return an empty list when no Pokemon corresponds", () {
      controller.filterList('nonexistent');
      expect(controller.pokemons, isEmpty);
      expect(controller.isLoading.value, isFalse);
    });

    test("should clean error befora filter", () {
      controller.loadError.value = AppTexts.failedLoadPokemonDetails;
      controller.filterList('pika');
      expect(controller.loadError.value, equals(''));
    });
  });

  group("Scroll Listener", () {
    test("should increment offset and search more Pokemons when scroll reach the end", () async {
      final scrollPosition = MockScrollPosition();
      when(scrollPosition.pixels).thenReturn(1000.0);
      when(scrollPosition.maxScrollExtent).thenReturn(500.0);

      controller.onInit();

      final initialOffset = controller.offset;

      expect(controller.offset, equals(initialOffset));

      await Future.delayed(Duration(milliseconds: 100));
      verify(mockPokemonRepository.getPokemons()).called(1);
    });

    test("shouldn't do anything when the scroll isn't at the end", () {
      final scrollPosition = MockScrollPosition();
      when(scrollPosition.pixels).thenReturn(400.0);
      when(scrollPosition.maxScrollExtent).thenReturn(500.0);

      controller.onInit();

      final initialOffset = controller.offset;

      expect(controller.offset, equals(initialOffset));
    });
  });
  group("Cleanup", () {
    test("should dispose the controllers onClose", () {
      expect(() => controller.onClose(), returnsNormally);
    });
  });
}
