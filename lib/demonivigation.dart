import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:project_one/demonav1.dart';

import 'home/home.dart';

class DemoNevi extends StatefulWidget {
  const DemoNevi({Key? key}) : super(key: key);

  @override
  _DemoNeviState createState() => _DemoNeviState();
}

class _DemoNeviState extends State<DemoNevi> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Dashboard',
        onTap: () => page.jumpToPage(0),
        icon: Icons.home,
      ),
      SideMenuItem(
        priority: 1,
        title: 'Settings',
        onTap: () => page.jumpToPage(1),
        icon: Icons.settings,
      ),
      SideMenuItem(
        priority: 2,
        title: 'Exit',
        onTap: () {},
        icon: Icons.exit_to_app,
      ),
    ];

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                // page controller to manage a PageView
                controller: page,
                // will shows on top of all items, it can be a logo or a Title text

                // will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open

                // List of SideMenuItem to show them on SideMenu
                items: items,
              ),
              Expanded(
                child: PageView(
                  controller: page,
                  children: [
                    SingleChildScrollView(child: DemoNav()),
                    SingleChildScrollView(child: DemoNav()),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
