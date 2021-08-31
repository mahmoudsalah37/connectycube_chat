import 'package:connectycube_chat/core/src/widgets/loading_indicator_widget.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/create_group_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/create_group_item_widget.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/no_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/styles.dart';
import '../../../../core/src/widgets/custom_button.dart';

class CreateGroupPage extends GetView<CreateGroupController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.getLoadingIndicator,
        progressIndicator: LoadingIndicatorWidget(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  controller: controller.groupNameTEC,
                  style: theme.textTheme.subtitle1,
                  decoration: CustomStyle.chatSearchInputDecoration,
                ),
              ),
              Expanded(
                child: controller.obx(
                  (pagedResult) {
                    final users = pagedResult?.items ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users.elementAt(index);
                        return CreateGroupItemWidget(
                          cubeUser: user,
                          onPressed: () {},
                        );
                      },
                    );
                  },
                  onEmpty: NoMessageWidget(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomButton(
                  onPressed: controller.createGroupDialog,
                  title: 'Create',
                  paddingHorizontal: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
