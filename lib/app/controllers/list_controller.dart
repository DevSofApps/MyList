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

  ListController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  RxList<ListModel> listCategories = RxList<ListModel>([]);
  RxBool isLoading = false.obs;

  Future getItens() async {
    isLoading.value = true;
    ApiResult<List<ListModel>> result =
        await repository.getAll(auth.user.token!);
    if (!result.isError) {
      listCategories.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}
