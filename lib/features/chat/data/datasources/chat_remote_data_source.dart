import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class ChatRemoteDataSource {
  Future<PagedResult<CubeUser>?> getUsers();
  Future<CubeDialog> createNewPrivateDialog(int id);
  Future<CubeMessage> sendMessage(String message);
}

class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
  ChatRemoteDataSourceImp();
  @override
  Future<PagedResult<CubeUser>?> getUsers() => getAllUsers();
  late CubeDialog dialog;
  @override
  Future<CubeDialog> createNewPrivateDialog(int id) async {
    final setDialog = CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [id]);
    dialog = await createDialog(setDialog);
    return dialog;
  }

  @override
  Future<CubeMessage> sendMessage(String message) async {
    final newCubeMessage = _CreateCubeMessage();
    newCubeMessage.body = message;
    return dialog.sendMessage(newCubeMessage);
  }

  CubeMessage _CreateCubeMessage() => CubeMessage()
    ..dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000
    ..markable = true
    ..saveToHistory = true;
}
