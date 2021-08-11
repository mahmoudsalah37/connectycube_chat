import '../../../../core/src/colors.dart';
import '../../../../core/src/styles.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
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
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool passwordVisibility;
  @override
  void initState() {
    super.initState();
    passwordVisibility = widget.obscureText;
  }

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
        obscureText: passwordVisibility,
        controller: widget.controller,
        style: theme.textTheme.headline2,
        keyboardType: widget.inputType,
        textInputAction: TextInputAction.next,
        decoration: CustomStyle.authInputDecoration.copyWith(
            hintText: widget.hint,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      passwordVisibility
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: CustomColors.primaryColor,
                    ),
                    onPressed: () => setState(
                        () => passwordVisibility = !passwordVisibility),
                  )
                : null,
            prefixIcon:
                Icon(widget.prefixIcon, color: CustomColors.primaryColor)),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
