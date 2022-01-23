import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/forgetpasswordpages/changepassword.dart';

import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:project_one/statemanagement/enterotpprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EnterOtp extends StatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  _EnterOtpState createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final username = TextEditingController();

  final password = TextEditingController();

  final confirmpassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.orange,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {

              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(

                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.orange,
                    Colors.orangeAccent,
                  ])),
              child:
                  Column( children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                              Text(
                                "OTP Verification",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                              Image.asset(
                                "assets/user/user.png",
                                width: 100,
                                height: 100,
                              ),
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                              Text(
                                "Username",
                                style: TextStyle(fontSize: 13.sp),
                              ),
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                              ChangeNotifierProvider<EnterotpProvider>(
                                  create: (context) => EnterotpProvider(),
                                  child: Consumer<EnterotpProvider>(
                                    builder: (context, provider, child) {
                                      return TextFormField(
                                        cursorColor: Colors.orange,
                                        obscureText: provider.vieworhidepassword,
                                        controller: password,
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
                                              "Enter OTP",
                                              style: Theme.of(context).textTheme.headline4
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                              Container(
                                width: 200,
                                height: 50,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(10.sp),
                                        shadowColor: MaterialStateProperty.all(
                                            Colors.black),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.orange),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(40.sp),
                                        ))),
                                    onPressed: () {

                                    Navigator.pushNamed(context, "changepasswordpage");

                                    },
                                    child: Text("Verify",style: TextStyle(fontSize: 12.sp),)),
                              ),
                              Sizedbox(
                                height: 20.0,
                                width: 0.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
        ),
      );

  }
}

