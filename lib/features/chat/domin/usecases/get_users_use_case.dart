import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetUsersUseCase extends UseCase<PagedResult<CubeUser>?, NoParams> {
  GetUsersUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<PagedResult<CubeUser>?> call({required NoParams params}) {
    return chatRepository.getUsers();
  }
}
