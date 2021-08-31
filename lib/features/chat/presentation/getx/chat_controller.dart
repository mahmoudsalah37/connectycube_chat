import 'dart:io';

import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/domin/usecases/get_cache_user_usecase.dart';
import '../../domin/usecases/get_dialog_use_case.dart';
import '../../domin/usecases/get_message_history_use_case.dart';
import '../../domin/usecases/get_stream_message_use_case.dart';
import '../../domin/usecases/send_image_message_use_case.dart';
import '../../domin/usecases/send_string_message_use_case.dart';
import '../../domin/usecases/upload_file_use_case.dart';
import 'voice_record_controller.dart';

class ChatController extends GetxController
    with StateMixin<List<CubeMessage>?> {
  ChatController({
    required this.sendStringMessageUseCase,
    required this.sendImageMessageUseCase,
    required this.getStreamMessagesUseCase,
    required this.getDialogUseCase,
    required this.uploadFileUseCase,
    required this.getMessageHistoryUseCase,
    required this.getCacheUserUseCase,
  });

  final SendStringMessageUseCase sendStringMessageUseCase;
  final GetStreamMessagesUseCase getStreamMessagesUseCase;
  final GetDialogUseCase getDialogUseCase;
  final SendImageMessageUseCase sendImageMessageUseCase;
  final UploadFileUseCase uploadFileUseCase;
  final GetMessageHistoryUseCase getMessageHistoryUseCase;
  final GetCacheUserUseCase getCacheUserUseCase;
  final List<CubeMessage> _messages = <CubeMessage>[].obs;
  late File imageFile;

  @override
  void onInit() {
    _getMessageHistory();
    _recieveStreamMessages();
    super.onInit();
  }

  List<CubeMessage> get getMessageList => _messages;

  bool senderMessageIsMe(int index) {
    final senderIsMe = _messages.elementAt(index).senderId ==
            getCacheUserUseCase.authRepository.getCacheUser().id
        ? true
        : false;
    return senderIsMe;
  }

  Future<CubeMessage?> sendStringMessage(String message) async {
    if (message.isNotEmpty) {
      final cubeMessage = await sendStringMessageUseCase(
        params: StringMessageParam(message: message),
      );
      change(addMessageToList(cubeMessage), status: RxStatus.success());
      return cubeMessage;
    }
  }

  void _recieveStreamMessages() {
    final streamMessages = getStreamMessagesUseCase(params: NoParams());
    streamMessages?.listen((message) {
      change(addMessageToList(message), status: RxStatus.success());
    });
  }

  List<CubeMessage> addMessageToList(CubeMessage message) {
    _messages.insert(0, message);
    return _messages;
  }

  Future<List<CubeMessage>> _getMessageHistory() async {
    change(null, status: RxStatus.loading());
    final paginatedCubeMsg =
        await getMessageHistoryUseCase.chatRepository.getMessageHistory();
    final cubeMessageList = await paginatedCubeMsg?.items ?? [];
    _messages.addAll(cubeMessageList);
    _messages.isEmpty
        ? change(_messages, status: RxStatus.empty())
        : change(_messages, status: RxStatus.success());
    return cubeMessageList;
  }

  Future<void> sendImageMessage() async {
    final pickedImage = await _pathOfPickedImage();
    if (pickedImage != null) {
      change(null, status: RxStatus.loading());
      final imageMessage = await sendImageMessageUseCase(
        params: ImageMessageParam(path: pickedImage),
      );
      change(addMessageToList(imageMessage), status: RxStatus.success());
    }
  }

  Future<String?> _pathOfPickedImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    final path = pickedFile.path;
    return path;
  }

  void sendVoiceMessage() async {
    final voiceRecordController = Get.find<VoiceRecordController>();
    final path = await voiceRecordController.stopRecord();
    await voiceRecordController.disposeRecord();
    final voiceRecordMessage =
        await voiceRecordController.sendVoiceRecord(path);
    change(addMessageToList(voiceRecordMessage), status: RxStatus.success());
    Get.back();
  }
}
