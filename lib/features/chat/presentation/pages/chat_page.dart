import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/channels_controller.dart';
import '../getx/chat_controller.dart';
import '../getx/voice_record_controller.dart';
import '../widgets/chat_bottom_bar_widget.dart';
import '../widgets/message_item_widget.dart';
import '../widgets/no_message_widget.dart';

class ChatPage extends GetView<ChatController> {
  final channelController = Get.find<ChannelsController>();
  final voiceRecordController = Get.find<VoiceRecordController>();

  @override
  Widget build(BuildContext context) {
    final channelController = Get.find<ChannelsController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            ClipOval(
              child: channelController.getUser.avatar == null
                  ? Container()
                  : CachedNetworkImage(
                      imageUrl: channelController.getUser.avatar!,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: 10),
            Text(channelController.getUser.fullName.toString()),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: controller.obx(
              (messageList) {
                final length = messageList?.length;
                return ListView.builder(
                  itemCount: length,
                  reverse: true,
                  itemBuilder: (_, index) {
                    final isMe = controller.senderMessageIsMe(index);
                    return MessageItemWidget(
                      index: index,
                      isMe: isMe,
                      messagesList: messageList ?? [],
                    );
                  },
                );
              },
              onEmpty: NoMessageWidget(),
              onLoading: Center(child: CircularProgressIndicator()),
            ),
          ),
          ChatBottomBarWidget(
            onSendImage: () async => await controller.sendImageMessage(),
            onSendVoiceRecord: controller.sendVoiceMessage,
            onPauseVoiceRecord: voiceRecordController.pauseRecord,
            onStopVoiceRecord: () async {
              await voiceRecordController.stopRecord();
              Get.back();
            },
            onResumeVoiceRecord: () {},
            onSendMessage: (text) async =>
                await controller.sendStringMessage(text),
            onStartVoiceRecord: voiceRecordController.startRecord,
          )
        ],
      ),
    );
  }
}
