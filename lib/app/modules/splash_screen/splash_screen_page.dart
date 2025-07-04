import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_assets.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_colors.dart';
import 'package:im_mottu_mobile/app/shared/utils/responsively.dart';
import 'package:im_mottu_mobile/app/shared/widgets/loading_default.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppPagesRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -50,
            right: -90,
            child: Image.asset(
              AppAssets.pokeball,
              width: Responsively.auto(240),
              height: Responsively.auto(240),
              opacity: const AlwaysStoppedAnimation(0.35),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppAssets.pokeball,
              width: Responsively.auto(240),
              height: Responsively.auto(240),
              opacity: const AlwaysStoppedAnimation(0.45),
            ),
          ),
          Positioned(
            top: 0,
            left: 10,
            right: 10,
            bottom: 0,
            child: Image.asset(AppAssets.logoPokemon, width: Responsively.auto(220), height: Responsively.auto(240)),
          ),
          Positioned(top: 0, bottom: -300, left: 0, right: 0, child: LoadingDefault(color: AppColors.white)),
          Positioned(
            bottom: -50,
            left: -90,
            child: Image.asset(
              AppAssets.pokeball,
              width: Responsively.auto(240),
              height: Responsively.auto(240),
              opacity: const AlwaysStoppedAnimation(0.35),
            ),
          ),
        ],
      ),
    );
  }
}
