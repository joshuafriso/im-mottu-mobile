import 'package:flutter/widgets.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_abilities_model.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';

class AbilitiesWidget extends StatelessWidget {
  final List<PokemonAbilitiesModel> abilities;
  const AbilitiesWidget({super.key, required this.abilities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...abilities.map((e) {
          return Text(e.name, style: AppTypography.textBody2);
        }),
        SizedBox(height: AppSpacing.sm),

        Text(AppTexts.abilitiesText, style: AppTypography.subtitle1),
      ],
    );
  }
}
