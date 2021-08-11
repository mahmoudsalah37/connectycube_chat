import '../../../../core/src/colors.dart';
import '../../../../core/src/routes.dart';
import '../../../../core/utils/resposive.dart';
import 'groups_page.dart';
import 'persons_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = Responsive(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     GestureDetector(
              //       onTap: () => Get.toNamed(Routes.homePage),
              //       child: Expanded(
              //         child: Container(
              //           padding: EdgeInsets.all(6),
              //           decoration: BoxDecoration(
              //             color: CustomColors.yellowLightColor,
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //           child: Row(
              //             children: [
              //               Icon(Icons.search, color: CustomColors.accentColor),
              //               Text('Search...')
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(50),
              //       child: Image.asset(
              //         'assets/images/toast_icon.png',
              //         fit: BoxFit.fill,
              //         width: 50,
              //       ),
              //     ),
              //   ],
              // ),
              // DefaultTabController(
              //   length: 2,
              //   child: Scaffold(
              //     appBar: AppBar(
              //       title: Text('Orders', style: theme.textTheme.headline3),
              //       centerTitle: true,
              //       shadowColor: Colors.transparent,
              //       bottom: TabBar(
              //         labelStyle: theme.textTheme.headline2,
              //         labelColor: Colors.black,
              //         isScrollable: true,
              //         indicatorColor: CustomColors.primaryColor,
              //         unselectedLabelColor: Colors.red[200],
              //         unselectedLabelStyle: theme.textTheme.headline1,
              //         tabs: [
              //           Tab(child: Text('Recent')),
              //           Tab(child: Text('Previous')),
              //         ],
              //       ),
              //     ),
              //     body: TabBarView(
              //       children: [
              //         PersonsPage(),
              //         GroupsPage(),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: CustomColors.primaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 36),
      ),
    );
  }
}
