import 'dart:ui';

class AppColors {
  static const primary = Color(0xFFDC0A2D);
  static const bugPokemon = Color(0xFFA7B723);
  static const darkPokemon = Color(0xFF75574C);
  static const dragonPokemon = Color(0xFF7037FF);
  static const eletricPokemon = Color(0xFFF9CF30);
  static const fairyPokemon = Color(0xFFE69EAC);
  static const fightingPokemon = Color(0xFFC12239);
  static const firePokemon = Color(0xFFF57D31);
  static const flyingPokemon = Color(0xFFA891EC);
  static const ghostPokemon = Color(0xFF70559B);
  static const normalPokemon = Color(0xFFAAA67F);
  static const grassPokemon = Color(0xFF74CB48);
  static const groundPokemon = Color(0xFFDEC16B);
  static const icePokemon = Color(0xFF9AD6DF);
  static const poisonPokemon = Color(0xFFA43E9E);
  static const psychicPokemon = Color(0xFFFB5584);
  static const rockPokemon = Color(0xFFB69E31);
  static const steelPokemon = Color(0xFFB7B9D0);
  static const waterPokemon = Color(0xFF6493EB);

  static const grayDark = Color(0xFF212121);
  static const grayMedium = Color(0xFF666666);
  static const grayLight = Color(0xFFE0E0E0);
  static const white = Color(0xFFFFFFFF);

  Color colorType(String? type) {
    switch (type) {
      case "Normal":
        return normalPokemon;
      case "Fire":
        return firePokemon;
      case "Water":
        return waterPokemon;
      case "Electric":
        return eletricPokemon;
      case "Grass":
        return grassPokemon;
      case "Ice":
        return icePokemon;
      case "Fighting":
        return fightingPokemon;
      case "Poison":
        return poisonPokemon;
      case "Ground":
        return groundPokemon;
      case "Flying":
        return flyingPokemon;
      case "Psychic":
        return psychicPokemon;
      case "Bug":
        return bugPokemon;
      case "Rock":
        return rockPokemon;
      case "Ghost":
        return ghostPokemon;
      case "Dragon":
        return dragonPokemon;
      case "Dark":
        return darkPokemon;
      case "Steel":
        return steelPokemon;
      case "Fairy":
        return fairyPokemon;
      default:
        return normalPokemon;
    }
  }
}
