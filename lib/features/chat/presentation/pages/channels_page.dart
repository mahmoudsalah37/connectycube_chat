import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/features/auth/presentation/getx/login_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/channels_controller.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/routes.dart';
import '../../../../core/utils/resposive.dart';
import 'users_page.dart';
import 'groups_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChannelsPage extends GetView<ChannelsController> {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final theme = Theme.of(context);
    final cachedUser =
        controller.getCacheUserUseCase.authRepository.getCacheUser()!;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        try {
                          final loginController = Get.find<LoginController>();
                          await loginController.logout();
                        } catch (e) {
                          Get.snackbar('error', '$e');
                        }
                      },
                      icon: Icon(Icons.logout)),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: res.size.width - 150,
                      decoration: BoxDecoration(
                        color: CustomColors.yellowLightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: CustomColors.accentColor),
                          Text('Search...')
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.profileUserPage),
                    child: Hero(
                      tag: 'profile_hero',
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: ClipOval(
                          child: cachedUser.avatar == null
                              ? Text(
                                  controller.getFirstCharUseCase.getFirstChar(
                                    string: cachedUser.fullName!.toUpperCase(),
                                    limitTo: 1,
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: cachedUser.avatar.toString(),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (_, url, progress) =>
                                          CircularProgressIndicator(),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: res.getHeight(2)),
            Text('Recent Chat', style: theme.textTheme.headline2),
            Container(
              margin: EdgeInsets.all(14),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: CustomColors.accentColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                labelStyle: theme.textTheme.headline4,
                tabs: [
                  Tab(text: 'Chats'),
                  Tab(text: 'Groups'),
                ],
                controller: controller.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  UsersPage(),
                  GroupsPage(),
                ],
                controller: controller.tabController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.createGroupPage),
        backgroundColor: CustomColors.primaryColor,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }
}
