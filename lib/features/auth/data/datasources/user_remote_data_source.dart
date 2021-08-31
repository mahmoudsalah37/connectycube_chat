import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';

abstract class UserRemoteDataSource {
  Future<CubeUser?> login({required String login, required String password});

  Future<CubeUser?> newSession(
      {required String login, required String password});

  Future<CubeUser> register(
      {required String fullName,
      required String login,
      required String password});

  Future<CubeUser> updateUserData(
      {required int? id,
      required String? fullName,
      required String? login,
      required String? avatar});
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  @override
  Future<CubeUser?> login(
      {required String login, required String password}) async {
    CubeUser? user = await newSession(login: login, password: password);
    if (user != null) {
      CubeChatConnectionSettings.instance.totalReconnections = 0;
      user = await CubeChatConnection.instance.login(user);
    }

    return user;
  }

  @override
  Future<CubeUser?> newSession(
      {required String login, required String password}) async {
    CubeUser? cubeUser = CubeUser(login: login, password: password);
    final cubeSession =
        await createSession(CubeUser(login: login, password: password));
    return cubeUser = (cubeSession.user?..password = cubeUser.password);
  }

  @override
  Future<CubeUser> register(
      {required String fullName,
      required String login,
      required String password}) async {
    if (isSessionNotActive()) {
      await createSession();
    }
    final user = CubeUser(
      fullName: fullName,
      login: login,
      password: password,
    );

    final data = await signUp(user);
    user.id = data.id;
    return user;
  }

  bool isSessionNotActive() =>
      !CubeSessionManager.instance.isActiveSessionValid();

  @override
  Future<CubeUser> updateUserData(
      {@required int? id,
      required String? fullName,
      required String? login,
      required String? avatar}) async {
    final user = CubeUser(
      id: id,
      login: login,
      fullName: fullName,
      avatar: avatar,
    );

    return updateUser(user);
  }
}
