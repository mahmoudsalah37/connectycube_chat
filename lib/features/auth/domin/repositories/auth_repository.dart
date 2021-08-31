import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class AuthRepository {
  Future<CubeUser?> login({required String login, required String password});
  Future<CubeUser> register(
      {required String fullName,
      required String login,
      required String password});

  Future<CubeUser> updateUserData(
      {required String fullName,
      required String login,
      required String avatar});
  CubeUser getCacheUser();
  Future<bool> logoutUser();
  Future<bool> isOnline();
}
