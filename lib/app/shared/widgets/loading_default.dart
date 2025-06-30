import 'package:flutter/material.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_assets.dart';
import 'package:lottie/lottie.dart';

class LoadingDefault extends StatelessWidget {
  const LoadingDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: LottieBuilder.asset(AppAssets.pokeballLoading));
  }
}
