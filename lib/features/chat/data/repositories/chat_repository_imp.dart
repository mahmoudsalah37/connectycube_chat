import 'package:connectycube_chat/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:connectycube_chat/features/chat/domin/repositories/chat_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeUser, PagedResult;

class ChatRepositoryImp implements ChatRepository {
  const ChatRepositoryImp({required this.chatRemoteDataSource});
  final ChatRemoteDataSource chatRemoteDataSource;
  @override
  Future<PagedResult<CubeUser>?> getUsers() => chatRemoteDataSource.getUsers();
}
