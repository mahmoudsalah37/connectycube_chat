import 'package:connectycube_chat/core/src/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Alignment? alignment;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? child;

  CustomButton(
      {required this.onPressed,
      required this.title,
      this.alignment = Alignment.center,
      this.backgroundColor = CustomColors.primaryColor,
      this.elevation = 6,
      this.child
      // = const Text(
      //   'title',
      //   style: TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.w600,
      //     color: CustomColors.yellowDeepColor,
      //   ),
      // ),
      });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: child ??
          Text(
            title,
            style: theme.textTheme.headline2?.copyWith(fontSize: 20),
          ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: backgroundColor,
        elevation: elevation,
        alignment: alignment,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}