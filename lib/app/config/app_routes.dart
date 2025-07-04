import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:im_mottu_mobile/app/config/app_pages_routes.dart';
import 'package:im_mottu_mobile/app/modules/details/details_binding.dart';
import 'package:im_mottu_mobile/app/modules/details/details_page.dart';
import 'package:im_mottu_mobile/app/modules/home/home_binding.dart';
import 'package:im_mottu_mobile/app/modules/home/home_page.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_abilities/pokemon_abilities_binding.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_abilities/pokemon_abilities_page.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_types/pokemon_type_binding.dart';
import 'package:im_mottu_mobile/app/modules/pokemon_types/pokemon_type_page.dart';
import 'package:im_mottu_mobile/app/modules/splash_screen/splash_screen_page.dart';

class AppRoutes {
  AppRoutes._();

  static var routes = <GetPage>[
    GetPage(name: AppPagesRoutes.splash, page: () => SplashScreenPage()),
    GetPage(name: AppPagesRoutes.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: AppPagesRoutes.details, page: () => DetailsPage(), binding: DetailsBinding()),
    GetPage(name: AppPagesRoutes.types, page: () => PokemonTypePage(), binding: PokemonTypeBinding()),
    GetPage(name: AppPagesRoutes.abilities, page: () => PokemonAbilitiesPage(), binding: PokemonAbilitiesBinding()),
  ];
}
