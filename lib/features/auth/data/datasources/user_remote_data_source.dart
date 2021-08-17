import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/core/utils/injection_container.dart';
import 'package:connectycube_chat/features/auth/data/datasources/user_local_data_source.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/register_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/update_user_data_usecase.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class UserRemoteDataSource {
  Future<CubeUser?> login(LoginParams params);

  Future<CubeUser?> newSession(LoginParams params);

  Future<CubeUser> register(RegisterParams params);

  Future<CubeUser> updateUserData(UpdateUserDataParams params);
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

  @override
  Future<CubeUser> register(RegisterParams params) async {
    if (!CubeSessionManager.instance.isActiveSessionValid()) {
      try {
        await createSession();
      } catch (error) {
        print('registerError>>> $error');
      }
    } else {
      print('Active session not valid');
    }
    final user = CubeUser(
      fullName: params.fullName,
      login: params.login,
      password: params.password,
    );

    final data = await signUp(user);
    user.id = data.id;
    return user;
  }

  @override
  Future<CubeUser> updateUserData(UpdateUserDataParams params) async {
    final userCachedData = Injection.sl<UserLocalDataSource>();
    final user = CubeUser(
      id: userCachedData.getUser()?.id,
      login: params.userName,
      fullName: params.fullName,
      avatar: params.avatar,
    );
    try {
      await updateUser(user);
    } catch (e) {
      print('updateUserError = $e');
    }
    return user;
  }
}
