import 'dart:convert';

import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/config/endpoints.dart';
import 'package:im_mottu_mobile/app/shared/interfaces/i_pokemon_service.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_abilities_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_details_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_type_model.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';

class HomeController extends GetxController {
  final IPokemonService pokemonService;

  HomeController({required this.pokemonService});

  List<PokemonModel>? pokemons = <PokemonModel>[].obs;
  var loadError = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getPokemons();
  }

  Future<void> getPokemons() async {
    final response = await pokemonService.getPokemonList();
    if (response.isOk) {
      var body = jsonDecode(response.bodyString!);
      pokemons = PokemonModel.fromJsonList(body['results']);
      isLoading.value = false;
    } else {
      loadError.value = AppTexts.failedLoadPokemons;
    }
  }

  Future<void> getPokemonsDetails(int index) async {
    final response = await pokemonService.getPokemonDetails(pokemons![index].name);
    if (response.isOk) {
      final body = response.body;
      pokemons![index].setDeatils(
        PokemonDetailsModel(
          id: body['id'],
          height: body['height'],
          weight: body['weight'],
          imgUrl: Endpoints.pokemonImgUrl.replaceAll('{id}', body['id'].toString()),
          typesModel: PokemonTypeModel.fromJsonList(body['types']),
          abilitiesModel: PokemonAbilitiesModel.fromJsonList(body['abilities']),
        ),
      );
    } else {
      loadError.value = AppTexts.failedLoadPokemonDetails;
    }
  }

  void goToDetails(PokemonModel pokemon) {
    Get.toNamed(AppPagesRoutes.details, arguments: pokemon);
  }
}
