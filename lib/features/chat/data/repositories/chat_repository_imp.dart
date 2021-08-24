import 'dart:io';

import 'package:connectycube_chat/features/auth/data/datasources/user_local_data_source.dart';
import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_chat/features/chat/data/datasources/voice_record_data_source.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class ChatRepositoryImp implements ChatRepository {
  const ChatRepositoryImp(
      {required this.chatRemoteDataSource,
      required this.userLocalDataSource,
      required this.recordDataSource});
  final ChatRemoteDataSource chatRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final VoiceRecordDataSource recordDataSource;

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
  Future<CubeMessage> sendImageMessage(String path) async {
    final file = File(path);
    final cubeFile = await uploadCubeFile(file);

    final cachedUser = userLocalDataSource.getCacheUser();
    return chatRemoteDataSource.sendImageMessage(
        cachedUser: cachedUser, cubeFile: cubeFile, imageFile: file);
  }

  @override
  Future<CubeFile> uploadCubeFile(File file) {
    return chatRemoteDataSource.uploadCubeFile(file);
  }

  // @override
  // Future<void> deleteRecord() {}

  @override
  Future<bool> hasPermissionToVoiceRecord() =>
      recordDataSource.hasPermissionToVoiceRecord();

  @override
  Future<void> pauseVoiceRecord() => recordDataSource.pauseVoiceRecord();

  @override
  Future<void> startVoiceRecord({String? path}) =>
      recordDataSource.startVoiceRecord(path: path);

  @override
  Future<String?> stopVoiceRecord() => recordDataSource.stopVoiceRecord();

  @override
  Future<void> resumeVoiceRecord() => recordDataSource.resumeVoiceRecord();

  @override
  Future<void> disposeVoiceRecord() => recordDataSource.disposeVoiceRecord();

  @override
  Future<CubeMessage> sendVoiceRecord(String? path) async {
    final file = File(path!);
    final cubeFile = await uploadCubeFile(file);
    final cachedUser = userLocalDataSource.getCacheUser();
    return chatRemoteDataSource.sendVoiceRecordMessage(
        cachedUser: cachedUser, cubeFile: cubeFile, file: file);
  }
}
