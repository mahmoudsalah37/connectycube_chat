import 'package:connectycube_chat/features/chat/domin/usecases/send_string_message_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController({required this.sendStringMessageUseCase});
  final SendStringMessageUseCase sendStringMessageUseCase;
  final TextEditingController messageTEC = TextEditingController(text: '');
  bool textFieldIsEmpty = true;
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

  @override
  void onClose() {
    messageTEC.dispose();
    super.onClose();
  }
}
