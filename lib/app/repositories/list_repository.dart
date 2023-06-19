import 'package:my_list/app/core/utils/api_result.dart';
import 'package:my_list/app/models/item_model.dart';
import 'package:my_list/app/models/lista_model.dart';

import '../core/services/http_manager.dart';
import '../core/utils/urls.dart';

class ListRepository {
  HttpManager httpManager;

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

  Future<ApiResult<ListModel>> createList(
      {required String token, required int userId, required name}) async {
    ListModel model = ListModel();
    String endpoint = "${Url.base}/lista";

    final response = await httpManager
        .request(url: endpoint, method: HttpMethods.post, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'name': name,
      'user_id': userId,
    });

    if (response['data'] != null) {
      ListModel itens = ListModel.fromMap(response['data']);

      return ApiResult<ListModel>(data: itens);
    } else {
      String message = response['error'] ?? "Criar lista Tente novamente!";
      return ApiResult<ListModel>(message: message, isError: true);
    }
  }
}
