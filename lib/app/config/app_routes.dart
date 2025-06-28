import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/modules/home/home_binding.dart';
import 'package:im_mottu_mobile/app/modules/home/home_page.dart';

class AppRoutes {
  AppRoutes._();

  static var routes = <GetPage>[GetPage(name: AppPagesRoutes.home, page: () => HomePage(), binding: HomeBinding())];
}
