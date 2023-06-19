import '../core/services/http_manager.dart';
import '../models/user_model.dart';

class ProfileRepository {
  final HttpManager httpManager;

  ProfileRepository({
    required this.httpManager,
  });

  Future<List<UserModel>> getAll() async {
    final response = await httpManager.request(
      url: "https://Catalog.appke.com.br/api/users",
      method: HttpMethods.get,
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<UserModel> userList = UserModel.fromList(list);

      return userList;
    } else {
      return [];
    }
  }
}
