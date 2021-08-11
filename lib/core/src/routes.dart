import 'package:get/get.dart';

class Routes {
  static const String loginPage = '/',
      registerPage = '/registerPage',
      chatPage = '/chatPage';
  //All Routes
  static List<GetPage> setPages() {
    return <GetPage>[
      // GetPage(name: loginPage, page: () => LoginPage()),
      // GetPage(name: registerPage, page: () => RegisterPage()),
      // GetPage(name: chatPage, page: () => ChatPage()),
    ];
  }
}
