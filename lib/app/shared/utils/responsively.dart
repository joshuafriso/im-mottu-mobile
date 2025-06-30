import 'package:get/get.dart';

class Responsively {
  static double _handleWidth(double size) {
    final coefficient = size / 430;

    return Get.width * coefficient;
  }

  static double _handleHeight(double size) {
    final coefficient = size / 932;

    return Get.height * coefficient;
  }

  static double auto(double size) {
    return Get.width > Get.height ? _handleWidth(size) : _handleHeight(size);
  }
}
