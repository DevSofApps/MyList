import 'package:my_list/app/core/utils/api_result.dart';
import 'package:my_list/app/models/item_model.dart';
import 'package:my_list/app/models/lista_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/urls.dart';

class ListaRepository {
  HttpManager httpManager = HttpManager();

  Future<ApiResult<List<ListaModel>>> getAll() async {
    const String endpoint = "${Url.base}/listas";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<ListaModel> itens = ListaModel.fromList(list);

      return ApiResult<List<ListaModel>>(data: itens);
    } else {
      String message =
          response['error'] ?? "Não foi possível fazer login. Tente novamente!";
      return ApiResult<List<ListaModel>>(message: message, isError: true);
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
