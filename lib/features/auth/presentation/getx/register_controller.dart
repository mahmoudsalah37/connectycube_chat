import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/is_online_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/src/routes.dart';
import '../../domin/usecases/login_usecase.dart';
import '../../domin/usecases/register_usecase.dart';

class RegisterController extends GetxController {
  final TextEditingController fullNameTEC = TextEditingController(text: ''),
      userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: ''),
      rePasswordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final IsOnlineUseCase isOnlineUseCase;
  RxBool _loadingIndicator = false.obs;

  RegisterController(
      {required this.registerUseCase,
      required this.loginUseCase,
      required this.isOnlineUseCase});
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> get isOnline async => isOnlineUseCase(params: NoParams());

  get getLoadingIndicator => _loadingIndicator.value;

  Future<void> registerUser() async {
    if (await isOnline) {
      final isValid = formKey.currentState?.validate() ?? false;
      if (isValid) {
        try {
          _loadingIndicator.value = true;
          final fullName = fullNameTEC.text;
          final userName = userNameTEC.text;
          final password = passwordTEC.text;

          final registerParams = RegisterParams(
              fullName: fullName, login: userName, password: password);
          await registerUseCase(params: registerParams);
          await _login(userName, password);
          _clearTEC();
          _loadingIndicator.value = false;
        } catch (e) {
          _loadingIndicator.value = false;
          Get.snackbar('Error:', 'Something went wrong.');
        }
      }
    } else {
      Get.toNamed(Routes.offlinePage);
    }
  }

  Future<void> _login(String userName, String password) async {
    final params = LoginParams(login: userName, password: password);
    await loginUseCase(params: params);
    Get.offAllNamed(Routes.welcomePage);
  }

  void _clearTEC() {
    fullNameTEC.clear();
    userNameTEC.clear();
    passwordTEC.clear();
    rePasswordTEC.clear();
  }

  @override
  void onClose() {
    // formKey.currentState?.dispose();
    fullNameTEC.dispose();
    userNameTEC.dispose();
    passwordTEC.dispose();
    rePasswordTEC.dispose();

    super.onClose();
  }
}
