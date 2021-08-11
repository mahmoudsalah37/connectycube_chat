import 'core/utils/configs.dart';

import 'core/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/src/routes.dart';
import 'core/utils/injection_container.dart';
import 'features/auth/presentation/getx/login_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ConnectyCubeConfig.initial();
    Injection.init();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomsThemes.defaultThemeData,
      initialRoute: Routes.splashPage,
      getPages: Routes.setPages(),
      onInit: InitControllers,
      title: 'Chat',
    );
  }
}

void InitControllers() {
  Get.lazyPut(() => Injection.sl<LoginController>());
}
