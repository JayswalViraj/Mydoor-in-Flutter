import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/forgetpasswordpages/passwordchangesuccess.dart';

import 'package:project_one/sizedbox/Sizedbox.dart';
import 'package:project_one/statemanagement/changepasswordprovider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final newpassword = TextEditingController();

  final retypenewpassword = TextEditingController();



  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.orange,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.orange,),
            onPressed: () {

            },
          ),
        ),
        body: SingleChildScrollView(
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
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                children: [
                  Container(
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
                                Sizedbox(
                                  height: 20.0,
                                  width: 0.0,
                                ),
                                Text(
                                  "Create New Password",
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
                                ChangeNotifierProvider(
                                  create: (context) => ChangepasswordProvider(),
                                  child: Container(
                                    child: Consumer<ChangepasswordProvider>(
                                      builder: (BuildContext context, provider,
                                          Widget? child) {
                                        return Column(
                                          children: [
                                            TextFormField(
                                              cursorColor: Colors.orange,
                                              obscureText:
                                                  provider.vieworhidepassword,
                                              controller: newpassword,
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
                                                    "New Password",
                                                    style:TextStyle(fontSize: 10.sp,color: Colors.orange)
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              cursorColor: Colors.orange,
                                              obscureText: provider
                                                  .retypevieworhidepassword,
                                              controller: retypenewpassword,
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
                                                    "Confirm Password",
                                                    style:TextStyle(fontSize: 10.sp,color: Colors.orange)
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Sizedbox(
                                  height: 20.0,
                                  width: 0.0,
                                ),
                                Container(
                                  width: 200,
                                  height: 50,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(10.sp),
                                          shadowColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.orange),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.sp),
                                          ))),
                                      onPressed: () {

                                       Navigator.pushNamed(context,"passwordchangesuccess");
                                      },
                                      child: Text("Submit",style: TextStyle(fontSize: 12.sp),)),
                                ),
                                Sizedbox(
                                  height: 20.0,
                                  width: 0.0,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      );

  }
}

