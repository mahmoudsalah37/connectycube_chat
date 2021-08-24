import 'package:flutter/material.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/styles.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final IconData prefixIcon;
  final String? Function(String? v)? validator;
  TextFieldWidget(
      {required this.controller,
      required this.inputType,
      required this.hint,
      this.obscureText = false,
      this.suffixIcon,
      required this.prefixIcon,
      this.validator});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool passwordVisibility;
  @override
  void initState() {
    super.initState();
    passwordVisibility = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Container(
      decoration: CustomStyle.containerShadowDecoration,
      child: TextFormField(
        obscureText: passwordVisibility,
        controller: widget.controller,
        validator: widget.validator,
        // style: theme.textTheme.headline,
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

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }
}
