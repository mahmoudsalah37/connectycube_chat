import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';

class DisposeRecordUseCase extends UseCase<Future<void>, NoParams> {
  DisposeRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    throw UnimplementedError();
  }
}
