import 'package:im_mottu_mobile/app/shared/models/pokemon_type_model.dart';

class PokemonDetailsModel {
  int id;
  int height;
  int weight;
  String imgUrl;
  List<PokemonTypeModel>? typesModel;

  PokemonDetailsModel({
    required this.id,
    required this.height,
    required this.weight,
    required this.imgUrl,
    this.typesModel,
  });
}
