import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:project_one/demonivigation.dart';

import 'package:project_one/drawer/drawer.dart';
import 'package:project_one/statemanagement/sidedrawerprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:spring/spring.dart';

import 'managementcommittee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? dropdownValue;
  bool count=true;
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 25.sp, color: Colors.black)),
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
                decoration: TextDecoration.underline),
            headline2: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            headline4: TextStyle(color: Colors.black, fontSize: 8.sp),
            headline3: TextStyle(
              color: Colors.black,
              fontSize: 10.sp,
            ),
            headline6: TextStyle(color: Colors.black, fontSize: 15.sp),
            headline5: TextStyle(color: Colors.black, fontSize: 17.sp),
          ),
        ),
        home: Scaffold(
          drawer: DrawerMenu(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Mydoor'),
            actions: [
              Container(
                child: Image.asset(
                  "assets/user/user.png",
                  height: 70,
                ),
                margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
              ),
            ],
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: ChangeNotifierProvider<SidedrawerProvider>(
              create: (context) => SidedrawerProvider(),
              child: Consumer<SidedrawerProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spring.fadeIn(
                          delay: Duration(milliseconds: 100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 1.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(
                                      0.0, 1.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            width: 70,
                            child: Column(
                              children: [

                                Spring.slide(
                                  withFade: true,
                                  delay: Duration(milliseconds: 100),
                                  child: InkWell(
                                    onTap: () {
                                  print("go to mangaement screen");
                                    },
                                    child: Container(
                                        child: Image.asset(
                                          "assets/drawericon/add.png",
                                          width: 130,
                                        )),
                                  ),
                                  slideType: SlideType.slide_in_bottom,
                                ),
                                Spring.slide(
                                    withFade: true,
                                    delay: Duration(milliseconds: 100),
                                    child: InkWell(
                                      onTap: () {
                                        provider.home();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: provider.selectedContainer ==
                                              containers.ehome
                                              ? Colors.orange
                                              : Colors.white,
                                        ),
                                        child: Image.asset(
                                            "assets/drawericon/home.png"),
                                        margin: EdgeInsets.only(
                                            top: 30, right: 15, left: 15, bottom: 25),
                                      ),


                                    ),

                                    slideType: SlideType.slide_in_top),
                                Spring.slide(
                                    withFade: true,
                                    delay: Duration(milliseconds: 100),


                                    child: InkWell(
                                        onTap: () {
                                          provider.activity();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: provider.selectedContainer ==
                                                containers.eactivity
                                                ? Colors.orange
                                                : Colors.white,
                                          ),
                                          child: Image.asset(
                                              "assets/drawericon/activity.png"),
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              right: 15,
                                              left: 15,
                                              bottom: 25),
                                        )
                                    ), slideType: SlideType.slide_in_top),
                                Spring.slide(

                                    withFade: true,
                                    delay: Duration(milliseconds: 100),
                                    child: InkWell(
                                        onTap: () {
                                          provider.household();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: provider.selectedContainer ==
                                                containers.ehousehold
                                                ? Colors.orange
                                                : Colors.white,
                                          ),
                                          child: Image.asset(
                                              "assets/drawericon/household.png"),
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              right: 15,
                                              left: 15,
                                              bottom: 25),
                                        )),
                                    slideType: SlideType.slide_in_top),
                                Spring.slide(
                                    withFade: true,
                                    delay: Duration(milliseconds: 100),

                                    child: InkWell(
                                        onTap: () {
                                          provider.community();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: provider.selectedContainer ==
                                                containers.ecommunity
                                                ? Colors.orange
                                                : Colors.white,
                                          ),
                                          child: Image.asset(
                                              "assets/drawericon/community.png"),
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              right: 15,
                                              left: 15,
                                              bottom: 25),
                                        )
                                    ),
                                    slideType: SlideType.slide_in_top),
                              ],
                            ),
                          ),
                        ),
                        provider.switching(),
                      ],
                    );
                  }

              ),

            ),

          ),
        ));
  }
}
