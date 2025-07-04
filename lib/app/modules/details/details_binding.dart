import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/modules/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
