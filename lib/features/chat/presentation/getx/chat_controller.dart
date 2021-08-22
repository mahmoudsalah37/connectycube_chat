import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_dialog_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_string_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_stream_message_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController(
      {required this.sendStringMessageUseCase,
      required this.getStreamMessagesUseCase,
      required this.getDialogUseCase});
  final SendStringMessageUseCase sendStringMessageUseCase;
  final GetStreamMessagesUseCase getStreamMessagesUseCase;
  final GetDialogUseCase getDialogUseCase;
  final TextEditingController messageTEC = TextEditingController(text: '');
  bool textFieldIsEmpty = true;
  List<CubeMessage> _messages = <CubeMessage>[];
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
    return cubeMessage;
  }

  CubeDialog get _getDialog => getDialogUseCase(params: NoParams());
  void getStringMessage(CubeMessage message) {
    if (message.dialogId == _getDialog.dialogId) {
      _messages.add(message);
    }
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
