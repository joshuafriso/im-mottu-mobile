import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/shared/models/pokemon_type_model.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_border_radius.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_spacing.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';

class TypeWidget extends StatelessWidget {
  final List<PokemonTypeModel> types;
  const TypeWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.sectionSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppSpacing.sectionSpacing,
        children: [
          ...types.map((e) {
            return GestureDetector(
              onTap: () {
                Get.offNamed(AppPagesRoutes.types, arguments: e.name);
              },
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors().colorType(e.name),
                  borderRadius: BorderRadius.circular(AppBorderRadius.xl),
                ),
                child: Text(e.name, style: AppTypography.subtitle1!.copyWith(color: AppColors.white)),
              ),
            );
          }),
        ],
      ),
    );
  }
}
