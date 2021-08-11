import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class CustomStyle {
  static final InputDecoration homeSearchInputDecoration = InputDecoration(
    hintText: 'Search...',
    fillColor: CustomColors.yellowLightColor,
    filled: true,
    hintStyle: TextStyle(fontSize: 12),
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );

  static final InputDecoration registerInputDecoration = InputDecoration(
    fillColor: Colors.white,
    hintText: 'email',
    labelStyle: TextStyle(color: CustomColors.blueLightColor),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.blueLightColor, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.blueLightColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  );

  static final BoxDecoration containerShadowDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  );

  // static final DefaultChatTheme chatTheme = DefaultChatTheme(
  //   backgroundColor: CustomColors.greyLightColor,
  //   primaryColor: Color.fromRGBO(0, 161, 205, 1),
  //   secondaryColor: Color.fromRGBO(0, 100, 136, 1),
  //   inputBackgroundColor: Color.fromRGBO(0, 100, 136, 1),
  //   inputTextColor: Colors.white,
  //   dateDividerTextStyle: TextStyle(color: Colors.black),
  //   inputTextStyle: TextStyle(color: Colors.green),
  //   receivedMessageBodyTextStyle: TextStyle(color: Colors.white),
  //   sentMessageBodyTextStyle:
  //       TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  //   sendButtonIcon: SvgPicture.asset(
  //     'assets/images/home/send_chat_icon.svg',
  //     color: Colors.white,
  //   ),
  // );
}
