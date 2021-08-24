import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class GetMessageHistoryUseCase
    extends UseCase<Future<PagedResult<CubeMessage>?>, MessageHistoryParam> {
  GetMessageHistoryUseCase({required this.chatRepository});

  final ChatRepository chatRepository;

  @override
  Future<PagedResult<CubeMessage>?> call(
      {required MessageHistoryParam params}) {
    return chatRepository.getMessageHistory(params.dialogId);
  }
}

class MessageHistoryParam extends Equatable {
  final String dialogId;

  MessageHistoryParam({required this.dialogId});

  @override
  List<Object?> get props => [dialogId];
}
