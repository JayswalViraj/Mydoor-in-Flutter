import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:spring/spring.dart';
class DemoNav extends StatefulWidget {
  const DemoNav({Key? key}) : super(key: key);

  @override
  _DemoNavState createState() => _DemoNavState();
}

class _DemoNavState extends State<DemoNav> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [

          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Spring.scale(
              start: 0,
              end: 1,
              delay: Duration(milliseconds: 100),
              child: TextFormField(
                  enableInteractiveSelection: false,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.orange,
                          )),
                      prefixIcon: IconButton(
                          focusColor: Colors.orange,
                          onPressed: () {},
                          icon:
                          Icon(Icons.search_rounded, color: Colors.black)),
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Spring.slide(
            withFade: true,
            delay: Duration(seconds: 1),
            child: ListTile(
              title: Text(
                "Notice",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "View All",
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
            slideType: SlideType.slide_in_top,
          ),
          Container(
            height: 190,
            child: Spring.slide(
              delay: Duration(seconds: 1),
              withFade: true,
              slideType: SlideType.slide_in_right,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 300,
                    child: Bounceable(
                      duration: Duration(seconds: 1),
                      onTap: () {},
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "All the announcement and \nNotice over here",
                                style: TextStyle(fontSize: 15),
                              ),
                            )),
                        color: Color.fromRGBO(250, 209, 178, 1),
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {},
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "All the announcement and \nNotice over here",
                              style: TextStyle(fontSize: 15),
                            ),
                          )),
                      color: Color.fromRGBO(250, 209, 178, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spring.slide(
            withFade: true,
            slideType: SlideType.slide_in_top,
            delay: Duration(seconds: 1),
            child: ListTile(
              title: Text(
                "Visitors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "View All",
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 190,
            child: Spring.slide(
              delay: Duration(seconds: 1),
              withFade: true,
              slideType: SlideType.slide_in_right,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Spring.slide(
                      slideType: SlideType.slide_in_right,
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
                          child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ListTile(
                                title: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Pre-approval",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              )),
                        ),
                        color: Color.fromRGBO(250, 209, 178, 1),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
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
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: ListTile(
                              title: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Pre-approval",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            )),
                      ),
                      color: Color.fromRGBO(250, 209, 178, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spring.slide(
            withFade: true,
            slideType: SlideType.slide_in_top,
            delay: Duration(seconds: 1),
            child: ListTile(
              title: Text(
                "Society Marketplace",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "View All",
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            child: Spring.slide(
              withFade: true,
              slideType: SlideType.slide_in_right,
              delay: Duration(seconds: 1),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 230,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(70),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ListTile(
                            title: Text(
                              "Buy and Sell",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      color: Color.fromRGBO(250, 209, 178, 1),
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(70),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ListTile(
                            title: Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      color: Color.fromRGBO(250, 209, 178, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 100,
            child: Spring.slide(
              withFade: true,
              slideType: SlideType.slide_in_right,
              delay: Duration(seconds: 1),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 230,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(70),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ListTile(
                            title: Text(
                              "Home Solutions",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      color: Color.fromRGBO(250, 209, 178, 1),
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(70),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: ListTile(
                            title: Text(
                              "Emergency",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      color: Color.fromRGBO(250, 209, 178, 1),
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
