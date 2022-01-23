import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Spring.slide(
        slideType: SlideType.slide_in_bottom,
        withFade: true,
        delay: Duration(seconds: 0),
        child: Container(
          color: Color.fromRGBO(250, 209, 178, 1),
          child: Column(
            children: [
              Container(
                height: 220,
                child: Spring.slide(
                  slideType: SlideType.slide_in_right,
                  withFade: true,
                  delay: Duration(milliseconds: 500),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 20),
                        width: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/residents.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Residents",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "View society Residents and management commitee",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 20),
                        width: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/clean.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Residents",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "View society Residents and management commitee",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      width: 250,
                      child: Spring.slide(
                        slideType: SlideType.slide_in_right,
                        withFade: true,
                        delay: Duration(milliseconds: 1000),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/emergency-call.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Emergency",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "Emergency contacts for your society",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 220,
                child: Spring.slide(
                  withFade: true,
                  delay: Duration(milliseconds: 500),
                  slideType: SlideType.slide_in_right,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 20),
                        width: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/notice.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Notice",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "View society announcements",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 70, left: 20),
                        width: 250,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/chat.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Notice",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "View society announcements",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      width: 250,
                      child: Spring.slide(
                        slideType: SlideType.slide_in_right,
                        withFade: true,
                        delay: Duration(milliseconds: 1000),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Image.asset(
                                            "assets/icons/search.png",
                                            width: 40,
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(2),
                                          child: Text(
                                            "Documents",
                                            style: Theme.of(context).textTheme.headline2,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              child: Text(
                                                "Find and store society documents",
                                                style: Theme.of(context).textTheme.headline3,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
