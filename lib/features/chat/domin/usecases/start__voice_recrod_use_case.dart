import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

class StartVoiceRecordUseCase extends UseCase<Future<void>, StartRecordParams> {
  StartVoiceRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required StartRecordParams params}) {
    return chatRepository.startVoiceRecord(path: params.path);
  }
}

class StartRecordParams extends Equatable {
  const StartRecordParams({this.path});
  final String? path;
  @override
  List<Object?> get props => [path];
}
