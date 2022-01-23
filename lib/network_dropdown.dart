import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NetworkDropDown extends StatefulWidget {
  @override
  _NetworkDropDownState createState() => _NetworkDropDownState();
}

class _NetworkDropDownState extends State<NetworkDropDown> {
  void initState() {
    _getcityList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DropDownList REST API'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            //======================================================== city

            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Your City'),
                          onChanged: (newValue) {
                            setState(() {
                              _mycity = newValue!;
                              _getareaList();
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
              height: 30,
            ),

            //======================================================== area

            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Your Area'),
                          onChanged: (newValue) {
                            setState(() {
                              _myarea = newValue!;
                              _getsocietiesList();
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
              height: 30,
            ),

            //======================================================== society

            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Your Socity'),
                          onChanged: (newValue) {
                            setState(() {
                              _mysociety = newValue!;
                              _getunitesList();
                              print(_mysociety);
                            });
                          },
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
              height: 30,
            ),

            //======================================================== unit

            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Your Unit'),
                          onChanged: (newValue) {
                            setState(() {
                              _myunit = newValue!;
                              _getflatesList();
                              print(_myunit);
                            });
                          },
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
              height: 30,
            ),

            //======================================================== flat

            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5),
              color: Colors.white,
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
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text('Select Your flat'),
                          onChanged: (newValue) {
                            setState(() {
                              _myflat = newValue!;

                              print(_myflat);
                            });
                          },
                          items: flatesList?.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item['flat_no'].toString()),
                                  value: item["flat_id"].toString(),
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
          ],
        ),
      ),
    );
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
}
