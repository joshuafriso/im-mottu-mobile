import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_abilities/pokemon_abilities_controller.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';
import 'package:im_mottu_mobile/app/shared/widgets/loading_default.dart';
import 'package:im_mottu_mobile/app/shared/widgets/pokemon_card.dart';

class PokemonAbilitiesPage extends GetView<PokemonAbilitiesController> {
  const PokemonAbilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.ability)),

      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingDefault();
        } else {
          return controller.pokemons.isEmpty
              ? Center(child: Text(AppTexts.noPokemonsFound, style: AppTypography.headLine1))
              : GridView.builder(
                  padding: const EdgeInsets.all(AppSpacing.screenPadding),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 140),
                  itemCount: controller.pokemons.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: controller.getPokemonsDetails(controller.pokemons[index].name, index),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return ListTile(
                            title: Text(
                              controller.pokemons[index].name,
                              style: AppTypography.subtitle1!.copyWith(color: AppColors.grayDark),
                            ),
                            trailing: SizedBox(
                              width: Responsively.auto(30),
                              height: Responsively.auto(30),
                              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppColors.primary)),
                            ),
                          );
                        } else {
                          return controller.pokemons.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    controller.goToDetails(controller.pokemons[index]);
                                  },
                                  child: PokemonCard(
                                    name: controller.pokemons[index].name,
                                    type: controller.pokemons[index].details!.typesModel![0].name,
                                    image: controller.pokemons[index].details!.imgUrl,
                                  ),
                                )
                              : Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(AppSpacing.cardPadding),
                                    child: Text(
                                      controller.pokemons[index].name,
                                      style: AppTypography.subtitle1!.copyWith(color: AppColors.white),
                                    ),
                                  ),
                                );
                        }
                      },
                    );
                  },
                );
        }
      }),
    );
  }
}
