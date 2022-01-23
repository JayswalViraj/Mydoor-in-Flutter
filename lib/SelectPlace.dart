import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:project_one/registerform.dart';
import 'package:project_one/signuppage/signup.dart';
import 'package:project_one/sizedbox/Sizedbox.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'package:http/http.dart' as http;

class SelectPlace extends StatefulWidget {
  const SelectPlace({Key? key}) : super(key: key);

  @override
  _SelectPlaceState createState() => _SelectPlaceState();
}

class _SelectPlaceState extends State<SelectPlace> {




  @override
  void initState() {
    super.initState();
    _getcityList();
  }

  //=============================================================================== Api Calling here

//CALLING STATE API HERE
// Get State information by API

  //======================================================= get City

  List? citiesList;
  String? _mycity;
  String stateInfoUrl = 'https://mygate.radheinfinity.com/api_city';
  _getcityList() async {
    await http
        .get(Uri.parse(
      stateInfoUrl,
    ))
        .then((response) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(response.body);
//      print(data);
        setState(() {
          citiesList = data['cities'];
        });
      } else {
        print(response.statusCode);
        print("problem");
      }
    });
  }

  //======================================================= get Area

  List? areasList;
  String? _myarea;
  String areaInfoUrl = 'https://mygate.radheinfinity.com/api_area';
  _getareaList() async {
    print("call");
    await http
        .get(
      Uri.parse(areaInfoUrl + "?city=" + _mycity.toString()),
    )
        .then((response) {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(response.body);

        setState(() {
          areasList = data['areas'];
        });
      } else {
        print("error");
        print(response.statusCode);
      }
    });
  }

  //======================================================= get Society

  List? societiesList;
  String? _mysociety;
  String societyInfoUrl = 'https://mygate.radheinfinity.com/api_society';
  _getsocietiesList() async {
    print("call");
    await http
        .get(
      Uri.parse(societyInfoUrl + "?area=" + _myarea.toString()),
    )
        .then((response) {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = json.decode(response.body);
        print(response.body);

        setState(() {
          societiesList = data['societies'];
        });
      } else {
        print("error");
        print(response.statusCode);
      }
    });
  }

  //======================================================= get Unit

  List? unitesList;
  String? _myunit;
  String unitInfoUrl = 'https://mygate.radheinfinity.com/api_unit';
  _getunitesList() async {
    print("call");
    await http
        .get(
      Uri.parse(unitInfoUrl + "?society=" + _mysociety.toString()),
    )
        .then((response) {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = json.decode(response.body);
        print(response.body);

        setState(() {
          print("setstse call 1");
          unitesList = data['units'];
          print("setstse call 2");
        });
      } else {
        print("error");
        print(response.statusCode);
      }
    });
  }

  //======================================================= get Flat

  List? flatesList;
  String? _myflat;
  String flatInfoUrl = 'https://mygate.radheinfinity.com/api_flat';
  _getflatesList() async {
    print("call");
    await http
        .get(
      Uri.parse(flatInfoUrl + "?unit=" + _myunit.toString()),
    )
        .then((response) {
      if (response.statusCode == 200) {
        print(response.statusCode);
        var data = json.decode(response.body);
        print(response.body);

        setState(() {
          print("setstse call 1");
          flatesList = data['flats'];
          print("setstse call 2");
        });
      } else {
        print("error");
        print(response.statusCode);
      }
    });
  }

  bool selected_society = false;
  bool selected_unit = false;
  bool selected_flat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                top: 590,
                left: 0,
                child: Container(
                  height: 90,
                  width: 105,
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
                                text: 'S',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.orangeAccent,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'elect ',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: 'P',
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          color: Colors.orange)),
                                  TextSpan(
                                    text: 'lace',
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Sizedbox(
                            height: 20.0,
                            width: 0.0,
                          ),
                          //======================================================== city

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,

                                      child: DropdownButton<String>(
                                        value: _mycity,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                        hint: Text(
                                          'Select Your City',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _myarea = null;
                                            _mysociety = null;
                                            _myunit = null;
                                            _myflat = null;
                                            _mycity = newValue!;
                                            _getareaList();
                                            selected_society = false;
                                            selected_unit = false;
                                            selected_flat = false;
                                            print(_mycity);
                                          });
                                        },
                                        items: citiesList?.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(item['name']),
                                            value: item['_id'].toString(),
                                          );
                                        }).toList() ??
                                            [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          //======================================================== area

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: _myarea,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                        hint: Text(
                                          'Select Your Area',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _mysociety = null;
                                            _myunit = null;
                                            _myflat = null;

                                            _myarea = newValue!;
                                            _getsocietiesList();
                                            selected_society = true;
                                            selected_unit = false;
                                            selected_flat = false;
                                            print(_myarea);
                                          });
                                        },
                                        items: areasList?.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(item['area']),
                                            value: item['_id'].toString(),
                                          );
                                        }).toList() ??
                                            [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          //======================================================== society

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: _mysociety,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                        hint: Text(
                                          'Select Your Socity',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        onChanged: selected_society
                                            ? (newValue) {
                                          setState(() {
                                            _myunit = null;
                                            _myflat = null;
                                            _mysociety = newValue!;
                                            _getunitesList();

                                            selected_society = true;
                                            selected_unit = true;
                                            selected_flat = false;
                                            print(_mysociety);
                                          });
                                        }
                                            : null,
                                        items: societiesList?.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(item['name']),
                                            value: item['_id'].toString(),
                                          );
                                        }).toList() ??
                                            [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          //======================================================== unit

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: _myunit,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        hint: Text(
                                          'Select Your Unit',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        onChanged: selected_unit
                                            ? (newValue) {
                                          setState(() {
                                            _myflat = null;

                                            _myunit = newValue!;
                                            _getflatesList();
                                            selected_society = true;
                                            selected_unit = true;
                                            selected_flat = true;
                                            print(_myunit);
                                          });
                                        }
                                            : null,
                                        items: unitesList?.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(item['unit']),
                                            value: item["_id"].toString(),
                                          );
                                        }).toList() ??
                                            [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          //======================================================== flat

                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1, horizontal: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.black38),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton<String>(
                                        value: _myflat,
                                        iconSize: 30,
                                        icon: (null),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.sp,
                                        ),
                                        hint: Text(
                                          'Select Your Flat',
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        onChanged: selected_flat
                                            ? (newValue) {
                                          setState(() {
                                            _myflat = newValue!;
                                            selected_society = true;
                                            selected_unit = true;
                                            selected_flat = true;

                                            print(_myflat);
                                          });
                                        }
                                            : null,
                                        items: flatesList?.map((item) {
                                          return DropdownMenuItem(
                                            child: Text(
                                                item['flat_no'].toString()),
                                            value:
                                            item["flat_id"].toString(),
                                          );
                                        }).toList() ??
                                            [],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Table(
                            children: [
                              TableRow(children: [
                                Bounceable(
                                    onTap: () async {
                                      Navigator.pushNamed(
                                          context, "registrationpage");
                                    },
                                    child: SizedBox(
                                        height: 50,
                                        //height of button
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
                                                  topRight:
                                                  Radius.circular(1000),
                                                  topLeft:
                                                  Radius.circular(1000),
                                                  bottomRight:
                                                  Radius.circular(1000),
                                                  bottomLeft:
                                                  Radius.circular(1000))),
                                          child: Center(
                                              child: Text(
                                                "Next",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white),
                                              )),
                                        )),
                                  ),

                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )) ,


            Positioned(
                top: 60,
                left: 20,
                right: 20,
                child: Container(
                  child: Text(
                    "Welcome to Mydoor",
                    style: TextStyle(color: Colors.white, fontSize: 15.sp),
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
                top: 660,
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
    );
  }
}
