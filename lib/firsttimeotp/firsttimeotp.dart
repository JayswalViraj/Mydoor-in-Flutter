import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_one/SelectPlace.dart';

import 'package:project_one/forgetpasswordpages/forgetpassword.dart';
import 'package:project_one/signinpage/signin.dart';
import 'package:project_one/signuppage/signup.dart';
import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:project_one/statemanagement/enterotpscreen.dart';
import 'package:project_one/statemanagement/signinprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../homepage.dart';

enum LoginScreen { ENTER_MOBILE_NUMBER, ENTER_OTP_NUMBER }

class FirsttimeOtpDetails extends StatefulWidget {
  const FirsttimeOtpDetails({Key? key}) : super(key: key);

  @override
  _FirsttimeOtpDetailsState createState() => _FirsttimeOtpDetailsState();
}

class _FirsttimeOtpDetailsState extends State<FirsttimeOtpDetails> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  final _formkey = GlobalKey<FormState>();
  String currentText = "";

  TextEditingController phoneController = TextEditingController();


  final _formkey2 = GlobalKey<FormState>();

  LoginScreen currentState = LoginScreen.ENTER_MOBILE_NUMBER;

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationID = "";


  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {

        Navigator.pushNamed(context,  'selectplace');
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }

  showMobile(context) {
    return Stack(children: [
      Positioned(
        top: 0.sp,
        right: 55.sp,
        left: 55.sp,
        child: Spring.slide(
          withFade: true,
          slideType: SlideType.slide_in_top,
          child: Container(
            decoration: const BoxDecoration(
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
                child: Text("Create New Account",
                    style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,)),
          ),
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
                    margin: const EdgeInsets.all(30),
                    child: ChangeNotifierProvider<SigninProvider>(
                      create: (context) => SigninProvider(),
                      child: Column(
                        children: [
                          Spring.slide(
                            slideType: SlideType.slide_in_left,
                            withFade: true,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Colors.orange,
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
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
                                  label: Text("Mobile No",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ),
                              ),
                            ),
                          ),
                          Sizedbox(
                            width: 0.0,
                            height: 20.0,
                          ),
                          Spring.slide(
                            slideType: SlideType.slide_in_bottom,
                            withFade: true,
                            child: Bounceable(
                              onTap: () async {

                                await _auth.verifyPhoneNumber(
                                    phoneNumber: "+91${phoneController.text}",
                                    verificationCompleted:
                                        (phoneAuthCredential) async {},
                                    verificationFailed: (verificationFailed) {
                                      print(verificationFailed);
                                    },
                                    codeSent:
                                        (verificationID, resendingToken) async {
                                      setState(() {
                                        currentState =
                                            LoginScreen.ENTER_OTP_NUMBER;
                                        this.verificationID = verificationID;
                                      });
                                    },
                                    codeAutoRetrievalTimeout:
                                        (verificationID) async {});

                              },
                              child: SizedBox(
                                  height: 50, //height of button
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
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(2000),
                                            bottomLeft: Radius.circular(2000))),
                                    child: Center(
                                        child: Text(
                                      "Send OTP",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    )),
                                  )),
                            ),
                          ),
                          Sizedbox(
                            width: 0.0,
                            height: 20.0,
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
                                    child: Center(
                                        child: Text(
                                      "Sign in",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    )),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
    ]);
  }

  showOtp(context) {
    return Stack(children: [

      Positioned(
        top: 0.sp,
        right: 55.sp,
        left: 55.sp,
        child: Spring.slide(
          withFade: true,
          slideType: SlideType.slide_in_top,
          child: Container(
            decoration: const BoxDecoration(
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
                child: Text("Verification Code",textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1),),
          ),
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
                    margin: const EdgeInsets.all(30),
                    child: ChangeNotifierProvider<SigninProvider>(
                      create: (context) => SigninProvider(),
                      child: Column(
                        children: [
                          Text(
                            "Please enter the verification code",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Sizedbox(
                            width: 0.0,
                            height: 20.0,
                          ),
              ChangeNotifierProvider<EnterOtpFirstTimeProvider>(create: (context)=> EnterOtpFirstTimeProvider(),
              child:  Spring.slide(
                slideType: SlideType.slide_in_left,
                withFade: true,

                child: Consumer<EnterOtpFirstTimeProvider>(builder: (context, provider, child){
                  return PinCodeTextField(
                    keyboardType: TextInputType.number,
                    obscuringCharacter: "*",
                    blinkWhenObscuring: true,
                    cursorColor: Colors.deepOrangeAccent,
                    length: 6,
                    obscureText: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveFillColor: Colors.orange.shade300,
                      inactiveColor: Colors.orange.shade300,
                      selectedFillColor: Colors.orange.shade300,
                      selectedColor: Colors.deepOrangeAccent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.orange.shade300,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.orange.shade50,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: otpController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);

                      provider.nextValue(value);

                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  );
                })

              ), ),

                          Sizedbox(
                            width: 0.0,
                            height: 20.0,
                          ),
                          Spring.slide(
                            slideType: SlideType.slide_in_bottom,
                            withFade: true,
                            child: Bounceable(
                              onTap: () {
                                AuthCredential phoneAuthCredential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationID,
                                        smsCode: otpController.text);
                                signInWithPhoneAuthCred(phoneAuthCredential);
                              },
                              child: SizedBox(
                                  height: 50, //height of button
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
                                            bottomRight: Radius.circular(2000),
                                            bottomLeft: Radius.circular(2000))),
                                    child: Center(
                                        child: Text(
                                      "Submit",
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    )),
                                  )),
                            ),
                          ),
                          Sizedbox(
                            width: 0.0,
                            height: 20.0,
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
                                            bottomRight: Radius.circular(2000),
                                            bottomLeft: Radius.circular(2000))),
                                    child: Center(
                                        child: Text(
                                          "Sign in",
                                          style:
                                          Theme.of(context).textTheme.headline2,
                                        )),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
    ]);
  }
  @override

  @override
  Widget build(BuildContext context) {
    print("This is build method");
    return Scaffold(
      body: currentState == LoginScreen.ENTER_MOBILE_NUMBER
          ? showMobile(context)
          : showOtp(context),
    );
  }
}
