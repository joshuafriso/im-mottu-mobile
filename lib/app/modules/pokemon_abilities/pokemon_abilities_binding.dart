import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_abilities/pokemon_abilities_controller.dart';
import 'package:im_mottu_mobile/app/shared/interfaces/i_pokemon_service.dart';
import 'package:im_mottu_mobile/app/shared/repositories/pokemon_repository.dart';
import 'package:im_mottu_mobile/app/shared/services/pokemon_service.dart';

class PokemonAbilitiesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IPokemonService>(PokemonService());
    Get.put(PokemonRepository(Get.find()));
    Get.lazyPut<PokemonAbilitiesController>(() => PokemonAbilitiesController(pokemonRepository: Get.find()));
  }
}
