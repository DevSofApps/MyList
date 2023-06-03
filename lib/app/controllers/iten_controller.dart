import 'package:get/get.dart';
import 'package:my_list/app/models/item_model.dart';

import '../repositories/item_repository.dart';

class CategoryController extends GetxController {
  final repository = ItemRepository();

  RxList<ItemModel> listCategories = RxList<ItemModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;
    List<ItemModel> result = await repository.getAll();
    if (result.isNotEmpty) {
      listCategories.assignAll(result);
    } else {
      print("Erro ao retornar os dados");
    }
    isLoading.value = false;
  }
}
