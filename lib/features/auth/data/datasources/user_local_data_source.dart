import 'package:connectycube_chat/core/utils/pref_util.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<CubeUser> getUser();
}

const CacheUser = 'CacheUser';

class UserLocalDataSourceImp implements UserLocalDataSource {
  const UserLocalDataSourceImp({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<CubeUser> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
