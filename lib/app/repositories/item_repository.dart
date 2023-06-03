import 'package:my_list/app/models/item_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/urls.dart';

class ItemRepository {
  HttpManager httpManager = HttpManager();

  Future<List<ItemModel>> getAll() async {
    const String endpoint = "${Url.base}/item";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<ItemModel> itens = ItemModel.fromList(list);

      return itens;
    } else {
      return [];
    }
  }

  Future<ItemModel> getById(int id) async {
    ItemModel model = ItemModel();

    final response = await httpManager.request(
      url: "http://192.168.3.18:8000/api/categories/$id",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      model = ItemModel.fromJson(response['data']);
    }

    return model;
  }
}
