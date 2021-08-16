import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

class GetUsersUseCase extends UseCase<PagedResult<CubeUser>?, NoParams> {
  GetUsersUseCase({required this.chatRemoteDataSource});
  final ChatRemoteDataSource chatRemoteDataSource;

  @override
  Future<PagedResult<CubeUser>?> call({required NoParams params}) {
    return chatRemoteDataSource.getUsers();
  }
}
