import 'package:connectycube_chat/core/src/routes.dart';
import 'package:connectycube_chat/core/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CustomButton(
                  onPressed: () => Get.toNamed(Routes.homePage),
                  title: '  Yalla Chat!  '),
            ),
          )
        ],
      ),
    );
  }
}