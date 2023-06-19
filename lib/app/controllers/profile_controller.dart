import 'package:get/get.dart';

import '../core/utils/app_utils.dart';
import '../models/user_model.dart';
import '../repositories/profile_repository.dart';
import 'auth_controller.dart';

class ProfileController extends GetxController {
  final AuthController auth;
  final ProfileRepository repository;
  final AppUtils appUtils;

  ProfileController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  UserModel user = UserModel();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getUser();
  }

  Future getUser() async {
    isLoading.value = true;
    user = auth.user;
    isLoading.value = false;
  }

  Future signOut() async {
    await auth.signOut();
  }
}
