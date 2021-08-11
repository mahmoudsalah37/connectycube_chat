import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  final VoidCallback onPressed;

  ChatItemWidget({required this.onPressed});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('The Rock', style: theme.textTheme.headline5),
                    SizedBox(width: res.getWidth(30)),
                    Text('3:02 PM', style: theme.textTheme.subtitle1),
                  ],
                ),
                SizedBox(height: 8),
                Text('this is sent message', style: theme.textTheme.subtitle2)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
