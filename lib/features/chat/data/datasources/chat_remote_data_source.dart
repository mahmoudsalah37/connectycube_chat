import 'dart:io';

import 'package:connectycube_chat/core/utils/injection_container.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/cupertino.dart';

abstract class ChatRemoteDataSource {
  Future<PagedResult<CubeUser>?> getUsers();

  Future<CubeDialog> createNewPrivateDialog(int id);

  Future<CubeMessage> sendMessage(String message);

  Future<CubeMessage> sendImage(File image);
}

class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
  ChatRemoteDataSourceImp();

  @override
  Future<PagedResult<CubeUser>?> getUsers() => getAllUsers();
  late CubeDialog dialog;

  @override
  Future<CubeDialog> createNewPrivateDialog(int id) async {
    final setDialog = CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [id]);
    dialog = await createDialog(setDialog);
    return dialog;
  }

  @override
  Future<CubeMessage> sendMessage(String message) async {
    final newCubeMessage = _createCubeMessage();
    newCubeMessage.body = message;
    return dialog.sendMessage(newCubeMessage);
  }

  CubeMessage _createCubeMessage() => CubeMessage()
    ..dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000
    ..markable = true
    ..saveToHistory = true;

  @override
  Future<CubeMessage> sendImage(File imageFile) async {
    final cubeUploadedFile = await uploadFile(
      imageFile,
      isPublic: true,
      onProgress: (progress) {
        print("uploadImageFile progress = $progress");
      },
    );
    // if(cubeUploadedFile.getPublicUrl()!=null)
    var url = cubeUploadedFile.getPublicUrl();
    return onSendChatAttachment(url: url ?? '', imageFile: imageFile);
  }

  Future<CubeMessage> onSendChatAttachment({
    required String url,
    required File imageFile,
  }) async {
    var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
    final cachedUser =
        Injection.sl<GetCacheUserUseCase>().authRepository.getCacheUser();

    final attachment = CubeAttachment();
    attachment.id = imageFile.hashCode.toString();
    attachment.type = CubeAttachmentType.IMAGE_TYPE;
    attachment.url = url;
    attachment.height = decodedImage.height;
    attachment.width = decodedImage.width;
    final message = _createCubeMessage();
    message.body = "Attachment";
    message.attachments = [attachment];
    // onSendMessage(message: message);
    if (cachedUser != null) message.senderId = cachedUser.id;
    await dialog.sendMessage(message);
    return message;
  }
}
