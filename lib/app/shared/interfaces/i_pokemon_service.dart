import 'package:get/get_connect/http/src/response/response.dart';
import 'package:im_mottu_mobile/app/config/base_service.dart';

abstract class IPokemonService extends BaseService {
  Future<Response> getPokemonList();
  Future<Response> getPokemonDetails(String name);
  Future<Response> getPokemonByType(String type);
  Future<Response> getPokemonsByAbility(String ability);
}
