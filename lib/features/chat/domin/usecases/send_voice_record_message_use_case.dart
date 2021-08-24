import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class SendVoiceRecordMessageUseCase
    extends UseCase<Future<CubeMessage>, VoiceRecordMessageParams> {
  SendVoiceRecordMessageUseCase({required this.chatRepository});

  final ChatRepository chatRepository;

  @override
  Future<CubeMessage> call({required VoiceRecordMessageParams params}) {
    return chatRepository.sendVoiceRecord(params.path);
  }
}

class VoiceRecordMessageParams extends Equatable {
  final String? path;

  VoiceRecordMessageParams({required this.path});

  @override
  List<Object?> get props => [path];
}
