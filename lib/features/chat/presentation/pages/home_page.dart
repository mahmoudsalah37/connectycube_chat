import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/core/utils/injection_container.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/delete_cache_user_usecase.dart';
import 'package:connectycube_chat/features/auth/presentation/getx/login_controller.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/routes.dart';
import '../../../../core/utils/resposive.dart';
import 'groups_page.dart';
import 'persons_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        try {
                          // final lo = Injection.sl<LoginController>();
                          final loginController = Get.find<LoginController>();
                          await loginController.logout(context);
                        } catch (e) {
                          Get.snackbar('error', '$e');
                        }
                      },
                      icon: Icon(Icons.logout)),
                  GestureDetector(
                    onTap: () async {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: res.size.width - 150,
                      decoration: BoxDecoration(
                        color: CustomColors.yellowLightColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: CustomColors.accentColor),
                          Text('Search...')
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.profileUserPage),
                    child: Hero(
                      tag: 'profile_hero',
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/test/person.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: res.getHeight(2)),
            Text('Recent Chat', style: theme.textTheme.headline2),
            Container(
              margin: EdgeInsets.all(14),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: CustomColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: CustomColors.accentColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                labelStyle: theme.textTheme.headline4,
                tabs: [
                  Tab(text: 'Chats'),
                  Tab(text: 'Groups'),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  PersonsPage(),
                  GroupsPage(),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.createGroupPage),
        backgroundColor: CustomColors.primaryColor,
        child: Icon(Icons.add, size: 40, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
