import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/get_first_chat_use_case.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/create_new_private_dialog.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_users_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeDialog, CubeDialogType, CubeUser, PagedResult, createDialog;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart'
    show PagingController;

class ChannelsController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin<PagedResult<CubeUser>?> {
  ChannelsController(
      {required this.getFirstCharUseCase,
      required this.getCacheUserUseCase,
      required this.getUsersUseCase,
      required this.createNewPrivateDialogUseCase});

  final GetUsersUseCase getUsersUseCase;
  final GetCacheUserUseCase getCacheUserUseCase;
  final GetFirstCharUseCase getFirstCharUseCase;
  final CreateNewPrivateDialogUseCase createNewPrivateDialogUseCase;

  late TabController tabController;
  PagedResult<CubeUser>? users;
  late CubeUser cubeUser;
  late PagingController<int, CubeUser> pagingController;
  @override
  void onInit() {
    super.onInit();

    change(null, status: RxStatus.empty());
    getUsers();
    tabController = new TabController(length: 2, vsync: this);
  }

  void getUsers() async {
    change(null, status: RxStatus.loading());
    users = await getUsersUseCase(params: NoParams());
    change(users, status: RxStatus.success());
  }

  set setUser(CubeUser cubeUser) {
    this.cubeUser = cubeUser;
    update();
  }

  CubeUser get getUser => cubeUser;
  Future<CubeDialog?> createNewPrivateDialog(CubeUser user) async {
    final id = user.id;
    if (id != null) {
      return createNewPrivateDialogUseCase(params: PrivateDialogParam(id: id));
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
