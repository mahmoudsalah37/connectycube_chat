import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';

class HasPermissionToRecordUseCase extends UseCase<Future<bool>, NoParams> {
  HasPermissionToRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<bool> call({required NoParams params}) {
    return chatRepository.hasPermissionToVoiceRecord();
  }
}
