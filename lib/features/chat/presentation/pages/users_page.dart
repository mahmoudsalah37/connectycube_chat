import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/channels_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/no_message_widget.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersPage extends GetView<ChannelsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (pagedResult) {
          final users = pagedResult?.items ?? [];
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users.elementAt(index);
              return ChatItemWidget(
                cubeUser: user,
                onPressed: () async {
                  final privateDialog =
                      await controller.createNewPrivateDialog(user);
                  if (privateDialog != null) {
                    controller.setUser = user;
                    Get.toNamed(Routes.chatPage, arguments: privateDialog);
                  }
                },
              );
            },
          );
        },
        onEmpty: NoMessageWidget(),
      ),
    );
  }
}
