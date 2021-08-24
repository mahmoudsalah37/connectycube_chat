import '../../../../core/src/colors.dart';
import '../../../../core/src/styles.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageItemWidget extends StatelessWidget {
  final List<CubeMessage> messagesList;
  final bool isMe;
  final int index;

  MessageItemWidget({
    required this.messagesList,
    required this.isMe,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dateSent = messagesList.elementAt(index).dateSent;
    var convertDate = DateTime.fromMillisecondsSinceEpoch(dateSent! * 1000);
    var dateWithFormat = DateFormat('MM/dd hh:mm a').format(convertDate);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            dateWithFormat,
            style:
                textTheme.headline3!.copyWith(color: Colors.grey, fontSize: 8),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: CustomStyle.containerShadowDecoration.copyWith(
              color: isMe
                  ? CustomColors.primaryColor
                  : CustomColors.brownLightColor,
              borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(14) : Radius.circular(0),
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
                topRight: isMe ? Radius.circular(0) : Radius.circular(14),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  messagesList.elementAt(index).body ?? 'empty',
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                  style: textTheme.headline4!.copyWith(color: Colors.black),
                ),
                Stack(
                  children: [
                    Icon(Icons.check, color: Colors.grey, size: 14),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.check, color: Colors.grey, size: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
