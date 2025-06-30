import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/home/home_controller.dart';
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
      appBar: AppBar(title: Text(AppTexts.homeAppBarTitle), leading: Image.asset(AppAssets.pokeballIcon)),

      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingDefault();
        } else if (controller.loadError.value != '') {
          return Center(child: Text(controller.loadError.value, style: AppTypography.headLine1));
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 140),
            itemCount: controller.pokemons!.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: controller.getPokemonsDetails(index),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListTile(
                      title: Text(
                        controller.pokemons![index].name,
                        style: AppTypography.subtitle1!.copyWith(color: AppColors.white),
                      ),
                      trailing: SizedBox(
                        width: Responsively.auto(50),
                        height: Responsively.auto(50),
                        child: LoadingDefault(),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        controller.goToDetails(controller.pokemons![index]);
                      },
                      child: Card(
                        color: AppColors().colorType(controller.pokemons![index].details!.typesModel![0].name),
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.cardPadding),
                          child: Column(
                            spacing: AppSpacing.xs,
                            children: [
                              CachedNetworkImage(
                                imageUrl: controller.pokemons![index].details!.imgUrl,
                                width: Responsively.auto(80),
                                height: Responsively.auto(80),
                              ),
                              Text(
                                controller.pokemons![index].name,
                                style: AppTypography.subtitle1!.copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
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
