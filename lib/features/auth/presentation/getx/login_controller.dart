import 'package:connectycube_chat/core/src/colors.dart';

import '../../../../core/src/routes.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/delete_cache_user_usecase.dart';
import '../../domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/widgets.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<CubeUser?> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;
  final GetCacheUserUseCase getCacheUserUseCase;
  final LogOutUserUseCase logOutUserUseCase;
  var _loadingIndicator = false.obs;

  LoginController({
    required this.loginUseCase,
    required this.getCacheUserUseCase,
    required this.logOutUserUseCase,
  });

  get getLoadingIndicator => _loadingIndicator.value;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
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

  Future<void> login2() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      _loadingIndicator.value = true;
      final userName = userNameTEC.text;
      final password = passwordTEC.text;
      final params = LoginParams(login: userName, password: password);
      await login(params: params);
    }
  }

  Future<void> login({required LoginParams params}) async {
    change(null, status: RxStatus.loading());
    try {
      final user = await loginUseCase(params: params);
      change(user, status: RxStatus.success());
      clearTEC();
      Get.offNamed(Routes.channelsPage);
      _loadingIndicator.value = false;
    } catch (e) {
      Get.snackbar('home', '${e}', colorText: CustomColors.accentColor);
      print(e);
      _loadingIndicator.value = false;
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
