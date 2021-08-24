import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetMessageHistoryUseCase
    extends UseCase<Future<PagedResult<CubeMessage>?>, NoParams> {
  GetMessageHistoryUseCase({required this.chatRepository});

  final ChatRepository chatRepository;

  @override
  Future<PagedResult<CubeMessage>?> call({required NoParams params}) {
    return chatRepository.getMessageHistory();
  }
}
