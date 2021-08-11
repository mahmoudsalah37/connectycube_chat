import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:flutter/material.dart';

class NoMessageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/no_message_yet.png',
            width: res.getWidth(60),
          ),
          Text(
            'You have no messages',
            style: theme.textTheme.headline1,
          ),
          Text(
            'Your inbox is empty, send a message \nto a riend to get started',
            style: theme.textTheme.headline4,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
