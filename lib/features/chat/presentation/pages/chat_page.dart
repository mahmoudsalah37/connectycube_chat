import 'package:cached_network_image/cached_network_image.dart';
import '../getx/channels_controller.dart';
import '../getx/chat_controller.dart';
import '../getx/voice_record_controller.dart';
import '../widgets/chat_bottom_bar_widget.dart';
import '../widgets/message_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  final channelController = Get.find<ChannelsController>();
  final voiceRecordController = Get.find<VoiceRecordController>();

  @override
  Widget build(BuildContext context) {
    final channelController = Get.find<ChannelsController>();
    return Obx(() => Scaffold(
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
                            isMe: false,
                            messagesList: controller.getMessagesList,
                          );
                        },
                      )
                    : Center(child: CircularProgressIndicator()),
              ),
              ChatBottomBarWidget(
                onSendImage: () async => await controller.sendImageMessage(),
                onSendVoiceRecord: () async {
                  final path = await voiceRecordController.stopRecord();
                  await voiceRecordController.disposeRecord();
                  final voiceRecordMessage =
                      await voiceRecordController.sendVoiceRecord(path);
                  controller.addMessageToList(voiceRecordMessage);
                  Get.back();
                },
                onPauseVoiceRecord: () async {
                  await voiceRecordController.pauseRecord();
                },
                onStopVoiceRecord: () async {
                  await voiceRecordController.stopRecord();
                  Get.back();
                },
                onResumeVoiceRecord: () {},
                onSendMessage: (text) async {
                  await controller.sendStringMessage(text);
                },
                onStartVoiceRecord: voiceRecordController.startRecord,
              )
            ],
          ),
        ));
  }
}
