import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/login_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/register_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class RegisterController extends GetxController {
  final TextEditingController fullNameTEC = TextEditingController(text: ''),
      userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: ''),
      rePasswordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  final RegisterUseCase registerUseCase;

  RegisterController({required this.registerUseCase});
  Future<void> registerUser() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      final fullName = fullNameTEC.text;
      final userName = userNameTEC.text;
      final password = passwordTEC.text;

      final registerParams = RegisterParams(
          fullName: fullName, login: userName, password: password);
      await registerUseCase(params: registerParams);
      final loginController = Get.find<LoginController>();

      final params = LoginParams(login: userName, password: password);
      loginController.login(params: params);
      Get.offAllNamed(Routes.welcomePage);
      clearTEC();
    }
  }

  void clearTEC() {
    fullNameTEC.clear();
    userNameTEC.clear();
    passwordTEC.clear();
    rePasswordTEC.clear();
  }

  @override
  void onClose() {
    formKey.currentState?.dispose();
    fullNameTEC.dispose();
    userNameTEC.dispose();
    passwordTEC.dispose();
    rePasswordTEC.dispose();

    super.onClose();
  }
}
