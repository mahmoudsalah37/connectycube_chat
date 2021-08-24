import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/channels_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/chat_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/getx/voice_record_controller.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/record_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  final channelController = Get.find<ChannelsController>();
  final voiceRecordController = Get.find<VoiceRecordController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      builder: (controller) {
        return Scaffold(
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
              Expanded(child: Text('chat page')),
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
                              ? controller.setTextFieldIsEmpty = true
                              : controller.setTextFieldIsEmpty = false,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final hasPermission =
                            await voiceRecordController.hasPermissionToRecord();
                        if (hasPermission) {
                          await voiceRecordController.startRecord();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => RecordDialogWidget(
                              onTapStopVoice: () async {
                                print(await voiceRecordController.stopRecord());
                                Get.back();
                              },
                              onTapPauseVoice: () async {
                                await voiceRecordController.pauseRecord();
                              },
                              onTapSendVoice: () async {
                                final path =
                                    await voiceRecordController.stopRecord();
                                await voiceRecordController.disposeRecord();
                                await voiceRecordController
                                    .sendVoiceRecord(path);
                                Get.back();
                              },
                            ),
                          );
                        }
                      },
                      icon: controller.getTextFieldIsEmpty
                          ? Icon(Icons.mic, color: CustomColors.primaryColor)
                          : Icon(Icons.send, color: CustomColors.primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
