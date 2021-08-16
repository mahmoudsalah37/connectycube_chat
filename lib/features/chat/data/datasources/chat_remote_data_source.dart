import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeUser, PagedResult, getAllUsers;

abstract class ChatRemoteDataSource {
  Future<PagedResult<CubeUser>?> getUsers();
}

class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
  const ChatRemoteDataSourceImp();
  @override
  Future<PagedResult<CubeUser>?> getUsers() => getAllUsers();
}
