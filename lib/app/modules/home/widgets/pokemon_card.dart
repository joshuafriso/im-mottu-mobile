import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';

class PokemonCard extends StatelessWidget {
  // final PokemonModel pokemonModel;
  final String name;
  final String type;
  final String image;
  const PokemonCard({super.key, required this.name, required this.type, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors().colorType(type),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          spacing: AppSpacing.xs,
          children: [
            CachedNetworkImage(imageUrl: image, width: Responsively.auto(80), height: Responsively.auto(80)),
            FittedBox(
              child: Text(name.replaceAll("-", " "), style: AppTypography.subtitle1!.copyWith(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
