import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeUser, PagedResult;

abstract class ChatRepository {
  Future<PagedResult<CubeUser>?> getUsers();
}
