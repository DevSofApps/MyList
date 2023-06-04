import 'package:get/get.dart';
import 'package:my_list/app/models/item_model.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../repositories/item_repository.dart';
import 'auth_controller.dart';

class ItemController extends GetxController {
  final AuthController auth;
  final ItemRepository repository;
  final AppUtils appUtils;

  ItemController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  RxList<ItemModel> listCategories = RxList<ItemModel>([]);
  RxBool isLoading = false.obs;

  Future getItens() async {
    isLoading.value = true;
    ApiResult<List<ItemModel>> result =
        await repository.getAll(auth.user.token!);
    if (!result.isError) {
      listCategories.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}
