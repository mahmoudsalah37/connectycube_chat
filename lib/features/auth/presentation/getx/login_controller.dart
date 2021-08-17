import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/delete_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/widgets.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:flutter/material.dart'
    show BuildContext, FormState, GlobalKey, TextEditingController;
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<CubeUser?> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  // final AuthRepositoryImp authRepositoryImp;
  final LoginUseCase loginUseCase;
  final GetCacheUserUseCase getCacheUserUseCase;
  final LogOutUserUseCase logOutUserUseCase;

  LoginController({
    required this.loginUseCase,
    required this.getCacheUserUseCase,
    required this.logOutUserUseCase,
  });

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    // await autoLogin();
  }

  Future<CubeUser?> autoLogin() async {
    final cacheUser = await getCacheUserUseCase(params: NoParams());
    if (cacheUser != null) {
      final login = cacheUser.login ?? '';
      final password = cacheUser.password ?? '';
      final params = LoginParams(login: login, password: password);
      final user = await loginUseCase(params: params);
      if (user != null) {
        Get.offNamed(Routes.channelsPage);
        return user;
      }
    }
  }

  Future<void> logout() async {
    final isLogout = await logOutUserUseCase(params: NoParams());
    if (isLogout) {
      Get.offAllNamed(Routes.loginPage);
    }
  }

  void login({required LoginParams params}) async {
    change(null, status: RxStatus.loading());
    
    try {
      final user = await loginUseCase(params: params);
      change(user, status: RxStatus.success());
      clearTEC();
      Get.offNamed(Routes.channelsPage);
    } catch (e) {
      Get.snackbar('home', '${e.toString()}');
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void clearTEC() {
    userNameTEC.clear();
    passwordTEC.clear();
  }

  @override
  void onClose() {
    formKey.currentState?.dispose();
    userNameTEC.dispose();
    passwordTEC.dispose();
    super.onClose();
  }
}
