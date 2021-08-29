import 'package:flutter/material.dart';

import '../../../../core/utils/resposive.dart';

class NoMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_message_yet.png',
            width: res.getWidth(60),
          ),
          Text('You have no messages', style: theme.textTheme.headline1),
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
