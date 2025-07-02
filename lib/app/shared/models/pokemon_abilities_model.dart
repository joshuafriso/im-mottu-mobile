import 'package:im_mottu_mobile/app/shared/utils/string_utils.dart';

class PokemonAbilitiesModel {
  final String name;
  final String url;

  PokemonAbilitiesModel({required this.name, required this.url});

  factory PokemonAbilitiesModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilitiesModel(name: StringUtils().capitalize(json['ability']['name']), url: json['ability']['url']);
  }

  static List<PokemonAbilitiesModel>? fromJsonList(List? list) {
    if (list == null) return null;
    return list.map<PokemonAbilitiesModel>((item) => PokemonAbilitiesModel.fromJson(item)).toList();
  }
}
