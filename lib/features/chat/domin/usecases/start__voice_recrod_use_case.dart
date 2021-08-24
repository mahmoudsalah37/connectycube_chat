import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

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
