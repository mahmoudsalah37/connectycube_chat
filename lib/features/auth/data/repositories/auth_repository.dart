import 'package:connectycube_chat/core/network/network_information.dart';
import 'package:connectycube_chat/features/auth/data/datasources/user_local_data_source.dart';
import 'package:connectycube_chat/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:connectycube_chat/features/auth/domin/repositories/auth_repository.dart';
import 'package:connectycube_sdk/src/core/users/models/cube_user.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/register.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/login.dart';

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
    return userRemoteDataSource.login(params);
  }

  @override
  Future<CubeUser?> register(RegisterParams params) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
