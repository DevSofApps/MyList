import 'package:my_list/app/core/utils/api_result.dart';
import 'package:my_list/app/models/item_model.dart';
import 'package:my_list/app/models/lista_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/urls.dart';

class ListRepository {
  HttpManager httpManager = HttpManager();

  ListRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<ListModel>>> getAll(
    String token,
  ) async {
    const String endpoint = "${Url.base}/listas";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<ListModel> itens = ListModel.fromList(list);

      return ApiResult<List<ListModel>>(data: itens);
    } else {
      String message =
          response['error'] ?? "Não foi possível fazer login. Tente novamente!";
      return ApiResult<List<ListModel>>(message: message, isError: true);
    }
  }

  Future<ItemModel> getById(String token, int id) async {
    ItemModel model = ItemModel();
    String endpoint = "${Url.base}/$id";

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
