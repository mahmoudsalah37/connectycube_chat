import 'core/utils/configs.dart';

import 'core/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/src/routes.dart';
import 'core/utils/injection_container.dart';
import 'features/auth/presentation/getx/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
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
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomsThemes.defaultThemeData,
      initialRoute: Routes.splashPage,
      getPages: Routes.setPages(),
      onInit: initControllers,
      title: 'Chat',
    );
  }
}

void initControllers() {
  Get.lazyPut(() => Injection.sl<LoginController>());
}
