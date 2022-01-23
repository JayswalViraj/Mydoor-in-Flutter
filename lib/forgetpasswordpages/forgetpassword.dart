import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:project_one/forgetpasswordpages/selectaccount.dart';
import 'package:project_one/signinpage/signin.dart';
import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';

import '../homepage.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final mobileno = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [

      Positioned(
        top: 0.sp,
        right: 55.sp,
        left: 55.sp,
        child: Spring.slide(
          withFade: true,
          slideType: SlideType.slide_in_top,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.orange,
                        Colors.deepOrangeAccent,
                        Colors.orangeAccent
                      ]),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(2000),
                      bottomLeft: Radius.circular(2000))),
              width: 10.w,
              height:35.h,
              child: Center(
                  child: Text(
                "Forget Password",
                style: Theme.of(context).textTheme.headline1,
              ))),
        ),
      ),
      Positioned(
          top: 300,
          right: 10,
          left: 10,
          child: Container(
            child: Column(
              children: [
                Form(
                  key: _formkey,
                  child: Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Spring.slide(
                          slideType: SlideType.slide_in_left,
                          withFade: true,
                          child: TextFormField(
                            cursorColor: Colors.orange,
                            controller: mobileno,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Username";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.h, horizontal: 1.h),
                              labelStyle: TextStyle(color: Colors.orange),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.orange,
                              )),
                              label: Text(
                                "Mobile No",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          ),
                        ),
                        Sizedbox(
                          height: 20.0,
                          width: 0.0,
                        ),
                        Spring.slide(
                          slideType: SlideType.slide_in_bottom,
                          withFade: true,
                          child: Bounceable(
                            onTap: () {
                              Navigator.pushNamed(context, 'selectaccount');
                            },
                            child: SizedBox(
                                height: 50, //height of button
                                width: double.infinity,
                                //width of button equal to parent widget
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.deepOrange,
                                          offset: const Offset(
                                            1.0,
                                            1.0,
                                          ),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        //BoxShadow
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.orange,
                                            Colors.deepOrangeAccent,
                                            Colors.orangeAccent
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(2000),
                                          bottomLeft: Radius.circular(2000))),
                                  child: Center(
                                      child: Text("Search",
                                          style: Theme.of(context).textTheme.headline2)),
                                )),
                          ),
                        ),
                        Sizedbox(
                          height: 20.0,
                          width: 0.0,
                        ),
                        Spring.slide(
                          slideType: SlideType.slide_in_bottom,
                          withFade: true,
                          child: Bounceable(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                                height: 50, //height of button
                                width: double.infinity,
                                //width of button equal to parent widget
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.deepOrange,
                                          offset: const Offset(
                                            1.0,
                                            1.0,
                                          ),
                                          blurRadius: 5.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                        //BoxShadow
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.orange,
                                            Colors.deepOrangeAccent,
                                            Colors.orangeAccent
                                          ]),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(2000),
                                          topLeft: Radius.circular(2000),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Center(
                                      child: Text("Sign in",
                                          style: Theme.of(context).textTheme.headline2)),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
    ]));
  }
}
