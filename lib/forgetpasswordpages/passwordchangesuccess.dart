import 'package:flutter/material.dart';
import 'package:project_one/signinpage/signin.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';



class PasswordChangedDetails extends StatefulWidget {
  const PasswordChangedDetails({Key? key}) : super(key: key);

  @override
  _PasswordChangedDetailsState createState() => _PasswordChangedDetailsState();
}

class _PasswordChangedDetailsState extends State<PasswordChangedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.orange,
                  Colors.orangeAccent,
                ])),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spring.fadeIn(
            delay: Duration(seconds: 0),
            animDuration: Duration(seconds: 1),
            startOpacity: 0,
            endOpacity: 1,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Spring.slide(
                              slideType: SlideType.slide_in_top,
                              delay: Duration(seconds: 2),
                              child: Text(
                                "Password Changed Successfully",
                                style: TextStyle(fontSize: 15.sp),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Spring.scale(
                              start: 0,
                              end: 1,
                              delay: Duration(seconds: 1),
                              child: Image.asset(
                                "assets/successpassword/successicon.png",
                                width: 100,
                                height: 100,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Spring.slide(
                            slideType: SlideType.slide_in_bottom,
                            delay: Duration(seconds: 2),
                            child: Container(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(10),
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ))),
                                  onPressed: () {


                                    Navigator.pushNamed(context,"signindetailspage");

                                  },
                                  child: Text("Sign in",style: TextStyle(fontSize: 12.sp),)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
