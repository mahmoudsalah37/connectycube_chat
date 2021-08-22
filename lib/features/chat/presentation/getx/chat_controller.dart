import 'dart:io';

import 'package:connectycube_chat/features/chat/domin/usecases/send_image_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_string_message_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  ChatController({
    required this.sendImageMessageUseCase,
    required this.sendStringMessageUseCase,
  });

  final SendStringMessageUseCase sendStringMessageUseCase;
  final SendImageMessageUseCase sendImageMessageUseCase;
  final TextEditingController messageTEC = TextEditingController(text: '');
  bool textFieldIsEmpty = true;
  late File imageFile;

  set setTextFieldIsEmpty(bool textFieldIsEmpty) {
    this.textFieldIsEmpty = textFieldIsEmpty;
    update();
  }

  bool get getTextFieldIsEmpty => textFieldIsEmpty;

  Future<CubeMessage> sendStringMessage() async {
    final message = messageTEC.text.trim();
    final cubeMessage = await sendStringMessageUseCase(
        params: StringMessageParam(message: message));
    messageTEC.clear();
    return cubeMessage;
  }

  Future<void> openGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    imageFile = File(pickedFile.path);
    final imageMessage = await sendImageMessageUseCase(
      params: ImageMessageParam(image: imageFile),
    );
    print('dateSent = ${imageMessage.dateSent}');
  }

  @override
  void onClose() {
    messageTEC.dispose();
    super.onClose();
  }
}
