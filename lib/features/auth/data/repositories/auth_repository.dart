import 'package:connectycube_sdk/connectycube_sdk.dart';

import '../../../../core/network/network_information.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_remote_data_source.dart';
import '../../domin/repositories/auth_repository.dart';
import 'package:connectycube_sdk/src/core/users/models/cube_user.dart';
import '../../domin/usecases/register_usecase.dart';
import '../../domin/usecases/login_usecase.dart';

class AuthRepositoryImp implements AuthRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkInformation networkInformation;

  AuthRepositoryImp(
      {required this.userLocalDataSource,
      required this.userRemoteDataSource,
      required this.networkInformation});
  @override
  Future<CubeUser?> login(LoginParams params) async {
    final user = await userRemoteDataSource.login(params);
    if (user != null) await userLocalDataSource.saveUser(user);
    return user;
  }

  @override
  Future<CubeUser?> register(RegisterParams params) async {
    final user = await userRemoteDataSource.register(params);
    final isCached = await userLocalDataSource.saveUser(user);
    return isCached ? user : null;
  }

  @override
  CubeUser? getCacheUser() {
    return userLocalDataSource.getUser();
  }

  @override
  Future<bool> logoutUser() async {
    final isdeleted = await userLocalDataSource.deleteUser();
    await signOut().whenComplete(() {
      CubeChatConnection.instance.destroy();
    });
    return isdeleted;
  }
}
