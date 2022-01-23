import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/forgetpasswordpages/enterotp.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';

import 'forgetpassword.dart';



class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
            elevation: 0.0,
            titleTextStyle: TextStyle(fontSize: 13.sp),
            backgroundColor: Colors.orange,

          title: Text("Select your account"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);


            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.orangeAccent,
          ])),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Spring.slide(
                delay: Duration(milliseconds: 100),
                withFade: true,
                slideType: SlideType.slide_in_bottom,
                child: Container(
                  height: 80,
                  margin: EdgeInsets.all(15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          "assets/user/user.png",
                          width: 10.w,
                          height: 10.h,
                        ),
                        title: Text("Username",style: Theme.of(context).textTheme.headline5,),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10.sp),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.black),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.orange),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.sp),
                              ))),
                          onPressed: () {
                            Navigator.pushNamed(context, "enterotppage");
                          },
                          child: Text("Send OTP",style: Theme.of(context).textTheme.button,),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );

  }
}
