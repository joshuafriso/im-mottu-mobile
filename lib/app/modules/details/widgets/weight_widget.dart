import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:im_mottu_mobile/app/shared/utils/formatters/pokemon_data_formatter.dart';

class WeightWidget extends StatelessWidget {
  final int weight;
  const WeightWidget({super.key, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.md,
      children: [
        Row(
          spacing: AppSpacing.md,
          children: [
            Icon(Icons.scale, color: AppColors.grayMedium),
            Text('${PokemonDataFormatter().convertWeight(weight)} Kg', style: AppTypography.textBody1),
          ],
        ),
        Text(AppTexts.weightText, style: AppTypography.subtitle1),
      ],
    );
  }
}
