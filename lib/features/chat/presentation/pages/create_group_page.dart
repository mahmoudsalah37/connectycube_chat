import 'package:connectycube_chat/core/src/styles.dart';
import 'package:connectycube_chat/core/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CreateGroupPage extends StatelessWidget {
  final TextEditingController searchTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchTEC,
                style: theme.textTheme.headline2,
                decoration: CustomStyle.chatSearchInputDecoration,
              ),
            ),
            CustomButton(
              onPressed: () {},
              title: 'Create',
              paddingHorizontal: 80,
            ),
          ],
        ),
      ),
    );
  }
}
