import 'package:im_mottu_mobile/app/config/endpoints.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_abilities_model.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_type_model.dart';

class PokemonDetailsModel {
  int id;
  int height;
  int weight;
  String imgUrl;
  List<PokemonTypeModel>? typesModel;
  List<PokemonAbilitiesModel>? abilitiesModel;

  PokemonDetailsModel({
    required this.id,
    required this.height,
    required this.weight,
    required this.imgUrl,
    this.typesModel,
    this.abilitiesModel,
  });

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailsModel(
      id: json['id'],
      height: json['height'],
      weight: json['weight'],
      imgUrl: Endpoints.pokemonImgUrl.replaceAll('{id}', json['id'].toString()),
      typesModel: PokemonTypeModel.fromJsonList(json['types']),
      abilitiesModel: PokemonAbilitiesModel.fromJsonList(json['abilities']),
    );
  }
}
