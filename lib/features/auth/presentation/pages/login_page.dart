import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/utils/resposive.dart';
import 'package:connectycube_chat/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  bool passwordVisibility = true;

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
            controller: userNameTEC,
            hint: 'User name',
            inputType: TextInputType.number,
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: res.getHeight(2)),
          AuthTextField(
            controller: passwordTEC,
            hint: 'Password',
            inputType: TextInputType.visiblePassword,
            obscureText: passwordVisibility,
            prefixIcon: Icons.lock_outline,
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisibility ? Icons.visibility_off : Icons.visibility,
                color: CustomColors.primaryColor,
              ),
              onPressed: () =>
                  setState(() => passwordVisibility = !passwordVisibility),
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.transparent,
            ),
            child: Text(
              'Forget Password ?',
              style: theme.textTheme.headline2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.getWidth(20)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: theme.textTheme.headline2,
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20),
                backgroundColor: CustomColors.primaryColor,
                elevation: 6,
                shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: res.getHeight(16)),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
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
          )
        ],
      ),
    );
  }
}
