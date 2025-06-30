import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:im_mottu_mobile/app/shared/utils/formatters/pokemon_data_formatter.dart';

class HeightWidget extends StatelessWidget {
  final int height;
  const HeightWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.md,
      children: [
        Row(
          spacing: AppSpacing.sm,
          children: [
            Icon(Icons.height, color: AppColors.grayMedium),
            Text('${PokemonDataFormatter().convertHeight(height)} cm', style: AppTypography.textBody1),
          ],
        ),
        Text(AppTexts.heightText, style: AppTypography.subtitle1),
      ],
    );
  }
}
