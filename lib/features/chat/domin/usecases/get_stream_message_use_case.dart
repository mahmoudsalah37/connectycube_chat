import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetStreamMessagesUseCase extends UseCase<Stream<CubeMessage>?, NoParams> {
  GetStreamMessagesUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Stream<CubeMessage>? call({required NoParams params}) {
    return chatRepository.streamMessages();
  }
}
