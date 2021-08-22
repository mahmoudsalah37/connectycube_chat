import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';

class StopRecordUseCase extends UseCase<Future<String?>, NoParams> {
  StopRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<String?> call({required NoParams params}) {
    return chatRepository.stopRecord();
  }
}
