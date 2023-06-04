import 'package:get/get.dart';

import '../controllers/iten_controller.dart';
import '../repositories/item_repository.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemRepository(httpManager: Get.find()));
    Get.put(ItemController(
        auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}
