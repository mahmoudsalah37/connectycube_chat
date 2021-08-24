import 'dart:io';

import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/get_dialog_use_case.dart';
import '../../domin/usecases/get_message_history_use_case.dart';
import '../../domin/usecases/send_image_message_use_case.dart';
import '../../domin/usecases/send_string_message_use_case.dart';
import '../../domin/usecases/get_stream_message_use_case.dart';
import '../../domin/usecases/upload_file_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
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

  final List<CubeMessage> _messages = <CubeMessage>[].obs;
  late File imageFile;

  @override
  void onInit() async {
    _recieveStreamMessages();
    _getMessageHistory();
    super.onInit();
  }

  Future<CubeMessage?> sendStringMessage(String message) async {
    if (message.isNotEmpty) {
      final cubeMessage = await sendStringMessageUseCase(
        params: StringMessageParam(message: message),
      );
      addMessageToList(cubeMessage);
      return cubeMessage;
    }
  }

  List<CubeMessage> get getMessagesList => _messages.obs;

  void _recieveMessage(CubeMessage message) {
    addMessageToList(message);
  }

  Future<void> sendImageMessage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    final path = pickedFile.path;
    final imageMessage = await sendImageMessageUseCase(
      params: ImageMessageParam(path: path),
    );
    addMessageToList(imageMessage);
    print('dateSent = ${imageMessage.dateSent}');
  }

  void _recieveStreamMessages() {
    final streamMessages = getStreamMessagesUseCase(params: NoParams());
    streamMessages?.listen((message) {
      _recieveMessage(message);
    });
  }

  void addMessageToList(CubeMessage message) {
    _messages.insert(0, message);
  }

  Future<List<CubeMessage>> _getMessageHistory() async {
    final paginatedCubeMsg =
        await getMessageHistoryUseCase.chatRepository.getMessageHistory();
    final cubeMessageList = await paginatedCubeMsg?.items ?? [];
    _messages.addAll(cubeMessageList);
    return cubeMessageList;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
