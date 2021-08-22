import 'dart:convert';

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  CubeUser? getCacheUser();
  Future<bool> saveUser(CubeUser user);
  Future<bool> deleteUser();
}

const CacheUser = 'CacheUser';

class UserLocalDataSourceImp implements UserLocalDataSource {
  const UserLocalDataSourceImp({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  CubeUser? getCacheUser() {
    final jsonString = sharedPreferences.getString(CacheUser);

    if (jsonString != null) {
      return CubeUser.fromJson(json.decode(jsonString));
    }
  }

  @override
  Future<bool> saveUser(CubeUser user) {
    final userJson = json.encode(user.toJson());
    return sharedPreferences.setString(CacheUser, userJson);
  }

  @override
  Future<bool> deleteUser() async {
    return await sharedPreferences.remove(CacheUser);
  }
}
