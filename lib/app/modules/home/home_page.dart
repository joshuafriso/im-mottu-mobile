import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/home/home_controller.dart';
import 'package:im_mottu_mobile/app/modules/home/widgets/pokemon_card.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_assets.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';
import 'package:im_mottu_mobile/app/shared/widgets/loading_default.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.homeAppBarTitle),
        leading: Image.asset(AppAssets.pokeballIcon),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Responsively.auto(60)),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.elementSpacing),
            child: TextFormField(
              controller: controller.searchController,
              onChanged: (value) => controller.filterList(value),
              decoration: InputDecoration(hintText: "Search", suffixIcon: Icon(Icons.search)),
            ),
          ),
        ),
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingDefault();
        } else if (controller.loadError.value != '') {
          return Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(controller.loadError.value, style: AppTypography.headLine1, textAlign: TextAlign.center),
            ),
          );
        } else {
          return controller.pokemons.isEmpty
              ? Center(child: Text(AppTexts.noPokemonsFound, style: AppTypography.headLine1))
              : GridView.builder(
                  padding: const EdgeInsets.all(AppSpacing.screenPadding),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 140),
                  itemCount: controller.pokemons.length,
                  itemBuilder: (context, index) {
                    return FutureBuilder(
                      future: controller.getPokemonsDetails(index),
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
                                  child: PokemonCard(pokemonModel: controller.pokemons[index]),
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
