import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/src/routes.dart';
import '../../../../core/src/widgets/custom_button.dart';

class WelcomeNewUserPage extends StatelessWidget {
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
                onPressed: () => Get.offNamed(Routes.channelsPage),
                title: 'Yalla Chat!',
                paddingHorizontal: 70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
