import '../../../../core/usecases/usecase.dart';
import '../repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetUsersUseCase
    extends UseCase<Future<PagedResult<CubeUser>?>, NoParams> {
  GetUsersUseCase({required this.chatRepository});
  final ChatRepository chatRepository;

  @override
  Future<PagedResult<CubeUser>?> call({required NoParams params}) {
    return chatRepository.getUsers();
  }
}
