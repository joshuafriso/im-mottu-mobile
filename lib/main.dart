import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(AppLifecycleListener());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
    runApp(const AppWidget());
  });
}
