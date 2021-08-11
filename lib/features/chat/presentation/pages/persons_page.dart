import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/chat/presentation/widgets/no_message_widget.dart';
import 'package:flutter/material.dart';

class PersonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: NoMessageWidget(),
    );
  }
}

