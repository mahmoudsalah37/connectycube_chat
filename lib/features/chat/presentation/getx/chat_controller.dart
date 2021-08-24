import 'dart:io';

import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_dialog_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_message_history_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_image_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/send_string_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_stream_message_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/upload_file_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  ChatController({
    required this.sendStringMessageUseCase,
    required this.sendImageMessageUseCase,
    required this.getStreamMessagesUseCase,
    required this.getDialogUseCase,
    required this.uploadFileUseCase,
    required this.getMessageHistoryUseCase,
  });

  final SendStringMessageUseCase sendStringMessageUseCase;
  final GetStreamMessagesUseCase getStreamMessagesUseCase;
  final GetDialogUseCase getDialogUseCase;
  final SendImageMessageUseCase sendImageMessageUseCase;
  final UploadFileUseCase uploadFileUseCase;
  final GetMessageHistoryUseCase getMessageHistoryUseCase;

  final TextEditingController messageTEC = TextEditingController(text: '');
  final RxBool textFieldIsEmpty = true.obs;
  final List<CubeMessage> _messages = <CubeMessage>[].obs;
  late File imageFile;

  @override
  void onInit() async {
    _getStreamMessages();
    getMessageHistory();
    super.onInit();
  }

  set setTextFieldIsEmpty(RxBool textFieldIsEmpty) =>
      this.textFieldIsEmpty.value = textFieldIsEmpty.value;

  bool get getTextFieldIsEmpty => textFieldIsEmpty.value;

  Future<CubeMessage> sendStringMessage() async {
    final message = messageTEC.text.trim();
    if (message.isNotEmpty) {
      final cubeMessage = await sendStringMessageUseCase(
        params: StringMessageParam(message: message),
      );
      messageTEC.clear();
      _addMessageToList(cubeMessage);
      setTextFieldIsEmpty = true.obs;
      return cubeMessage;
    } else {
      Get.snackbar('Please Enter Message', '', colorText: Colors.black);
      return CubeMessage();
    }
  }

  CubeDialog get _getDialog => getDialogUseCase(params: NoParams());

  List<CubeMessage> get getMessagesList => _messages.obs;

  void getStringMessage(CubeMessage message) {
    if (message.dialogId == _getDialog.dialogId) {
      _addMessageToList(message);
    }
  }

  Future<void> sendImageMessage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    imageFile = File(pickedFile.path);
    final imageMessage = await sendImageMessageUseCase(
      params: ImageMessageParam(image: imageFile),
    );
    _addMessageToList(imageMessage);
    print('dateSent = ${imageMessage.dateSent}');
  }

  Stream<CubeMessage>? _getStreamMessages() {
    final streamMessages = getStreamMessagesUseCase(params: NoParams());
    streamMessages?.listen((message) {
      getStringMessage(message);
    });

    return streamMessages;
  }

  void _addMessageToList(CubeMessage message) {
    int existMessageIndex = _messages.indexWhere(
      (cubeMessage) {
        return cubeMessage.messageId == message.messageId;
      },
    );
    if (existMessageIndex != -1) {
      _messages
          .replaceRange(existMessageIndex, existMessageIndex + 1, [message]);
    } else {
      _messages.insert(0, message);
    }
    message.saveToHistory = true;
  }

  Future<List<CubeMessage>> getMessageHistory() async {
    String dialogId = getDialogUseCase.chatRepository.getDialog.dialogId ?? '';
    final paginatedCubeMsg = await getMessageHistoryUseCase.chatRepository
        .getMessageHistory(dialogId);
    final cubeMessageList = await paginatedCubeMsg!.items;
    cubeMessageList.forEach((msg) {
      msg.attachments!.forEach((attach) {
        attach.url;
      });
    });
    _messages.addAll(cubeMessageList);
    return cubeMessageList;
  }

  @override
  void onClose() {
    messageTEC.dispose();
    super.onClose();
  }
}
