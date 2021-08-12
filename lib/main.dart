import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';

import 'core/utils/configs.dart';

import 'core/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/src/routes.dart';
import 'core/utils/injection_container.dart';
import 'features/auth/domin/usecases/get_cache_user_usecase.dart';
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
    ConnectyCubeConfig.initial(
      onSessionRestore: () async {
        final getCacheUserUseCase = Injection.sl<GetCacheUserUseCase>();
        final user = await getCacheUserUseCase(params: NoParams());
        return createSession(user);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomsThemes.defaultThemeData,
      initialRoute: Routes.splashPage,
      getPages: Routes.setPages(),
      onInit: () => initControllers(),
      title: 'Chat',
    );
  }
}

void initControllers() {
  Get.lazyPut(() => Injection.sl<LoginController>());
}
