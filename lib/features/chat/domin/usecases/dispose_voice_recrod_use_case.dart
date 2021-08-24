import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class DisposeVoiceRecordUseCase extends UseCase<Future<void>, NoParams> {
  DisposeVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    return chatRepository.disposeVoiceRecord();
  }
}
