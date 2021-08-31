import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/src/routes.dart';
import '../../../../core/utils/injection_container.dart';
import '../getx/login_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final loginController = Injection.sl<LoginController>();

  @override
  void initState() {
    newMethod();
    super.initState();
  }

  void newMethod() async {
    try {
      await loginController.autoLogin();
      Future.delayed(
        Duration(milliseconds: 1000),
        () => Get.offNamed(Routes.channelsPage),
      );
    } catch (e) {} finally {
      Get.offNamed(Routes.loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Lottie.asset('assets/lottie/splash_lottie.json'),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/toast_icon.png',
              width: 100,
            ),
          ),
          Positioned(
            bottom: 70,
            left: MediaQuery.of(context).size.width / 4.5,
            child: Text(
              'Chat from any where \nwith anyone...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
