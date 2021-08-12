import '../../domin/usecases/login_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class UserRemoteDataSource {
  Future<CubeUser?> login(LoginParams params);
  Future<CubeUser?> newSession(LoginParams params);
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  @override
  Future<CubeUser?> login(LoginParams params) async {
    CubeUser? user = await newSession(params);
    if (user != null) {
      CubeChatConnectionSettings.instance.totalReconnections = 0;
      user = await CubeChatConnection.instance.login(user);
    }
    return user;
  }

  @override
  Future<CubeUser?> newSession(LoginParams params) async {
    CubeUser? cubeUser =
        CubeUser(login: params.login, password: params.password);
    final cubeSession = await createSession(
        CubeUser(login: params.login, password: params.password));
    return cubeUser = cubeSession.user?..password = cubeUser.password;
  }
}
