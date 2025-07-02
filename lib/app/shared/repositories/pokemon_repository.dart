import 'dart:convert';

import 'package:im_mottu_mobile/app/shared/interfaces/i_pokemon_service.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_details_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';

class PokemonRepository {
  final IPokemonService service;
  List<PokemonModel> cachedList = <PokemonModel>[];

  PokemonRepository(this.service);

  Future<List<PokemonModel>> getPokemons() async {
    if (cachedList.isEmpty) {
      final response = await service.getPokemonList();
      if (response.isOk) {
        var body = jsonDecode(response.bodyString!);
        cachedList = PokemonModel.fromJsonList(body['results']);
      } else {
        cachedList = [];
      }
    }
    return cachedList;
  }

  Future<PokemonDetailsModel?> getPokemonDetails(int index) async {
    PokemonDetailsModel? details;
    if (cachedList[index].details == null) {
      final response = await service.getPokemonDetails(cachedList[index].name);
      if (response.isOk) {
        final body = response.body;
        details = PokemonDetailsModel.fromJson(body);
        cachedList[index].setDetails(details);
      }
    } else {
      details = cachedList[index].details;
    }
    return details;
  }
}
