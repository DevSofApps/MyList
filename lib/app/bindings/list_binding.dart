import 'package:get/get.dart';
import 'package:my_list/app/repositories/list_repository.dart';

import '../controllers/list_controller.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListRepository(httpManager: Get.find()));
    Get.put(ListController(
        auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}
