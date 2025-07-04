import 'dart:ui';

import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/shared/repositories/pokemon_repository.dart';

class AppLifecycleController extends FullLifeCycleController with FullLifeCycleMixin {
  final PokemonRepository repository = Get.find();

  @override
  void onDetached() {
    repository.cachedList.clear();
  }

  @override
  void onHidden() {
    repository.cachedList.clear();
  }

  @override
  void onInactive() {
    repository.cachedList.clear();
  }

  @override
  void onPaused() {
    repository.cachedList.clear();
  }

  @override
  void onResumed() {}

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        repository.cachedList.clear();
        break;
      case AppLifecycleState.detached:
        repository.cachedList.clear();
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}
