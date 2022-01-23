import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class DrawerMenu extends StatefulWidget {


  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          InkWell(

            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            onTap: () {},
            child: Container(
              height: 100,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/m_add.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Add",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
          Spring.scale(
            delay: Duration(milliseconds: 1300),

            start: 0,
            end: 1,
            child: Divider(
              thickness: 2,
            ),),
          InkWell(
            onTap: () {},

            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/home.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
          Spring.scale(
            delay: Duration(milliseconds: 1300),

            start: 0,
            end: 1,
            child: Divider(
              thickness: 2,
            ),),
          InkWell(
            onTap: (){},
            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/activity.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Activity",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
          Spring.scale(
            delay: Duration(milliseconds: 1300),

            start: 0,
            end: 1,
            child: Divider(
              thickness: 2,
            ),),
          InkWell(
            onTap: (){},
            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/household.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Household",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
          Spring.scale(
            delay: Duration(milliseconds: 1300),

            start: 0,
            end: 1,
            child: Divider(
              thickness: 2,
            ),),
          InkWell(
            onTap: (){},
            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/community.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Community",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
          Spring.scale(
            delay: Duration(milliseconds: 1300),

            start: 0,
            end: 1,
            child: Divider(
              thickness: 2,
            ),),
          InkWell(
            onTap: (){},
            splashColor: Colors.orange,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Container(
              height: 80,
              child: Center(
                child: ListTile(
                  leading: Spring.scale(
                    delay: Duration(milliseconds: 900),
                    start: 0,
                    end: 1,

                    child: Image.asset(
                      "assets/drawericon/logout.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  title: Spring.slide(

                    delay: Duration(milliseconds: 100),

                    child: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.headline6,
                    ), slideType: SlideType.slide_in_left,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
