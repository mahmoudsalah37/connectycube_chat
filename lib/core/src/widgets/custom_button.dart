import '../colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Alignment? alignment;
  final Color? backgroundColor;
  final double? elevation;
  final double paddingHorizontal;
  final Widget? child;

  CustomButton({
    required this.onPressed,
    required this.title,
    this.alignment = Alignment.center,
    this.backgroundColor = CustomColors.primaryColor,
    this.elevation = 6,
    this.child,
    this.paddingHorizontal = 20,
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
        padding:
            EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 10),
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
