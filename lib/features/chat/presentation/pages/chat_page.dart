import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/channels_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/chat_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/message_item_widget.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/record_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    final channelController = Get.find<ChannelsController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipOval(
              child: channelController.getUser.avatar == null
                  ? Container()
                  : CachedNetworkImage(
                      imageUrl: channelController.getUser.avatar!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
            ),
            title: Text(channelController.getUser.fullName.toString()),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: controller.getMessagesList.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.getMessagesList.length,
                      reverse: true,
                      itemBuilder: (_, index) {
                        return MessageItemWidget(
                          index: index,
                          isMe: true,
                          messagesList: controller.getMessagesList,
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: CustomStyle.containerShadowDecoration
                  .copyWith(borderRadius: BorderRadius.circular(0)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async => await controller.sendImageMessage(),
                    child: CircleAvatar(
                      backgroundColor: CustomColors.primaryColor,
                      child: Icon(Icons.add_a_photo,
                          size: 20, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: controller.messageTEC,
                        decoration: CustomStyle.authInputDecoration.copyWith(
                          hintText: 'Message',
                          fillColor: Colors.grey[200],
                        ),
                        onChanged: (v) => v.isEmpty
                            ? controller.setTextFieldIsEmpty = true.obs
                            : controller.setTextFieldIsEmpty = false.obs,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async => !controller.getTextFieldIsEmpty
                        ? await controller.sendStringMessage()
                        : showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => RecordDialogWidget(
                              onTapCancel: () => Get.back(),
                              onTapPause: () {},
                              onTapSendVoice: () {},
                            ),
                          ),
                    icon: controller.getTextFieldIsEmpty
                        ? Icon(Icons.mic, color: CustomColors.primaryColor)
                        : Icon(Icons.send, color: CustomColors.primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
