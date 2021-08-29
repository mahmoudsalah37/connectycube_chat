import 'package:connectycube_sdk/connectycube_sdk.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class GetStreamMessagesUseCase extends UseCase<Stream<CubeMessage>?, NoParams> {
  GetStreamMessagesUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Stream<CubeMessage>? call({required NoParams params}) {
    return chatRepository.streamMessages();
  }
}
