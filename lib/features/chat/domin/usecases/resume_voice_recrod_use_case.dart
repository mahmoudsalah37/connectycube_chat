import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';

class ResumeVoiceRecordUseCase extends UseCase<Future<void>, NoParams> {
  ResumeVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    return chatRepository.resumeVoiceRecord();
  }
}
