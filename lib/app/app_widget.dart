import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/config/app_routes.dart';
import 'package:im_mottu_mobile/app/shared/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      navigatorKey: Get.key,
      initialRoute: AppPagesRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
