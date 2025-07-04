import 'package:im_mottu_mobile/app/shared/models/pokemon_details_model.dart';
import 'package:im_mottu_mobile/app/shared/utils/string_utils.dart';

class PokemonModel {
  final String name;
  final String url;
  PokemonDetailsModel? details;

  PokemonModel({required this.name, required this.url, this.details});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: StringUtils().capitalize(json['name']), url: json['url']);
  }

  static List<PokemonModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map<PokemonModel>((item) => PokemonModel.fromJson(item)).toList();
  }

  void setDetails(PokemonDetailsModel details) {
    this.details = details;
  }
}
