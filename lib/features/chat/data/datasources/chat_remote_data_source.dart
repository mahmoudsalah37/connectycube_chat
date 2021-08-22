import 'package:connectycube_sdk/connectycube_sdk.dart';

abstract class ChatRemoteDataSource {
  Future<PagedResult<CubeUser>?> getUsers();
  CubeDialog get getDialog;
  Future<CubeDialog> createNewPrivateDialog(int id);
  Future<CubeMessage> sendMessage(String message);
  Stream<CubeMessage>? streamMessages();
}

class ChatRemoteDataSourceImp implements ChatRemoteDataSource {
  ChatRemoteDataSourceImp();
  @override
  Future<PagedResult<CubeUser>?> getUsers() => getAllUsers();
  late CubeDialog _dialog;
  Stream<CubeMessage>? messagesStatusesManager =
      CubeChatConnection.instance.chatMessagesManager?.chatMessagesStream;

  @override
  Future<CubeDialog> createNewPrivateDialog(int id) async {
    final setDialog = CubeDialog(CubeDialogType.PRIVATE, occupantsIds: [id]);
    _dialog = await createDialog(setDialog);
    return _dialog;
  }

  @override
  Future<CubeMessage> sendMessage(String message) async {
    final newCubeMessage = _CreateCubeMessage();
    newCubeMessage.body = message;
    return _dialog.sendMessage(newCubeMessage);
  }

  CubeMessage _CreateCubeMessage() => CubeMessage()
    ..dateSent = DateTime.now().millisecondsSinceEpoch ~/ 1000
    ..markable = true
    ..saveToHistory = true;

  @override
  Stream<CubeMessage>? streamMessages() {
    return messagesStatusesManager;
  }

  @override
  CubeDialog get getDialog => _dialog;
}
