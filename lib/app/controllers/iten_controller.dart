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

  RxList<ItemModel> listItens = RxList<ItemModel>([]);
  RxBool isLoading = false.obs;

  Future getItens(int id) async {
    isLoading.value = true;
    ApiResult<List<ItemModel>> result =
        await repository.getAll(auth.user.token!, id);
    if (!result.isError) {
      listItens.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future createItem(
      {required String name,
      required int lista_id,
      required int quantidade,
      required num preco}) async {
    isLoading.value = true;
    ApiResult<ItemModel> result = await repository.createItem(
        token: auth.user.token!,
        name: name,
        lista_id: lista_id,
        quantidade: quantidade,
        preco: preco);
    if (!result.isError) {
      appUtils.showToast(message: 'Item cadastrado com sucesso');
      Get.back();
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }
    isLoading.value = false;
  }
}
