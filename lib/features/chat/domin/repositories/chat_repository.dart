import 'dart:io';

import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeDialog, CubeFile, CubeMessage, CubeUser, PagedResult;

abstract class ChatRepository {
  Future<PagedResult<CubeUser>?> getUsers();
  Future<PagedResult<CubeMessage>?> getMessageHistory(String dialogId);
  Future<CubeDialog> createNewPrivateDialog(int id);
  Future<CubeMessage> sendMessage(String message);
  Stream<CubeMessage>? streamMessages();
  CubeDialog get getDialog;
  Future<CubeMessage> sendImageMessage(File image);
  Future<CubeFile> uploadCubeFile(File file);


  Future<bool> hasPermissionToRecord();
  Future<void> startRecord({String? path});
  Future<void> resumeRecord();
  Future<void> pauseRecord();
  Future<String?> stopRecord();
  // Future<void> deleteRecord();
}
