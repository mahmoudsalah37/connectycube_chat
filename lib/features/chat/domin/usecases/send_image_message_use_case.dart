import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class SendImageMessageUseCase
    extends UseCase<Future<CubeMessage>, ImageMessageParam> {
  SendImageMessageUseCase({required this.chatRepository});

  final ChatRepository chatRepository;

  @override
  Future<CubeMessage> call({required ImageMessageParam params}) {
    return chatRepository.sendImageMessage(params.path);
  }
}

class ImageMessageParam extends Equatable {
  final String path;

  ImageMessageParam({required this.path});

  @override
  List<Object?> get props => [path];
}
