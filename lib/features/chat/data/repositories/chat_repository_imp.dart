import 'dart:io';

import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class ChatRepositoryImp implements ChatRepository {
  const ChatRepositoryImp({required this.chatRemoteDataSource});
  final ChatRemoteDataSource chatRemoteDataSource;
  @override
  Future<PagedResult<CubeUser>?> getUsers() => chatRemoteDataSource.getUsers();

  @override
  Future<CubeDialog> createNewPrivateDialog(int id) {
    return chatRemoteDataSource.createNewPrivateDialog(id);
  }

  @override
  Future<CubeMessage> sendMessage(String message) {
    return chatRemoteDataSource.sendMessage(message);
  }

  @override
  Stream<CubeMessage>? streamMessages() {
    return chatRemoteDataSource.streamMessages();
  }

  @override
  CubeDialog get getDialog => chatRemoteDataSource.getDialog;
  Future<CubeMessage> sendImage(File image) {
    return chatRemoteDataSource.sendImage(image);
  }
}
