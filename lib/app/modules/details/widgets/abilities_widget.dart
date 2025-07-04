import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
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
      spacing: AppSpacing.sm,
      children: [
        ...abilities.map((e) {
          return InkWell(
            onTap: () {
              Get.offNamed(AppPagesRoutes.abilities, arguments: e.name);
            },
            child: Text(e.name, style: AppTypography.textBody2),
          );
        }),
        Text(AppTexts.abilitiesText, style: AppTypography.subtitle1),
      ],
    );
  }
}
