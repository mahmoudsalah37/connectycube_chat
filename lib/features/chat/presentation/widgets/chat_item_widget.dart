import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String image, title, lastMessage;
  ChatItemWidget(
      {required this.onPressed,
      required this.title,
      this.image = '',
      this.lastMessage = ''});

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: CustomStyle.containerShadowDecoration,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/test/person.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$title', style: theme.textTheme.headline5),
                      Text('3:02 PM', style: theme.textTheme.subtitle1),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('$lastMessage', style: theme.textTheme.subtitle2)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
