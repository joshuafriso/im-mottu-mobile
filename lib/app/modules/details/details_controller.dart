import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';

class DetailsController extends GetxController {
  late final PokemonModel pokemonModel;

  @override
  void onInit() {
    super.onInit();
    pokemonModel = Get.arguments;
  }
}
