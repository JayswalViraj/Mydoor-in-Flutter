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


  @override
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

  @override
  Widget build(BuildContext context) {
    print("This is build method");
   return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Spring.slide(
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
                width: 240,
                height: 300,
                child: const Center(
                    child: Text("Sign Up",
                        style: TextStyle(fontSize: 35, color: Colors.white))),
              ),
            ),
            Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  children: [
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Username";
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Flat",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Username";
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Home No",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Username";
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Unit",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "First Name",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Last Name",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Email",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
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
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Username";
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(color: Colors.orange),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.orange,
                                  )),
                                  label: Text(
                                    "Mobile No",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Container(
                      child: ChangeNotifierProvider<SignupProvider>(
                        create: (context) => SignupProvider(),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                TableRow(children: [
                                  Spring.slide(
                                    slideType: SlideType.slide_in_left,
                                    withFade: true,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black38),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Consumer<SignupProvider>(
                                            builder: (BuildContext context,
                                                provider, Widget? child) {
                                              return Row(
                                                children: [
                                                  Radio<SelectEnumOption>(
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .all(Colors.orange),
                                                    value: provider.value1,
                                                    groupValue:
                                                        provider.character,
                                                    onChanged:
                                                        (SelectEnumOption?
                                                            value) {
                                                      provider.fun(value);
                                                      provider.fun2();
                                                      radiovalue(
                                                          provider.enumval);
                                                    },
                                                  ),
                                                  Text(
                                                    "Owner",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.orange),
                                                  ),
                                                  Radio<SelectEnumOption>(
                                                    fillColor:
                                                        MaterialStateProperty
                                                            .all(Colors.orange),
                                                    value: provider.value2,
                                                    groupValue:
                                                        provider.character,
                                                    onChanged:
                                                        (SelectEnumOption?
                                                            value) {
                                                      provider.fun(value);
                                                      provider.fun2();
                                                      radiovalue(
                                                          provider.enumval);
                                                    },
                                                  ),
                                                  Text(
                                                    "Rent",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.orange),
                                                  ),
                                                  Text(radioval),
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
                                    slideType: SlideType.slide_in_left,
                                    withFade: true,
                                    child: Consumer<SignupProvider>(
                                      builder: (context, provider, child) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            cursorColor: Colors.orange,
                                            controller: passwordcontroller,
                                            obscureText:
                                                provider.vieworhidepassword,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Username";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon: provider
                                                      .vieworhidepassword
                                                  ? GestureDetector(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.asset(
                                                          "assets/eyeshideview/hidepassword.png",
                                                          width: 4,
                                                          height: 4,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        provider.viewPassword();
                                                      },
                                                    )
                                                  : GestureDetector(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Image.asset(
                                                          "assets/eyeshideview/viewpassword.png",
                                                          width: 4,
                                                          height: 4,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        provider.hidePassword();
                                                      },
                                                    ),
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                color: Colors.orange,
                                              )),
                                              labelStyle: TextStyle(
                                                  color: Colors.orange),
                                              label: Text(
                                                "Password",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
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
                                    slideType: SlideType.slide_in_left,
                                    withFade: true,
                                    child: Consumer<SignupProvider>(
                                      builder: (context, provider, child) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            cursorColor: Colors.orange,
                                            controller:
                                                confirmpasswordcontroller,
                                            obscureText:
                                                provider.cvieworhidepassword,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Username";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  provider.cvieworhidepassword
                                                      ? GestureDetector(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                              "assets/eyeshideview/hidepassword.png",
                                                              width: 4,
                                                              height: 4,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            provider
                                                                .cviewPassword();
                                                          },
                                                        )
                                                      : GestureDetector(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Image.asset(
                                                              "assets/eyeshideview/viewpassword.png",
                                                              width: 4,
                                                              height: 4,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            provider
                                                                .chidePassword();
                                                          },
                                                        ),
                                              border:
                                                  const OutlineInputBorder(),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                color: Colors.orange,
                                              )),
                                              labelStyle: TextStyle(
                                                  color: Colors.orange),
                                              label: Text(
                                                "Current Password",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
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
                              onTap: () async {
                                realapi();
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
                                    child: const Center(
                                        child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    )),
                                  )),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    Sizedbox(
                      height: 20.0,
                      width: 0.0,
                    ),

                  ],
                ),
              ),
            ),
          ]),
        ),
      );

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

  radiovalue(var val) {
    radioval = val;
  }
}
