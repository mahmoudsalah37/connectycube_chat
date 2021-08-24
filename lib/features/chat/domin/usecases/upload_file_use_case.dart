import 'dart:io';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class UploadFileUseCase extends UseCase<Future<CubeFile>, FileParam> {
  UploadFileUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<CubeFile> call({required FileParam params}) {
    return chatRepository.uploadCubeFile(params.file);
  }
}

class FileParam extends Equatable {
  final File file;

  FileParam({required this.file});
  @override
  List<Object?> get props => [file];
}
