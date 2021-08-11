import 'package:connectycube_chat/features/auth/presentation/pages/login_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/register_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/splash_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/welcome_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/chat_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/groups_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/home_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/persons_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashPage = '/',
      loginPage = '/loginPage',
      registerPage = '/registerPage',
      welcomePage = '/welcomePage',
      homePage = '/homePage',
      groupsPage = '/groupsPage',
      personsPage = '/personsPage',
      chatPage = '/chatPage';
  //All Routes
  static List<GetPage> setPages() {
    return <GetPage>[
      GetPage(name: splashPage, page: () => SplashPage()),
      GetPage(name: loginPage, page: () => LoginPage()),
      GetPage(name: registerPage, page: () => RegisterPage()),
      GetPage(name: welcomePage, page: () => WelcomePage()),
      GetPage(name: homePage, page: () => HomePage()),
      GetPage(name: groupsPage, page: () => GroupsPage()),
      GetPage(name: personsPage, page: () => PersonsPage()),
      GetPage(name: chatPage, page: () => ChatPage()),
    ];
  }
}
