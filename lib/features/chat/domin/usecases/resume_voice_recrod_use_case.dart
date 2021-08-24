import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class ResumeVoiceRecordUseCase extends UseCase<Future<void>, NoParams> {
  ResumeVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    return chatRepository.resumeVoiceRecord();
  }
}
