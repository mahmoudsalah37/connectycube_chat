import 'dart:io';

import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/update_user_data_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      fullNameTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  late String avatarUrl;

  File? pickedImgFile;
  UpdateUserDataUseCase updateUserDataUseCase;
  GetCacheUserUseCase getCacheUserUseCase;

  ProfileController({
    required this.updateUserDataUseCase,
    required this.getCacheUserUseCase,
  });

  @override
  void onInit() async {
    avatarUrl = getCacheUserUseCase.authRepository.getCacheUser()!.avatar ?? '';

    final cachedUser = getCacheUserUseCase.authRepository.getCacheUser();
    if (cachedUser != null) {
      fullNameTEC.text = cachedUser.fullName!;
      userNameTEC.text = cachedUser.login!;
    }
    super.onInit();
  }

  void updateUserData() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      try {
        final params = UpdateUserDataParams(
          fullName: fullNameTEC.text,
          userName: userNameTEC.text,
          avatar: avatarUrl,
        );
        await updateUserDataUseCase.call(params: params);
        print('User updated');
        Get.back();
      } catch (e) {
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

  @override
  void onClose() {
    formKey.currentState?.dispose();
    fullNameTEC.dispose();
    userNameTEC.dispose();
    super.onClose();
  }
}
