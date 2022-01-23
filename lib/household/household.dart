import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';
import 'package:sizer/sizer.dart';

class HouseHold extends StatelessWidget {
  const HouseHold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Spring.slide(
            slideType: SlideType.slide_in_bottom,
            withFade: true,
            delay: Duration(seconds: 0),
            child: Container(
              color: Color.fromRGBO(250, 209, 178, 1),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    child: Spring.slide(
                      withFade: true,
                      delay: Duration(milliseconds: 500),
                      slideType: SlideType.slide_in_left,
                      child: Card(
                        margin: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(70),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        elevation: 10,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                            margin: EdgeInsets.all(20),
                                            child: ListTile(
                                              leading: Image.asset(
                                                  "assets/user/user.png"),
                                              title: Text(
                                                "Will Peterson",
                                                style: Theme.of(context).textTheme.headline2,
                                              ),
                                              subtitle: RichText(
                                                text: TextSpan(
                                                  text: '\t \t(Me)',
                                                  style: Theme.of(context).textTheme.headline4,
                                                  children:  <TextSpan>[
                                                    TextSpan(
                                                        text: '\n#354',
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 10.sp)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  color: Colors.black,
                                  height: 1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 40, top: 20, bottom: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Share Address",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Spring.fadeIn(
                            delay: Duration(milliseconds: 500),
                            child: Text(
                              "My Family",
                              style: Theme.of(context).textTheme.headline5,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 230,
                    child: Spring.slide(
                      withFade: true,
                      delay: Duration(milliseconds: 500),
                      slideType: SlideType.slide_in_right,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(70),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              elevation: 10,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.all(40),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Elle Peterson",
                                                    style: Theme.of(context).textTheme.headline2,
                                                  ),
                                                  Text(
                                                    "#123",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 30),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Call",
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 15.sp),
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            color: Colors.black,
                                            height: 50,
                                            width: 1,
                                          ),
                                          Container(
                                              margin:
                                              EdgeInsets.only(right: 30),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Share",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(70),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              elevation: 10,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.all(40),
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Elle Peterson",
                                                    style: Theme.of(context).textTheme.headline2,
                                                  ),
                                                  Text(
                                                    "#123",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 30),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Call",
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 15.sp),
                                                  ),
                                                ],
                                              )),
                                          Container(
                                            color: Colors.black,
                                            height: 50,
                                            width: 1,
                                          ),
                                          Container(
                                              margin:
                                              EdgeInsets.only(right: 30),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Share",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.sp),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Spring.fadeIn(
                            delay: Duration(milliseconds: 500),
                            child: Text(
                              "My House Help",
                              style: Theme.of(context).textTheme.headline5,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Spring.slide(
                          withFade: true,
                          delay: Duration(milliseconds: 500),
                          slideType: SlideType.slide_in_left,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add",
                                      style: TextStyle(fontSize: 25.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Spring.fadeIn(
                            delay: Duration(milliseconds: 500),
                            child: Text(
                              "Frequent Guest",
                              style: Theme.of(context).textTheme.headline5,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
