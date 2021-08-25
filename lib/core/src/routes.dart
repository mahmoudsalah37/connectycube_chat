import 'package:get/get.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/profile_user_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/welcome_new_user_page.dart';
import '../../features/chat/presentation/pages/channels_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/chat/presentation/pages/create_group_page.dart';
import '../../features/chat/presentation/pages/groups_page.dart';
import '../../features/chat/presentation/pages/users_page.dart';

class Routes {
  static const String splashPage = '/',
      loginPage = '/loginPage',
      registerPage = '/registerPage',
      welcomePage = '/welcomePage',
      channelsPage = '/channelsPage',
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
      GetPage(name: channelsPage, page: () => ChannelsPage()),
      GetPage(name: groupsPage, page: () => GroupsPage()),
      GetPage(name: personsPage, page: () => UsersPage()),
      GetPage(name: profileUserPage, page: () => ProfileUserPage()),
      GetPage(name: createGroupPage, page: () => CreateGroupPage()),
      GetPage(name: chatPage, page: () => ChatPage()),
    ];
  }
}
