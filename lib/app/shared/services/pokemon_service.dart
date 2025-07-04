import 'package:get/get_connect/http/src/response/response.dart';
import 'package:im_mottu_mobile/app/config/endpoints.dart';
import 'package:im_mottu_mobile/app/shared/interfaces/i_pokemon_service.dart';

class PokemonService extends IPokemonService {
  @override
  Future<Response> getPokemonList() async {
    final response = await get(Endpoints.pokemons);
    return response;
  }

  @override
  Future<Response> getPokemonDetails(String name) async {
    final response = await get(Endpoints.pokemonDetails.replaceAll("{name}", name));
    return response;
  }

  @override
  Future<Response> getPokemonByType(String type) async {
    final response = await get(Endpoints.pokemonType.replaceAll("{name}", type));
    return response;
  }

  @override
  Future<Response> getPokemonsByAbility(String ability) async {
    final response = await get(Endpoints.pokemonAbility.replaceAll("{name}", ability));
    return response;
  }
}
