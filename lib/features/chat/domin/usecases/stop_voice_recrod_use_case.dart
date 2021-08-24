import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class StopVoiceRecordUseCase extends UseCase<Future<String?>, NoParams> {
  StopVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<String?> call({required NoParams params}) {
    return chatRepository.stopVoiceRecord();
  }
}
