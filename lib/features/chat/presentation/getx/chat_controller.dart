import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageTEC = TextEditingController(text: '');
  bool textFieldIsEmpty = true;

  set setTextFieldIsEmpty(bool textFieldIsEmpty) {
    this.textFieldIsEmpty = textFieldIsEmpty;
    update();
  }

  bool get getTextFieldIsEmpty => textFieldIsEmpty;

  @override
  void onClose() {
    messageTEC.dispose();
    super.onClose();
  }
}
