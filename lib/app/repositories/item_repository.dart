import 'package:my_list/app/models/item_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';

class ItemRepository {
  HttpManager httpManager = HttpManager();

  ItemRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<ItemModel>>> getAll(
    String token,
  ) async {
    const String endpoint = "${Url.base}/item";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<ItemModel> itens = ItemModel.fromList(list);

      return ApiResult<List<ItemModel>>(data: itens);
    } else {
      String message = response['error'] ??
          "Não foi possível buscar as categorias. Tente novamente!";
      return ApiResult<List<ItemModel>>(message: message, isError: true);
    }
  }

  Future<ItemModel> getById(String token, int id) async {
    ItemModel model = ItemModel();
    String endpoint = "${Url.base}/categories/$id";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      model = ItemModel.fromJson(response['data']);
    }

    return model;
  }
}
