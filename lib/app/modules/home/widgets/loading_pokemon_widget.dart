import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_typography.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';

class LoadingPokemonWidget extends StatelessWidget {
  final String name;
  const LoadingPokemonWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: AppTypography.subtitle1!.copyWith(color: AppColors.grayDark)),
      trailing: SizedBox(
        width: Responsively.auto(30),
        height: Responsively.auto(30),
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(AppColors.primary)),
      ),
    );
  }
}
