import 'dart:convert';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:project_one/api/api.dart';

import 'package:project_one/signinpage/signin.dart';
import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:project_one/statemanagement/signupprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';

import '../homepage.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final flat_idcontroller = TextEditingController();
  final unit_idcontroller = TextEditingController();
  final home_idcontroller = TextEditingController();
  final first_namecontroller = TextEditingController();
  final last_namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  String radioval = "owner";

  final _formkey = GlobalKey<FormState>();

  void dispose() {
    flat_idcontroller.dispose();
    unit_idcontroller.dispose();
    home_idcontroller.dispose();
    first_namecontroller.dispose();
    last_namecontroller.dispose();
    emailcontroller.dispose();
    mobilecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }
  radiovalue(var val) {
    radioval = val;
  }

  Future realapi() async {
    var url = Uri.parse('https://mygate.radheinfinity.com/api_user_signup');
    print(url);
    var response;
    response = await http.post(
      url,
      body: {
        "flat_id": flat_idcontroller.text,
        "unit_id": unit_idcontroller.text,
        "home_id": home_idcontroller.text,
        "first_name": first_namecontroller.text, //"riddhi",
        "last_name": last_namecontroller.text,
        "email": emailcontroller.text,
        "mobile": mobilecontroller.text,
        "password": passwordcontroller.text,
        "passwordConfirm": confirmpasswordcontroller.text,
        "property_type": radioval
      },
    );

    var data = jsonDecode(response.body);
    print(data);
    print(response.statusCode);
    if (response.statusCode == 202) {
      print(response.statusCode);
    }

    if (response.statusCode == 200) {
      print(response.statusCode);

      print("Pass");
      Navigator.pushNamed(context, "homepage");
    } else {
      print(response.statusCode);

      print("failed");
      print("Dart Message: your login alredy ");

      return AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'Sorry',
          desc: 'User has been already exist..!',
          btnOkOnPress: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
          },
          btnOkText: "Please Sign in",
          btnOkColor: Colors.red)
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: ThemeData(
            textTheme: TextTheme(
              headline1: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              headline4: TextStyle(color: Colors.white, fontSize: 10.sp),
              headline3: TextStyle(
                color: Colors.orange,
                fontSize: 10.sp,
              ),
            ),
          ),
          home: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepOrange,
                                  Colors.orange,
                                  Colors.orangeAccent,
                                ]),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/user/background.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepOrange,
                                  Colors.orange,
                                  Colors.orangeAccent,
                                ]),
                          ),
                        )),
                    Positioned(
                        top: 130,
                        left: 30,
                        right: 30,
                        child: SingleChildScrollView(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              margin: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Container(
                                    child: RichText(
                                      textAlign: TextAlign.end,
                                      text: TextSpan(
                                        text: 'R',
                                        style: TextStyle(
                                          fontSize: 30.sp,
                                          color: Colors.orangeAccent,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'egister ',
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: 'N',
                                              style: TextStyle(
                                                  fontSize: 30.sp,
                                                  color: Colors.orange)),
                                          TextSpan(
                                            text: 'ow',
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Sizedbox(
                                    height: 20.0,
                                    width: 0.0,
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: flat_idcontroller,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("Flat",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: home_idcontroller,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("Home No",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: unit_idcontroller,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("Unit",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: first_namecontroller,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("First Name",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: last_namecontroller,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("Last Name",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: emailcontroller,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("E-Mail",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Spring.slide(
                                          slideType: SlideType.slide_in_left,
                                          withFade: true,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Colors.orange,
                                              controller: mobilecontroller,
                                              keyboardType:
                                              TextInputType.number,
                                              inputFormatters: <
                                                  TextInputFormatter>[
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Username";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 0.h,
                                                    horizontal: 1.h),
                                                labelStyle: TextStyle(
                                                    color: Colors.orange),
                                                border: OutlineInputBorder(),
                                                focusedBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.orange,
                                                    )),
                                                label: Text("Mobile No",
                                                    style: TextStyle(
                                                        fontSize: 10.sp)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                  Container(
                                    child:
                                    ChangeNotifierProvider<SignupProvider>(
                                      create: (context) => SignupProvider(),
                                      child: Column(
                                        children: [
                                          Table(
                                            children: [
                                              TableRow(children: [
                                                Spring.slide(
                                                  slideType:
                                                  SlideType.slide_in_left,
                                                  withFade: true,
                                                  child: Padding(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 1.h,
                                                          horizontal: 1.h),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black38),
                                                            borderRadius:
                                                            BorderRadius
                                                                .all(Radius
                                                                .circular(
                                                                5))),
                                                        child: Consumer<
                                                            SignupProvider>(
                                                          builder: (BuildContext
                                                          context,
                                                              provider,
                                                              Widget? child) {
                                                            return Row(
                                                              children: [
                                                                Radio<
                                                                    SelectEnumOption>(
                                                                  fillColor: MaterialStateProperty
                                                                      .all(Colors
                                                                      .orange),
                                                                  value: provider
                                                                      .value1,
                                                                  groupValue:
                                                                  provider
                                                                      .character,
                                                                  onChanged:
                                                                      (SelectEnumOption?
                                                                  value) {
                                                                    provider.fun(
                                                                        value);
                                                                    provider
                                                                        .fun2();
                                                                    radiovalue(
                                                                        provider
                                                                            .enumval);
                                                                  },
                                                                ),
                                                                Text(
                                                                  "Owner",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      10.sp,
                                                                      color: Colors
                                                                          .orange),
                                                                ),
                                                                Radio<
                                                                    SelectEnumOption>(
                                                                  fillColor: MaterialStateProperty
                                                                      .all(Colors
                                                                      .orange),
                                                                  value: provider
                                                                      .value2,
                                                                  groupValue:
                                                                  provider
                                                                      .character,
                                                                  onChanged:
                                                                      (SelectEnumOption?
                                                                  value) {
                                                                    provider.fun(
                                                                        value);
                                                                    provider
                                                                        .fun2();
                                                                    radiovalue(
                                                                        provider
                                                                            .enumval);
                                                                  },
                                                                ),
                                                                Text(
                                                                  "Rent",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      10.sp,
                                                                      color: Colors
                                                                          .orange),
                                                                ),
                                                                //  Text(radioval),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      )),
                                                ),
                                              ]),
                                            ],
                                          ),
                                          Table(
                                            children: [
                                              TableRow(children: [
                                                Spring.slide(
                                                  slideType:
                                                  SlideType.slide_in_left,
                                                  withFade: true,
                                                  child:
                                                  Consumer<SignupProvider>(
                                                    builder: (context, provider,
                                                        child) {
                                                      return Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                        child: TextFormField(
                                                          cursorColor:
                                                          Colors.orange,
                                                          controller:
                                                          passwordcontroller,
                                                          obscureText: provider
                                                              .vieworhidepassword,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please Enter Username";
                                                            }
                                                          },
                                                          decoration:
                                                          InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(
                                                                vertical:
                                                                0.h,
                                                                horizontal:
                                                                1.h),
                                                            suffixIcon: provider
                                                                .vieworhidepassword
                                                                ? GestureDetector(
                                                              child:
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: 0
                                                                        .h,
                                                                    horizontal:
                                                                    1.h),
                                                                child: Image
                                                                    .asset(
                                                                  "assets/eyeshideview/hidepassword.png",
                                                                  width:
                                                                  3.w,
                                                                  height:
                                                                  3.h,
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                provider
                                                                    .viewPassword();
                                                              },
                                                            )
                                                                : GestureDetector(
                                                              child:
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: 0
                                                                        .h,
                                                                    horizontal:
                                                                    1.h),
                                                                child: Image
                                                                    .asset(
                                                                  "assets/eyeshideview/viewpassword.png",
                                                                  width:
                                                                  3.w,
                                                                  height:
                                                                  3.h,
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                provider
                                                                    .hidePassword();
                                                              },
                                                            ),
                                                            border:
                                                            const OutlineInputBorder(),
                                                            focusedBorder:
                                                            const OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color:
                                                                  Colors.orange,
                                                                )),
                                                            labelStyle: TextStyle(
                                                                color: Colors
                                                                    .orange),
                                                            label: Text(
                                                                "Password",
                                                                style: Theme.of(
                                                                    context)
                                                                    .textTheme
                                                                    .headline3),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                          Table(
                                            children: [
                                              TableRow(children: [
                                                Spring.slide(
                                                  slideType:
                                                  SlideType.slide_in_left,
                                                  withFade: true,
                                                  child:
                                                  Consumer<SignupProvider>(
                                                    builder: (context, provider,
                                                        child) {
                                                      return Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(8.0),
                                                        child: TextFormField(
                                                          cursorColor:
                                                          Colors.orange,
                                                          controller:
                                                          confirmpasswordcontroller,
                                                          obscureText: provider
                                                              .cvieworhidepassword,
                                                          validator: (value) {
                                                            if (value!
                                                                .isEmpty) {
                                                              return "Please Enter Username";
                                                            }
                                                          },
                                                          decoration:
                                                          InputDecoration(
                                                            contentPadding:
                                                            EdgeInsets.symmetric(
                                                                vertical:
                                                                0.h,
                                                                horizontal:
                                                                1.h),
                                                            suffixIcon: provider
                                                                .vieworhidepassword
                                                                ? GestureDetector(
                                                              child:
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: 0
                                                                        .h,
                                                                    horizontal:
                                                                    1.h),
                                                                child: Image
                                                                    .asset(
                                                                  "assets/eyeshideview/hidepassword.png",
                                                                  width:
                                                                  3.w,
                                                                  height:
                                                                  3.h,
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                provider
                                                                    .viewPassword();
                                                              },
                                                            )
                                                                : GestureDetector(
                                                              child:
                                                              Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: 0
                                                                        .h,
                                                                    horizontal:
                                                                    1.h),
                                                                child: Image
                                                                    .asset(
                                                                  "assets/eyeshideview/viewpassword.png",
                                                                  width:
                                                                  3.w,
                                                                  height:
                                                                  3.h,
                                                                ),
                                                              ),
                                                              onTap: () {
                                                                provider
                                                                    .hidePassword();
                                                              },
                                                            ),
                                                            border:
                                                            const OutlineInputBorder(),
                                                            focusedBorder:
                                                            const OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide(
                                                                  color:
                                                                  Colors.orange,
                                                                )),
                                                            labelStyle: TextStyle(
                                                                color: Colors
                                                                    .orange),
                                                            label: Text(
                                                                "Password",
                                                                style: Theme.of(
                                                                    context)
                                                                    .textTheme
                                                                    .headline3),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Sizedbox(
                                    height: 20.0,
                                    width: 0.0,
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        Spring.slide(
                                          slideType: SlideType.slide_in_bottom,
                                          withFade: true,
                                          child: Bounceable(
                                            onTap: () async {},
                                            child: SizedBox(
                                                height: 50, //height of button
                                                width: double.infinity,
                                                //width of button equal to parent widget
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                          Colors.deepOrange,
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
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          colors: [
                                                            Colors.orange,
                                                            Colors
                                                                .deepOrangeAccent,
                                                            Colors.orangeAccent
                                                          ]),
                                                      borderRadius: BorderRadius.only(
                                                          topRight:
                                                          Radius.circular(
                                                              1000),
                                                          topLeft: Radius.circular(
                                                              1000),
                                                          bottomRight:
                                                          Radius.circular(
                                                              1000),
                                                          bottomLeft:
                                                          Radius.circular(
                                                              1000))),
                                                  child: Center(
                                                      child: Text(
                                                        "Submit",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.white),
                                                      )),
                                                )),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        top: 530,
                        left: 0,
                        child: Container(
                          height: 90,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepOrange.shade100.withOpacity(0.5),
                                  Colors.orange.withOpacity(0.5),
                                  Colors.orangeAccent.withOpacity(0.5),
                                ]),
                          ),
                        )),
                    Positioned(
                        top: 60,
                        left: 20,
                        right: 20,
                        child: Container(
                          child: Text(
                            "Welcome to Mydoor",
                            style:
                            TextStyle(color: Colors.white, fontSize: 15.sp),
                          ),
                        )),
                    Positioned(
                        top: 100,
                        left: 10,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepOrange.shade100,
                                  Colors.orange,
                                  Colors.orangeAccent,
                                ]),
                          ),
                        )),
                    Positioned(
                        top: 330,
                        right: 0,
                        child: Container(
                          height: 90,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.deepOrange.shade100.withOpacity(0.5),
                                  Colors.orange.withOpacity(0.5),
                                  Colors.orangeAccent.withOpacity(0.5),
                                ]),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ));
    });
  }

}
