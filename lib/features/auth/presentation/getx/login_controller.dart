import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/delete_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/widgets.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        FormState,
        GlobalKey,
        ScaffoldMessenger,
        SnackBar,
        Text,
        TextEditingController;
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<CubeUser?> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  // final AuthRepositoryImp authRepositoryImp;
  final LoginUseCase loginUseCase;
  final GetCacheUserUseCase getUserAuthUseCase;
  final LogOutUserUseCase logOutUserUseCase;
  LoginController(
      {required this.loginUseCase,
      required this.getUserAuthUseCase,
      required this.logOutUserUseCase});
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
    // await autoLogin();
  }

  Future<void> autoLogin() async {
    final cacheUser = await getUserAuthUseCase(params: NoParams());
    if (cacheUser != null) {
      final login = cacheUser.login ?? '';
      final password = cacheUser.password ?? '';
      final params = LoginParams(login: login, password: password);
      await loginUseCase(params: params);
      Get.toNamed(Routes.homePage);
    }
  }

  Future<void> logout(BuildContext context) async {
    final isLogout = await logOutUserUseCase(params: NoParams());
    if (isLogout) {
      Navigator.of(context).popUntil(ModalRoute.withName(Routes.loginPage));
    }
  }

  void login(BuildContext context) async {
    change(null, status: RxStatus.loading());
    final login = userNameTEC.text;
    final password = passwordTEC.text;
    final params = LoginParams(login: login, password: password);
    try {
      final user = await loginUseCase(params: params);
      change(user, status: RxStatus.success());
      Get.toNamed(Routes.homePage);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${e.toString()}')));
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onClose() {
    formKey.currentState?.dispose();
    super.onClose();
  }
}
