import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:http/http.dart' as http;

class SelectPlac extends StatefulWidget {
  const SelectPlac({Key? key}) : super(key: key);

  @override
  _SelectPlacState createState() => _SelectPlacState();
}

class _SelectPlacState extends State<SelectPlac> {
  String baseurl = "https://mygate.radheinfinity.com/api_city";
  String? valcity;
  List<dynamic> dataCityes = [];
  void getCityApi() async {
    final response = await http.get(Uri.parse(baseurl));
    Map<String, dynamic> listdata = jsonDecode(response.body);
    List<dynamic> data = listdata["cities"];
    print(data);

    setState(() {
      dataCityes = data;
    });
  }


  String baseurl2 = "https://mygate.radheinfinity.com/api_city";
  String? valarea;
  List<dynamic> dataarea = [];
  void getAreaApi() async {
    final response = await http.get(Uri.parse(baseurl2));
    Map<String, dynamic> listdataarea = jsonDecode(response.body);
    List<dynamic> dataarea = listdataarea["cities"];
    print(dataarea);

    setState(() {
      dataCityes = dataarea;
    });
  }

  @override
  void initState() {
    super.initState();
    getCityApi();
    getAreaApi();
  }

  List country_data = [];
  String? countryid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: Column(
          children: [
            DropdownButton(
              hint: Text("Select City"),
              value: valcity,
              items: dataCityes.map((value) {
                return DropdownMenuItem(
                  child: Text(value["name"]),
                  value: value["name"],
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  valcity = val as String?;
                });
              },
            ),
            DropdownButton(
              hint: Text("Select Area"),
              value: valarea,
              items: dataarea.map((value) {
                return DropdownMenuItem(
                  child: Text(value["name"]),
                  value: value["name"],
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  valcity = val as String?;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

//
//         If your response is a JSON object like
//
//         {
//         dataKey: [
//         {
//         key1: value1,
//         key2: value2,
//         key3: value3,
//         }
//         ]
//         }
//         Then json.decode will return a Map, not a List
//
//         Map<String, dynamic> map = json.decode(response.body);
//         List<dynamic> data = map["dataKey"];
//     print(data[0]["name"]);
}
