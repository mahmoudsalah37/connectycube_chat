import 'dart:io';

import 'package:connectycube_chat/features/auth/data/datasources/user_local_data_source.dart';
import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_chat/features/chat/data/datasources/record_data_source.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class ChatRepositoryImp implements ChatRepository {
  const ChatRepositoryImp(
      {required this.chatRemoteDataSource,
      required this.userLocalDataSource,
      required this.recordDataSource});

  final ChatRemoteDataSource chatRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final RecordDataSource recordDataSource;

  @override
  Future<PagedResult<CubeUser>?> getUsers() => chatRemoteDataSource.getUsers();

  @override
  Future<PagedResult<CubeMessage>?> getMessageHistory(String dialogId) {
    return chatRemoteDataSource.getMessageHistory(dialogId);
  }

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

  Future<CubeMessage> sendImageMessage(File imageFile) async {
    final cubeFile = await uploadCubeFile(imageFile);

    final cachedUser = await userLocalDataSource.getCacheUser();
    return chatRemoteDataSource.sendImageMessage(
        cachedUser: cachedUser, cubeFile: cubeFile, imageFile: imageFile);
  }

  @override
  Future<CubeFile> uploadCubeFile(File file) {
    return uploadFile(
      file,
      isPublic: true,
      onProgress: (progress) {
        print("uploadImageFile progress = $progress");
      },
    );
  }

  // @override
  // Future<void> deleteRecord() {}

  @override
  Future<bool> hasPermissionToRecord() =>
      recordDataSource.hasPermissionToRecord();

  @override
  Future<void> pauseRecord() => recordDataSource.pauseRecord();

  @override
  Future<void> startRecord({String? path}) =>
      recordDataSource.startRecord(path: path);

  @override
  Future<String?> stopRecord() => recordDataSource.stopRecord();

  @override
  Future<void> resumeRecord() => recordDataSource.resumeRecord();
}
