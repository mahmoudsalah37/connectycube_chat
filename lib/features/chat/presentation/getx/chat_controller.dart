import 'dart:io';

import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_dialog_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_image_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_string_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_stream_message_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  ChatController(
      {required this.sendStringMessageUseCase,
      required this.sendImageMessageUseCase,
      required this.getStreamMessagesUseCase,
      required this.getDialogUseCase});
  final SendStringMessageUseCase sendStringMessageUseCase;
  final GetStreamMessagesUseCase getStreamMessagesUseCase;
  final GetDialogUseCase getDialogUseCase;
  final SendImageMessageUseCase sendImageMessageUseCase;
  final TextEditingController messageTEC = TextEditingController(text: '');
  bool textFieldIsEmpty = true;
  List<CubeMessage> _messages = <CubeMessage>[];
  late File imageFile;
  @override
  void onInit() {
    super.onInit();
    _getStramMessages();
  }

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
    setTextFieldIsEmpty = true;
    return cubeMessage;
  }

  CubeDialog get _getDialog => getDialogUseCase(params: NoParams());
  void getStringMessage(CubeMessage message) {
    if (message.dialogId == _getDialog.dialogId) {
      _messages.add(message);
    }
  }

  Future<void> sendImageMessage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    imageFile = File(pickedFile.path);
    final imageMessage = await sendImageMessageUseCase(
      params: ImageMessageParam(image: imageFile),
    );
    print('dateSent = ${imageMessage.dateSent}');
  }

  void _getStramMessages() {
    final stramMessages = getStreamMessagesUseCase(params: NoParams());
    stramMessages?.listen((message) {
      getStringMessage(message);
    });
  }

  @override
  void onClose() {
    messageTEC.dispose();
    super.onClose();
  }
}
