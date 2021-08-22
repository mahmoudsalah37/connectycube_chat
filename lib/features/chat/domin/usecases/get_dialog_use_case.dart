import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetDialogUseCase extends UseCase<CubeDialog, NoParams> {
  GetDialogUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  CubeDialog call({required NoParams params}) {
    return chatRepository.getDialog;
  }
}
