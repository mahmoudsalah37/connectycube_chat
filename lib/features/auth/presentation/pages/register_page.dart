import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/core/src/widgets/custom_button.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      lastNameTEC = TextEditingController(text: ''),
      firstNameTEC = TextEditingController(text: ''),
      NameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: res.getHeight(10), left: 10, right: 10),
        children: [
          SizedBox(height: res.getHeight(2)),
          Center(
            child: Image.asset(
              'assets/images/toast_icon.png',
              height: res.getHeight(16),
            ),
          ),
          SizedBox(height: res.getHeight(4)),
          AuthTextField(
            controller: firstNameTEC,
            hint: 'First Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          AuthTextField(
            controller: lastNameTEC,
            hint: 'Last Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          AuthTextField(
            controller: userNameTEC,
            hint: 'User Name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          AuthTextField(
            controller: firstNameTEC,
            hint: 'password',
            inputType: TextInputType.text,
            prefixIcon: Icons.lock_outline,
          ),
          SizedBox(height: res.getHeight(4)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
            child: CustomButton(
              title: 'Sign Up',
              onPressed: () => Get.toNamed(Routes.welcomePage),
            ),
          ),
        ],
      ),
    );
  }
}
