import 'dart:io';

import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeDialog, CubeMessage, CubeUser, PagedResult;

abstract class ChatRepository {
  Future<PagedResult<CubeUser>?> getUsers();
  Future<CubeDialog> createNewPrivateDialog(int id);
  Future<CubeMessage> sendMessage(String message);
  Future<CubeMessage> sendImage(File image);
}
