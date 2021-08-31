import 'dart:io';

import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domin/usecases/get_cache_user_usecase.dart';
import '../../domin/usecases/update_user_data_usecase.dart';

class ProfileController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      fullNameTEC = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  final avatarUrl = ''.obs;

  var _loadingIndicator = false.obs;

  File? pickedImgFile;
  UpdateUserDataUseCase updateUserDataUseCase;
  GetCacheUserUseCase getCacheUserUseCase;

  ProfileController({
    required this.updateUserDataUseCase,
    required this.getCacheUserUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    avatarUrl.value = getCacheUser.avatar ?? '';
    fullNameTEC.text = getCacheUser.fullName ?? '';
    userNameTEC.text = getCacheUser.login ?? '';
  }

  get getLoadingIndicator => _loadingIndicator.value;

  CubeUser get getCacheUser => getCacheUserUseCase(params: NoParams());
  void updateUserData() async {
    _loadingIndicator.value = true;
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      try {
        final params = UpdateUserDataParams(
          fullName: fullNameTEC.text,
          userName: userNameTEC.text,
          avatar: avatarUrl.value,
        );
        await updateUserDataUseCase.call(params: params);
        print('User updated');
        _loadingIndicator.value = false;
        Get.back();
      } catch (e) {
        Get.snackbar('error', '$e', colorText: Colors.black);
        _loadingIndicator.value = false;
      }
    }
  }

  Future<void> pickImg() async {
    final pickedImage = await _pathOfPickedImage();
    if (pickedImage != null) {
      pickedImgFile = File(pickedImage);
      uploadFile(pickedImgFile!, isPublic: true).then((cubeFile) {
        avatarUrl.value = cubeFile.getPublicUrl()!;
      });
    }
    update();
  }

  Future<String?> _pathOfPickedImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    final path = pickedFile.path;
    return path;
  }

  @override
  void onClose() {
    // formKey.currentState?.dispose();
    fullNameTEC.dispose();
    userNameTEC.dispose();
    super.onClose();
  }
}
