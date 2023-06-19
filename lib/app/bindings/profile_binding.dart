import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../repositories/profile_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileRepository(httpManager: Get.find()));
    Get.put(ProfileController(
        appUtils: Get.find(), auth: Get.find(), repository: Get.find()));
  }
}
