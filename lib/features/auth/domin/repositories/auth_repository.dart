import 'package:connectycube_chat/features/auth/domin/usecases/login.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/register.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class AuthRepository {
  Future<CubeUser?> login(LoginParams params);
  Future<CubeUser?> register(RegisterParams params);
}
