import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/details/details_controller.dart';
import 'package:im_mottu_mobile/app/modules/details/widgets/abilities_widget.dart';
import 'package:im_mottu_mobile/app/modules/details/widgets/height_widget.dart';
import 'package:im_mottu_mobile/app/modules/details/widgets/type_widget.dart';
import 'package:im_mottu_mobile/app/modules/details/widgets/weight_widget.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_assets.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/app_texts.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pokemonModel.name),
        backgroundColor: AppColors().colorType(controller.pokemonModel.details!.typesModel![0].name),
      ),

      body: ListView(
        children: [
          Container(
            height: Responsively.auto(250),
            decoration: BoxDecoration(
              color: AppColors().colorType(controller.pokemonModel.details!.typesModel![0].name),
              image: DecorationImage(image: AssetImage(AppAssets.pokeballBackground), alignment: Alignment.centerRight),
            ),
            child: CachedNetworkImage(
              imageUrl: controller.pokemonModel.details!.imgUrl,
              width: Responsively.auto(150),
              height: Responsively.auto(150),
            ),
          ),
          TypeWidget(types: controller.pokemonModel.details!.typesModel!),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(AppSpacing.lg),
              child: Text(
                AppTexts.aboutText,
                style: AppTypography.headLine1!.copyWith(
                  color: AppColors().colorType(controller.pokemonModel.details!.typesModel![0].name),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.sectionSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeightWidget(height: controller.pokemonModel.details!.height),
                SizedBox(height: 80, child: VerticalDivider(thickness: 2, color: AppColors.grayMedium)),
                WeightWidget(weight: controller.pokemonModel.details!.weight),
                SizedBox(height: 80, child: VerticalDivider(thickness: 2, color: AppColors.grayMedium)),
                AbilitiesWidget(abilities: controller.pokemonModel.details!.abilitiesModel!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
