import 'package:my_list/app/models/item_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';

class ItemRepository {
  HttpManager httpManager;

  ItemRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<ItemModel>>> getAll(String token, int id) async {
    String endpoint = "${Url.base}/$id/itens";
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

  Future<ApiResult<ItemModel>> createItem(
      {required String token,
      required int lista_id,
      required name,
      required int quantidade,
      required num preco}) async {
    String endpoint = "${Url.base}/item";

    final response = await httpManager
        .request(url: endpoint, method: HttpMethods.post, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'name': name,
      'lista_id': lista_id,
      'quantidade': quantidade,
      'preco': preco,
    });

    if (response['data'] != null) {
      ItemModel itens = ItemModel.fromMap(response['data']);
      return ApiResult<ItemModel>(data: itens);
    } else {
      String message = response['error'] ?? "Criar lista Tente novamente!";
      return ApiResult<ItemModel>(message: message, isError: true);
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
