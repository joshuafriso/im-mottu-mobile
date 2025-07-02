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

  @override
  void onInit() {
    super.onInit();
    getPokemons();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  Future<void> getPokemons() async {
    try {
      pokemons.value = await pokemonRepository.getPokemons();
      basePokemonList = List<PokemonModel>.from(pokemonRepository.cachedList);
      isLoading.value = false;
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemons;
      isLoading.value = false;
    }
  }

  Future<void> getPokemonsDetails(int index) async {
    try {
      if (pokemons[index].details == null) {
        loadingIndexes.add(index);
        pokemons[index].details = await pokemonRepository.getPokemonDetails(index);
        loadingIndexes.remove(index);
      }
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemonDetails;
    }
  }

  void filterList(String value) {
    loadError.value = '';
    if (value.isEmpty) {
      pokemons.assignAll(basePokemonList);
    } else {
      List<PokemonModel> filteredList = <PokemonModel>[];

      filteredList.addAll(basePokemonList);

      filteredList = filteredList.where((pokemon) => pokemon.name.toLowerCase().contains(value.toLowerCase())).toList();

      pokemons.assignAll(filteredList);
    }
  }

  void goToDetails(PokemonModel pokemon) {
    Get.toNamed(AppPagesRoutes.details, arguments: pokemon);
  }
}
