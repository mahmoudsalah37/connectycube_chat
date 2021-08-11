import 'package:connectycube_chat/core/utils/configs.dart';
import 'package:connectycube_sdk/connectycube_chat.dart';

import 'core/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/src/routes.dart';

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
    init(CustomConfig.appID, CustomConfig.authKey, CustomConfig.authSecret);
    // CubeSettings.instance.isDebugEnabled =
    //     true; // to enable ConnectyCube SDK logs;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomsThemes.defaultThemeData,
      initialRoute: Routes.loginPage,
      getPages: Routes.setPages(),
      onInit: InitControllers,
      title: 'Chat',
      // home: LoginPage(),
    );
  }
}

void InitControllers() {
  // Get.lazyPut(() => LoginController());
}
