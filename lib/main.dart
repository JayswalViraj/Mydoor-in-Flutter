// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:project_one/firsttimeotp/firsttimeotp.dart';

import 'package:project_one/forgetpasswordpages/changepassword.dart';
import 'package:project_one/forgetpasswordpages/enterotp.dart';
import 'package:project_one/forgetpasswordpages/forgetpassword.dart';
import 'package:project_one/SelectPlace.dart';
import 'package:project_one/network_dropdown.dart';
import 'package:project_one/registerform.dart';

import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';

import 'package:project_one/homepage.dart';
import 'package:project_one/forgetpasswordpages/passwordchangesuccess.dart';
import 'package:project_one/forgetpasswordpages/selectaccount.dart';

import 'package:project_one/signinpage/signin.dart';
import 'package:project_one/signuppage/signup.dart';
import 'package:transition/transition.dart';
import 'dependentdropdown.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(NewApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onIntroEnd(context) {

  }

  List<PageViewModel> getIntro() {
    return [
      PageViewModel(
          image: Image.asset(
            'assets/introductionscreen/intro1.jpg',
            width: 300,
            height: 300,
          ),
          title: "Shop at great deal",
          body: '',
          decoration: PageDecoration(contentMargin: EdgeInsets.all(30))),
      PageViewModel(
          image: Image.asset(
            'assets/introductionscreen/intro2.jpg',
            width: 300,
            height: 300,
          ),
          title: "Connect with your neighbour",
          body: '',
          decoration: PageDecoration(contentMargin: EdgeInsets.all(30))),
      PageViewModel(
          image: Image.asset(
            'assets/introductionscreen/intro3.png',
            width: 300,
            height: 300,
          ),
          title: "Resolve complaint quickly",
          body: "",
          decoration: PageDecoration(contentMargin: EdgeInsets.all(30))),
      PageViewModel(
        image: Image.asset(
          'assets/introductionscreen/intro4.png',
          width: 300,
          height: 300,
        ),
        title: "Every service at your doorstep easily",
        decoration: PageDecoration(contentMargin: EdgeInsets.all(0)),
        body: '',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: IntroductionScreen(
                  color: Colors.red,
                  dotsDecorator: DotsDecorator(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      size: Size(20.0, 10.0),
                      activeSize: Size(30.0, 10.0),
                      activeColor: Colors.orange,
                      color: Colors.white,
                      spacing: EdgeInsets.symmetric(horizontal: 3.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                  done: Text
                    (
                    "Start>>",

                  ),
showDoneButton: true,
                  doneColor: Colors.orange,
                  onDone: () {
  Navigator.push(context, Transition(child:SigninDetails(),transitionEffect: TransitionEffect.RIGHT_TO_LEFT,));
                  },
                  pages: getIntro(),
                  showNextButton: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewApp extends StatefulWidget {
  @override
  _NewAppState createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: 'intropage',
        theme: ThemeData(
          textTheme: TextTheme(
            //headline1: TextStyle(color: Colors.white, fontSize: 20.sp,fontWeight: FontWeight.bold,),

            headline1: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(color: Colors.white, fontSize: 15.sp),
            headline3: TextStyle(color: Colors.black12, fontSize: 13.sp),
            headline4: TextStyle(
              color: Colors.orange,
              fontSize: 10.sp,
            ),

            headline5: TextStyle(
                fontSize: 10.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            button: TextStyle(fontSize: 10.sp, color: Colors.white),
          ),
        ),
        routes: {
          'intropage': (context) => MyApp(),
          'signindetailspage': (context) => SigninDetails(),
          'signuppage': (context) => SignUp(),
          'forgetpasswordpage': (context) => ForgetPassword(),
          'createnewaccount': (context) => FirsttimeOtpDetails(),
          'homepage': (context) => HomePage(),
          'selectaccount': (context) => AccountDetails(),
          'enterotppage': (context) => EnterOtp(),
          "changepasswordpage": (context) => ChangePassword(),
          "passwordchangesuccess": (context) => PasswordChangedDetails(),
          "selectplace": (context) => SelectPlace(),
          "registrationpage": (context) => RegistrationForm(),
        },
      );
    });
  }
}
