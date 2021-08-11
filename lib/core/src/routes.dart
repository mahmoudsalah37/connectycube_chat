import 'package:connectycube_chat/features/auth/presentation/pages/login_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/register_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/splash_page.dart';
import 'package:connectycube_chat/features/auth/presentation/pages/welcome_new_user_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/chat_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/groups_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/home_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/persons_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/profile_user_page.dart';
import 'package:connectycube_chat/features/chat/presentation/pages/create_group_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashPage = '/',
      loginPage = '/loginPage',
      registerPage = '/registerPage',
      welcomePage = '/welcomePage',
      homePage = '/homePage',
      groupsPage = '/groupsPage',
      personsPage = '/personsPage',
      profileUserPage = '/profileUserPage',
      createGroupPage = '/searchPage',
      chatPage = '/chatPage';
  //All Routes
  static List<GetPage> setPages() {
    return <GetPage>[
      GetPage(name: splashPage, page: () => SplashPage()),
      GetPage(name: loginPage, page: () => LoginPage()),
      GetPage(name: registerPage, page: () => RegisterPage()),
      GetPage(name: welcomePage, page: () => WelcomeNewUserPage()),
      GetPage(name: homePage, page: () => HomePage()),
      GetPage(name: groupsPage, page: () => GroupsPage()),
      GetPage(name: personsPage, page: () => PersonsPage()),
      GetPage(name: profileUserPage, page: () => ProfileUserPage()),
      GetPage(name: createGroupPage, page: () => CreateGroupPage()),
      GetPage(name: chatPage, page: () => ChatPage()),
    ];
  }
}
