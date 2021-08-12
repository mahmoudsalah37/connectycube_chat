import '../usecases/login_usecase.dart';
import '../usecases/register_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class AuthRepository {
  Future<CubeUser?> login(LoginParams params);
  Future<CubeUser?> register(RegisterParams params);
  CubeUser? getCacheUser();
  Future<bool> logoutUser();
}
