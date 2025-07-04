import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/repositories/pokemon_repository.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';

class HomeController extends GetxController {
  final PokemonRepository pokemonRepository;

  HomeController({required this.pokemonRepository});

  RxList<PokemonModel> pokemons = <PokemonModel>[].obs;
  List<PokemonModel> basePokemonList = <PokemonModel>[];
  var loadError = ''.obs;
  var isLoading = true.obs;
  TextEditingController searchController = TextEditingController();

  RxSet<int> loadingIndexes = <int>{}.obs;
  final ScrollController scrollController = ScrollController();

  final _offset = 0.obs;

  int get offset => _offset.value;

  set offset(int value) => _offset.value = value;

  void incrementOffset() => _offset.value += 50;

  @override
  void onInit() {
    super.onInit();
    getPokemons();
    scrollController.addListener(() {
      bool isAtBottom = scrollController.position.pixels > scrollController.position.maxScrollExtent;

      if (isAtBottom) {
        incrementOffset();
        getPokemons();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
    scrollController.dispose();
  }

  Future<void> getPokemons() async {
    try {
      final pokemonResult = await pokemonRepository.getPokemons();
      pokemons.value = pokemonResult.sublist(_offset.value, _offset.value + 50);
      basePokemonList = List<PokemonModel>.from(pokemonRepository.cachedList);
      isLoading.value = false;
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemons;
      isLoading.value = false;
    }
  }

  Future<void> getPokemonsDetails(String name, int index) async {
    try {
      final indexPokemon = basePokemonList.indexWhere((element) => element.name == name);
      if (pokemons[index].details == null) {
        loadingIndexes.add(index);
        pokemons[index].details = await pokemonRepository.getPokemonDetails(indexPokemon);
        loadingIndexes.remove(index);
      }
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemonDetails;
    }
  }

  void filterList(String value) {
    loadError.value = '';
    isLoading.value = true;
    if (value.isEmpty) {
      pokemons.assignAll(basePokemonList);
      isLoading.value = false;
    } else {
      List<PokemonModel> filteredList = <PokemonModel>[];

      filteredList.addAll(basePokemonList);

      filteredList = filteredList.where((pokemon) => pokemon.name.toLowerCase().contains(value.toLowerCase())).toList();

      pokemons.assignAll(filteredList);
      isLoading.value = false;
    }
  }

  void goToDetails(PokemonModel pokemon) {
    Get.toNamed(AppPagesRoutes.details, arguments: pokemon);
  }
}
