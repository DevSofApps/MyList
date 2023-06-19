import 'package:get/get.dart';
import 'package:my_list/app/models/lista_model.dart';
import 'package:my_list/app/repositories/list_repository.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import 'auth_controller.dart';

class ListController extends GetxController {
  final AuthController auth;
  final ListRepository repository;
  final AppUtils appUtils;

  @override
  void onInit() {
    super.onInit();

    getItens();
  }

  ListController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  final RxString name = RxString('');
  RxList<ListModel> list = RxList<ListModel>([]);
  RxBool isLoading = false.obs;

  Future getItens() async {
    isLoading.value = true;
    ApiResult<List<ListModel>> result =
        await repository.getAll(auth.user.token!);
    if (!result.isError) {
      list.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future createList({required String name}) async {
    isLoading.value = true;
    ApiResult<ListModel> result = await repository.createList(
        token: auth.user.token!, name: name, userId: auth.user.id!);
    if (!result.isError) {
      appUtils.showToast(message: 'Lista cadastrada com sucesso');
      Get.back();
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }
    isLoading.value = false;
  }
}
