import '../../domin/usecases/is_online_usecase.dart';

import '../../../../core/src/routes.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/delete_cache_user_usecase.dart';
import '../../domin/usecases/get_cache_user_usecase.dart';
import 'package:flutter/widgets.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:flutter/material.dart'
    show Colors, FormState, GlobalKey, TextEditingController;
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;
  final GetCacheUserUseCase getCacheUserUseCase;
  final LogOutUserUseCase logOutUserUseCase;
  final IsOnlineUseCase isOnlineUseCase;
  RxBool _loadingIndicator = false.obs;

  LoginController(
      {required this.loginUseCase,
      required this.getCacheUserUseCase,
      required this.logOutUserUseCase,
      required this.isOnlineUseCase});

  get getLoadingIndicator => _loadingIndicator.value;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<bool> get isOnline async => isOnlineUseCase(params: NoParams());
  Future<void> autoLogin() async {
    if (await isOnline) {
      final cacheUser = await getCacheUserUseCase(params: NoParams());
      if (cacheUser != null) {
        final login = cacheUser.login ?? '';
        final password = cacheUser.password ?? '';
        final params = LoginParams(login: login, password: password);
        final user = await loginUseCase(params: params);
        if (user != null) {
          Get.offNamed(Routes.channelsPage);
        }
      }
    } else {
      Get.toNamed(Routes.offlinePage);
    }
  }

  Future<void> logout() async {
    if (await isOnline) {
      final isLogout = await logOutUserUseCase(params: NoParams());
      if (isLogout) {
        Get.offAllNamed(Routes.loginPage);
      }
    } else {
      Get.toNamed(Routes.offlinePage);
    }
  }

  Future<void> login() async {
    final isOnline = await isOnlineUseCase(params: NoParams());
    if (isOnline) {
      final isValid = formKey.currentState?.validate() ?? false;
      if (isValid) {
        _loadingIndicator.value = true;
        final userName = userNameTEC.text;
        final password = passwordTEC.text;
        final params = LoginParams(login: userName, password: password);
        try {
          await loginUseCase(params: params);
          _clearTEC();
          Get.offNamed(Routes.channelsPage);
          _loadingIndicator.value = false;
        } catch (e) {
          Get.snackbar('Exception:', '${e.toString()}',
              colorText: Colors.black);
          _loadingIndicator.value = false;
        }
      }
    } else {
      Get.toNamed(Routes.offlinePage);
    }
  }

  void _clearTEC() {
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
