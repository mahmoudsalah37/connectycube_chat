import 'package:connectycube_chat/core/src/colors.dart';
import 'package:connectycube_chat/core/src/styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData prefixIcon;

  AuthTextField({
    required this.controller,
    required this.inputType,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: theme.textTheme.headline2,
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        decoration: CustomStyle.authInputDecoration.copyWith(
            hintText: hint,
            suffixIcon: suffixIcon,
            prefixIcon: Icon(prefixIcon, color: CustomColors.primaryColor)),
      ),
    );
  }
}
