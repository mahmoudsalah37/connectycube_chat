import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:connectycube_sdk/src/core/users/models/cube_user.dart';

import '../../../../core/network/network_information.dart';
import '../../domin/repositories/auth_repository.dart';

import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInformation networkInformation;

  AuthRepositoryImp(
      {required this.userLocalDataSource,
      required this.userRemoteDataSource,
      required this.networkInformation});

  @override
  Future<CubeUser?> login(
      {required String login, required String password}) async {
    final user =
        await userRemoteDataSource.login(login: login, password: password);

    if (user != null) {
      await userLocalDataSource.saveUser(user);
    }
    return user;
  }

  @override
  Future<CubeUser> register(
      {required String fullName,
      required String login,
      required String password}) async {
    final user = await userRemoteDataSource.register(
        fullName: fullName, login: login, password: password);
    await userLocalDataSource.saveUser(user);
    return user;
  }

  @override
  CubeUser getCacheUser() {
    return userLocalDataSource.getCacheUser();
  }

  @override
  Future<bool> logoutUser() async {
    final isdeleted = await userLocalDataSource.deleteUser();
    await signOut().whenComplete(() {
      CubeChatConnection.instance.destroy();
    });
    return isdeleted;
  }

  @override
  Future<CubeUser> updateUserData(
      {required String fullName,
      required String login,
      required String avatar}) async {
    final cacheUser = getCacheUser();
    final user = await userRemoteDataSource.updateUserData(
        id: cacheUser.id, fullName: fullName, login: login, avatar: avatar);
    await userLocalDataSource.saveUser(user);
    return user;
  }

  @override
  Future<bool> isOnline() => networkInformation.isConnected;
}
