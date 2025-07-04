import 'package:get/get.dart';
import 'package:im_mottu_mobile/app/config/endpoints.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Endpoints.baseUrl + Endpoints.defaultApiPath;
    super.onInit();
  }
}
