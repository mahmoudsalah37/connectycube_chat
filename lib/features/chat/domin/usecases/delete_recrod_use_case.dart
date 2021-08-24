import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class DeleteRecordUseCase extends UseCase<Future<void>, NoParams> {
  DeleteRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required NoParams params}) {
    throw UnimplementedError();
  }
}
