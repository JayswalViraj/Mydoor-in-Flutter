import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:project_one/demonivigation.dart';
import 'package:project_one/firsttimeotp/firsttimeotp.dart';
import 'package:project_one/forgetpasswordpages/forgetpassword.dart';
import 'package:project_one/home/home.dart';
import 'package:project_one/homepage.dart';

import 'package:project_one/signuppage/signup.dart';
import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:project_one/statemanagement/signinprovider.dart';
import 'package:provider/provider.dart';
import 'package:spring/spring.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';



class SigninDetails extends StatefulWidget  {
  const SigninDetails({Key? key}) : super(key: key);

  @override
  _SigninDetailsState createState() => _SigninDetailsState();
}

class _SigninDetailsState extends State<SigninDetails> {
  // Variable

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  Future loginapi() async {
    var url = Uri.parse('https://mygate.radheinfinity.com/api_user_signin');
    var response = await http.post(url, body: {
      "mobile": usernamecontroller.text,
      "password": passwordcontroller.text
    });
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);

     Navigator.pushNamed(context, 'homepage');
    } else if (response.statusCode == 401) {
      print(response.statusCode);
      print(response.body);

      return AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'Invalid Password',
          desc: "The password you entered is invalid. Please try again.",
          btnOkOnPress: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
          },
          btnOkText: "OK",
          btnOkColor: Colors.red)
        ..show();
    } else if (response.statusCode == 404) {
      print(response.statusCode);
      print(response.body);

      return AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'User Not Found',
          desc:
              "The username you entered doesn't appear to belong to an account. Please check your username and try again",
          btnOkOnPress: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
          },
          btnOkText: "OK",
          btnOkColor: Colors.red)
        ..show();
    } else {
      return AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'Server Error',
          btnOkOnPress: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
          },
          btnOkText: "OK",
          btnOkColor: Colors.red)
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("This is build method");
    return SafeArea(
      child: Scaffold(
          body: Stack(
              children: [
        Positioned(
          top: 0.sp,
          right: 55.sp,
          left: 55.sp,
          child:  Container(
              decoration:  BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.orange,
                        Colors.deepOrangeAccent,
                        Colors.orangeAccent
                      ]),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.sp),
                      topLeft: Radius.circular(10.sp),
                      bottomRight: Radius.circular(2000.sp),
                      bottomLeft: Radius.circular(2000.sp))),
              width: 10.w,
              height:35.h,
              child: Center(
                  child: Text(
                "Sign In",
                style: Theme.of(context).textTheme.headline1,
              )),
            ),

        ),
        Positioned(
            top: 230.sp,
            right: 10.sp,
            left: 10.sp,
            child: Container(
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                    child: Container(
                      margin: EdgeInsets.all(30.sp),
                      child: ChangeNotifierProvider<SigninProvider>(
                        create: (context) => SigninProvider(),
                        child: Column(
                          children: [
                           TextFormField(
                                keyboardType: TextInputType.phone,
                                cursorColor: Colors.orange,
                                controller: usernamecontroller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Username";
                                  }
                                },
                                decoration:  InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.h),

                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Mobile No",
                                    style: Theme.of(context).textTheme.headline4
                                  ),
                                ),

                            ),
                           SizedBox(
                             height: 2.h,
                           ),

                               Consumer<SigninProvider>(
                                builder: (context, provider, child) {
                                  return TextFormField(
                                    cursorColor: Colors.orange,
                                    obscureText: provider.vieworhidepassword,
                                    controller: passwordcontroller,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Password";
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.h),
                                      suffixIcon: provider.vieworhidepassword
                                          ? GestureDetector(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.h),
                                                child: Image.asset(
                                                  "assets/eyeshideview/hidepassword.png",
                                                  width: 3.w,
                                                  height: 3.h,
                                                ),
                                              ),
                                              onTap: () {
                                                provider.viewPassword();
                                              },
                                            )
                                          : GestureDetector(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 1.h),
                                                child: Image.asset(
                                                  "assets/eyeshideview/viewpassword.png",
                                                  width: 3.w,
                                                  height: 3.h,
                                                ),
                                              ),
                                              onTap: () {
                                                provider.hidePassword();
                                              },
                                            ),
                                      border: const OutlineInputBorder(),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.orange,
                                      )),
                                      labelStyle: TextStyle(color: Colors.orange),
                                      label: Text(
                                        "Password",
                                          style: Theme.of(context).textTheme.headline4
                                      ),
                                    ),
                                  );
                                },
                              ),

                          Sizedbox(
                            height: 2.h,
                          ),
                            Bounceable(
                                onTap: () {
                                  loginapi();
                                },
                                child: SizedBox(
                                    height: 6.h, //height of button
                                    width: double.infinity,
                                    //width of button equal to parent widget
                                    child: Container(
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.deepOrange,
                                              offset: Offset(
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
                                              topRight: Radius.circular(10.sp),
                                              topLeft: Radius.circular(10.sp),
                                              bottomRight: Radius.circular(2000.sp),
                                              bottomLeft: Radius.circular(2000.sp))),
                                      child: Center(
                                          child: Text(
                                        "Sign in",
                                        style: Theme.of(context).textTheme.headline2,
                                      )),
                                    )),
                              ),

                            SizedBox(
                              height: 2.h,
                            ),

                                 Bounceable(

                                    onTap: () {

                                   Navigator.pushNamed(context,  'forgetpasswordpage');

                                    },
                                    child: SizedBox(
                                      height: 15.h, //height of button
                                      width: 30.w,
                                      //width of button equal to parent widget
                                      child: Container(
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.deepOrange,
                                                  offset: Offset(
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
                                                  topRight: Radius.circular(100.sp),
                                                  topLeft: Radius.circular(100.sp),
                                                  bottomRight:
                                                      Radius.circular(100.sp),
                                                  bottomLeft:
                                                      Radius.circular(100.sp))),
                                          child:  Center(
                                              child: Text(
                                            "Forgot Password?",
                                                style: Theme.of(context).textTheme.headline2,
                                            textAlign: TextAlign.center,
                                          ))),
                                    )),


                            SizedBox(
                              height: 2.h,
                            ),



                               Bounceable(
                                onTap: () {

                                 Navigator.pushNamed(context,  'createnewaccount');

                                },
                                child: SizedBox(
                                    height: 6.h, //height of button
                                    width: double.infinity,
                                    //width of button equal to parent widget
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.deepOrange,
                                              offset: Offset(
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
                                      child:  Center(
                                          child: Text(
                                        "Create a new account",
                                            style: Theme.of(context).textTheme.headline2,
                                      )),
                                    )),
                              ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ])),
    );
  }
}
