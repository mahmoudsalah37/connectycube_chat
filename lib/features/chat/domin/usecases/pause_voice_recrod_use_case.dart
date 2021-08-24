import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class PauseVoiceRecordUseCase extends UseCase<Future<void>, NoParams> {
  PauseVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    return chatRepository.pauseVoiceRecord();
  }
}
