import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/chat/domin/usecases/get_users_use_case.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart'
    show CubeUser, PagedResult;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelsController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin<PagedResult<CubeUser>?> {
  ChannelsController({required this.getUsersUseCase});
  final GetUsersUseCase getUsersUseCase;
  late TabController tabController;
  PagedResult<CubeUser>? users;
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

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
