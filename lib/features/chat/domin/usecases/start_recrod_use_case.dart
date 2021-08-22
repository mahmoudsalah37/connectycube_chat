import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

class StartRecordUseCase extends UseCase<Future<void>, StartRecordParam> {
  StartRecordUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<void> call({required StartRecordParam params}) {
    return chatRepository.startRecord(path: params.path);
  }
}

class StartRecordParam extends Equatable {
  const StartRecordParam({this.path});
  final String? path;
  @override
  List<Object?> get props => [path];
}
