import 'package:get/get.dart';

import '../core/services/http_manager.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpManager());
  }
}
