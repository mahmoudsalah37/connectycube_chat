import 'dart:io';

import 'package:connectycube_chat/core/utils/injection_container.dart';
import 'package:connectycube_chat/features/auth/data/datasources/user_local_data_source.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/update_user_data_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      fullNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: ''),
      newPasswordTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  final userCachedData = Injection.sl<UserLocalDataSource>().getUser();
  String avatarUrl =
      Injection.sl<UserLocalDataSource>().getUser()!.avatar ?? '';
  File? pickedImgFile;
  bool loadingIndicator = false;
  UpdateUserDataUseCase updateUserDataUseCase;

  ProfileController({required this.updateUserDataUseCase});

  @override
  void onInit() async {
    fullNameTEC.text = userCachedData!.fullName!;
    userNameTEC.text = userCachedData!.login!;

    super.onInit();
  }

  void updateUserData() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      setLoadingIndicator = true;
      try {
        final params = UpdateUserDataParams(
          fullName: fullNameTEC.text,
          password: newPasswordTEC.text,
          userName: userNameTEC.text,
          avatar: avatarUrl,
        );
        await updateUserDataUseCase.call(params: params);
        print('User updated');
        Get.back();
        setLoadingIndicator = false;
      } catch (e) {
        setLoadingIndicator = false;
        Get.snackbar('error', '$e', colorText: Colors.black);
      }
    }
  }

  Future<void> pickImg() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    pickedImgFile = File(pickedFile.path);
    uploadFile(pickedImgFile!, isPublic: true).then((cubeFile) {
      avatarUrl = cubeFile.getPublicUrl()!;
    });
    print('avatarUrl = $avatarUrl');
    update();
  }

  String getFirstChar({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }

  set setLoadingIndicator(bool loading) {
    loadingIndicator = loading;
    update();
  }

  get getLoadingIndicator => loadingIndicator;

  @override
  void onClose() {
    formKey.currentState?.dispose();
    fullNameTEC.dispose();
    userNameTEC.dispose();
    passwordTEC.dispose();
    newPasswordTEC.dispose();
    super.onClose();
  }
}
