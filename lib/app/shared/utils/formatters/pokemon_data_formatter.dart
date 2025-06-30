class PokemonDataFormatter {
  double convertWeight(int weightInHectogram) {
    return weightInHectogram / 10;
  }

  double convertHeight(int heightInDecimeters) {
    return heightInDecimeters * 10;
  }
}
