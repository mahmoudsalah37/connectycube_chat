import 'package:connectycube_sdk/connectycube_sdk.dart';

import '../../domin/usecases/login_usecase.dart';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<CubeUser?> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  // final AuthRepositoryImp authRepositoryImp;
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});
  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  void login() async {
    change(null, status: RxStatus.loading());
    final login = userNameTEC.text;
    final password = passwordTEC.text;
    final params = LoginParams(login: login, password: password);
    try {
      final user = await loginUseCase(params: params);
      change(user, status: RxStatus.success());
    } catch (e) {
      RxStatus.error(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
