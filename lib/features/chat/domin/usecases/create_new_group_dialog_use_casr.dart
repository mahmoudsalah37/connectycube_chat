import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';

class CreateNewGroupDialogUseCase
    extends UseCase<Future<CubeDialog>, CreateNewGroupDialogParam> {
  CreateNewGroupDialogUseCase({required this.chatRepository});

  final ChatRepository chatRepository;

  @override
  Future<CubeDialog> call({required CreateNewGroupDialogParam params}) {
    return chatRepository.createNewGroupDialog(params.users, params.groupName);
  }
}

class CreateNewGroupDialogParam extends Equatable {
  final List<int> users;
  final String groupName;

  CreateNewGroupDialogParam({
    required this.users,
    required this.groupName,
  });

  @override
  List<Object?> get props => [users, groupName];
}
