import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class SendStringMessageUseCase
    extends UseCase<Future<CubeMessage>, StringMessageParam> {
  SendStringMessageUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<CubeMessage> call({required StringMessageParam params}) {
    return chatRepository.sendMessage(params.message);
  }
}

class StringMessageParam extends Equatable {
  final String message;

  StringMessageParam({required this.message});
  @override
  List<Object?> get props => [message];
}
