import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class CreateNewPrivateDialogUseCase
    extends UseCase<Future<CubeDialog>, PrivateDialogParam> {
  CreateNewPrivateDialogUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<CubeDialog> call({required PrivateDialogParam params}) {
    return chatRepository.createNewPrivateDialog(params.id);
  }
}

class PrivateDialogParam extends Equatable {
  final int id;

  PrivateDialogParam({required this.id});
  @override
  List<Object?> get props => [id];
}
