import 'package:get/get.dart';

class TestHelpers {
  /// Configure the GetX test environment
  static void setupGetX() {
    Get.testMode = true;
  }

  /// Clean the GetX test environment
  static void tearDownGetX() {
    Get.reset();
  }
}
