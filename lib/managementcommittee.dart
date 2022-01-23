import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/drawer/drawer.dart';
import 'package:spring/spring.dart';

class ManagementCommittee extends StatefulWidget {


  @override
  _ManagementCommitteeState createState() => _ManagementCommitteeState();
}

class _ManagementCommitteeState extends State<ManagementCommittee> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Spring.slide(
                    withFade: true,
                    delay: Duration(seconds: 2),
                    animDuration: Duration(seconds: 2),
                    slideType: SlideType.slide_in_top,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Management Committee ",
                              style:
                                  TextStyle(color: Colors.black38, fontSize: 25)),
                          WidgetSpan(
                            child: Container(
                                margin: EdgeInsets.only(left: 60),
                                child: Icon(Icons.arrow_forward_ios,color: Colors.black38, size: 20)),
                          ),
                        ],
                      ),
                    ),
                  )),
              Spring.scale(

                start: 0,
                end: 1,
                delay: Duration(seconds: 5),
                animDuration: Duration(seconds: 1),

                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                  child: Spring.slide(
                    withFade: true,
                    delay: Duration(seconds: 6),
                    animDuration: Duration(seconds: 2),
                    slideType: SlideType.slide_in_bottom,
                    child: Text(
                      "Buildings",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  )),
              Spring.scale(
                start: 0,
                end: 1,
                delay: Duration(seconds: 8),
                animDuration: Duration(seconds: 1),

                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              Container(
                  margin:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Spring.slide(

                    withFade: true,
                    delay: Duration(seconds: 10),
                    animDuration: Duration(seconds: 2),
                    slideType: SlideType.slide_in_bottom,

                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "A",
                              style:
                              TextStyle(color: Colors.black38, fontSize: 25)),
                          WidgetSpan(
                            child: Container(
                                margin: EdgeInsets.only(left: 325),
                                child: Icon(Icons.arrow_forward_ios, size: 20,color: Colors.black38,)),
                          ),
                        ],
                      ),
                    ),
                  )),

              Spring.scale(

                start: 0,
                end: 1,
                delay: Duration(seconds: 12),
                animDuration: Duration(seconds: 1),

                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              Container(
                  margin:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Spring.slide(
                    withFade: true,
                    delay: Duration(seconds: 14),
                    animDuration: Duration(seconds: 2),
                    slideType: SlideType.slide_in_bottom,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "B",
                              style:
                              TextStyle(color: Colors.black38, fontSize: 25)),
                          WidgetSpan(
                            child: Container(
                                margin: EdgeInsets.only(left: 325),
                                child: Icon(Icons.arrow_forward_ios, size: 20,color: Colors.black38,)),
                          ),
                        ],
                      ),
                    ),
                  )),

              Spring.scale(
                start: 0,
                end: 1,
                delay: Duration(seconds: 16),
                animDuration: Duration(seconds: 1),
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),

              Container(
                  margin:
                  EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
                  child: Spring.slide(

                    withFade: true,
                    delay: Duration(seconds: 18),
                    animDuration: Duration(seconds: 2),
                    slideType: SlideType.slide_in_bottom,

                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "C",
                              style:
                              TextStyle(color: Colors.black38, fontSize: 25)),
                          WidgetSpan(
                            child: Container(
                                margin: EdgeInsets.only(left: 325),
                                child: Icon(Icons.arrow_forward_ios, size: 20,color: Colors.black38,)),
                          ),
                        ],
                      ),
                    ),
                  )),

              Spring.scale(

                start: 0,
                end: 1,
                delay: Duration(seconds: 20),
                animDuration: Duration(seconds: 1),

                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),



            ],
          ),
          drawer: DrawerMenu(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Mydoor",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            actions: [
              Container(
                child: Image.asset(
                  "assets/icons/user.png",
                ),
                margin: EdgeInsets.only(right: 10, top: 10),
              )
            ],
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
        ),
      ),
    );
  }
}
