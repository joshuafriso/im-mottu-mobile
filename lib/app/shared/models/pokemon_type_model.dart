import 'package:im_mottu_mobile/app/shared/utils/string_utils.dart';

class PokemonTypeModel {
  final String name;
  final String url;

  PokemonTypeModel({required this.name, required this.url});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(name: StringUtils().capitalize(json['type']['name']), url: json['type']['url']);
  }

  static List<PokemonTypeModel>? fromJsonList(List? list) {
    if (list == null) return null;
    return list.map<PokemonTypeModel>((item) => PokemonTypeModel.fromJson(item)).toList();
  }
}
