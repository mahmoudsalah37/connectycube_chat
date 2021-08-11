import '../../../../core/src/colors.dart';
import '../../../../core/src/routes.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../../../../core/utils/resposive.dart';
import '../getx/login_controller.dart';
import '../widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
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
              height: res.getHeight(24),
            ),
          ),
          SizedBox(height: res.getHeight(6)),
          AuthTextField(
            controller: controller.userNameTEC,
            hint: 'User name',
            inputType: TextInputType.text,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(2)),
          AuthTextField(
            controller: controller.passwordTEC,
            hint: 'Password',
            inputType: TextInputType.visiblePassword,
            obscureText: true,
            prefixIcon: Icons.lock_outline,
          ),
          CustomButton(
            onPressed: () {},
            title: 'Forget password?',
            alignment: Alignment.centerLeft,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
            child: CustomButton(
              title: 'Login',
              onPressed: controller.login,
            ),
          ),
          SizedBox(height: res.getHeight(16)),
          CustomButton(
            onPressed: () => Get.toNamed(Routes.registerPage),
            title: 'Forget password?',
            alignment: Alignment.center,
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'don’t have an account?',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: ' \nSignUp!',
                    style: theme.textTheme.headline2!.copyWith(
                        color: CustomColors.yellowDeepColor,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
