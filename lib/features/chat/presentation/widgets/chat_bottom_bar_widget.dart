import '../../../../core/src/colors.dart';
import '../../../../core/src/styles.dart';
import 'record_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatBottomBarWidget extends StatefulWidget {
  final VoidCallback onSendImage,
      onPauseVoiceRecord,
      onResumeVoiceRecord,
      onStopVoiceRecord,
      onSendVoiceRecord;
  final Future<void> Function() onStartVoiceRecord;
  final Future<void> Function(String text) onSendMessage;
  const ChatBottomBarWidget(
      {required this.onSendMessage,
      required this.onSendImage,
      required this.onSendVoiceRecord,
      required this.onStartVoiceRecord,
      required this.onPauseVoiceRecord,
      required this.onResumeVoiceRecord,
      required this.onStopVoiceRecord});

  @override
  _ChatBottomBarWidgetState createState() => _ChatBottomBarWidgetState();
}

class _ChatBottomBarWidgetState extends State<ChatBottomBarWidget> {
  final messageTEC = TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    messageTEC.addListener(() {
      final length = messageTEC.text.length;
      if (length == 0 || length == 1) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: CustomStyle.containerShadowDecoration
          .copyWith(borderRadius: BorderRadius.circular(0)),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onSendImage,
            child: CircleAvatar(
              backgroundColor: CustomColors.primaryColor,
              child: Icon(Icons.add_a_photo, size: 20, color: Colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: messageTEC,
                decoration: CustomStyle.authInputDecoration.copyWith(
                  hintText: 'Message',
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: messageTEC.text.isEmpty
                ? () async {
                    final status = await Permission.microphone.request();
                    final isGranted = await status.isGranted;
                    if (isGranted) {
                      await widget.onStartVoiceRecord();
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => RecordDialogWidget(
                          onTapStopVoice: widget.onStopVoiceRecord,
                          onTapPauseVoice: widget.onPauseVoiceRecord,
                          onTapSendVoice: widget.onSendVoiceRecord,
                        ),
                      );
                    }
                  }
                : () async {
                    final text = messageTEC.text;
                    await widget.onSendMessage(text);
                    messageTEC.clear();
                  },
            icon: messageTEC.text.isEmpty
                ? Icon(Icons.mic, color: CustomColors.primaryColor)
                : Icon(Icons.send, color: CustomColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
