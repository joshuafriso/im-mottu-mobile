import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_model.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemonModel;
  const PokemonCard({super.key, required this.pokemonModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().colorType(pokemonModel.details!.typesModel![0].name),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          spacing: AppSpacing.xs,
          children: [
            CachedNetworkImage(
              imageUrl: pokemonModel.details!.imgUrl,
              width: Responsively.auto(80),
              height: Responsively.auto(80),
            ),
            FittedBox(
              child: Text(pokemonModel.name, style: AppTypography.subtitle1!.copyWith(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
