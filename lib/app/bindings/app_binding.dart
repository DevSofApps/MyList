  import 'package:get/get.dart';

  import '../controllers/auth_controller.dart';
  import '../core/services/http_manager.dart';
  import '../core/utils/app_utils.dart';
  import '../repositories/auth_repository.dart';

  class AppBinding extends Bindings {
    @override
    void dependencies() {
      Get.put(HttpManager());
      Get.put(AppUtils());
      Get.put(AuthRepository(httpManager: Get.find(), appUtils: Get.find()));
      Get.put(AuthController(repository: Get.find(), appUtils: Get.find()));
    }
  }
