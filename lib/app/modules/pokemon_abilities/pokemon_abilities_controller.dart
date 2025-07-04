import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/repositories/pokemon_repository.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';

class PokemonAbilitiesController extends GetxController {
  final PokemonRepository pokemonRepository;
  PokemonAbilitiesController({required this.pokemonRepository});

  RxList<PokemonModel> pokemons = <PokemonModel>[].obs;
  var isLoading = true.obs;
  var loadError = ''.obs;
  late String ability;

  @override
  void onInit() {
    super.onInit();
    ability = Get.arguments;
    getPokemonsByAbility();
  }

  Future<void> getPokemonsByAbility() async {
    try {
      final result = await pokemonRepository.getPokemonsByAbility(ability);
      pokemons.value = result;
      isLoading.value = false;
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemons;
      isLoading.value = false;
    }
  }

  Future<void> getPokemonsDetails(String name, int index) async {
    try {
      final indexPokemon = pokemonRepository.cachedList.indexWhere((element) => element.name == name);

      pokemons[index].details = await pokemonRepository.getPokemonDetails(indexPokemon);
    } catch (e) {
      loadError.value = AppTexts.failedLoadPokemonDetails;
    }
  }

  void goToDetails(PokemonModel pokemon) {
    Get.offNamed(AppPagesRoutes.details, arguments: pokemon);
  }
}
