import 'package:flutter/material.dart';
import 'package:project_one/statemanagement/dropdownmenuprovider.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:spring/spring.dart';
class Activity extends StatelessWidget {


  bool count=true;
  @override
  Widget build(BuildContext context) {
    count= false;
    return Flexible(
      fit: FlexFit.loose,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 5),
            child: Center(
              child: Spring.slide(
                slideType: SlideType.slide_in_top,
                withFade: true,
                delay: Duration(seconds: 0),
                child: Container(
                  child: Column(
                    children: [


                      ChangeNotifierProvider<DropdownmenuProvider>(
                        create: (context)=>DropdownmenuProvider(),
                        child:Consumer<DropdownmenuProvider>(builder: (BuildContext context, provider, Widget? child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 35),
                                child: Spring.fadeIn(
                                  delay: Duration(seconds: 1),
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      "Filter",
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    value: provider.filterdropdownvalue,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    iconSize: 30,
                                    style:
                                    const TextStyle(color: Colors.deepPurple),
                                    onChanged: (String? newValue) {
                                      provider.filterDropdown(newValue!);

                                    },
                                    items: <String>[
                                      '1',
                                      '2',
                                      '3'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Spring.fadeIn(
                                delay: Duration(seconds: 1),
                                child: DropdownButton<String>(
                                  hint: Text(
                                    "Sort",
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  value: provider.sortdropdownvalue,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  iconSize: 30,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  onChanged: (String? newValue) {
                                    provider.sortDropdown(newValue!);



                                  },
                                  items: <String>[
                                    'A',
                                    'B',
                                    'C'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        },),

                      ),

                      Container(
                        color: Color.fromRGBO(250, 209, 178, 1),
                        height: 250,
                        child: Spring.slide(
                          slideType: SlideType.slide_in_bottom,
                          withFade: true,
                          delay: Duration(seconds: 1),
                          animDuration: Duration(seconds: 1),
                          child: Card(
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                leading: Image.asset(
                                                    "assets/user/user.png"),
                                                title: Text(
                                                  "Jhon",
                                                    style: Theme.of(context).textTheme.headline2
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(3.0),
                                                        child: Text(
                                                          " Left     ",
                                                            style: Theme.of(context).textTheme.headline3
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(90),
                                                        color: Color.fromRGBO(
                                                            169, 169, 169, 1),
                                                        border: Border.all(
                                                            color:
                                                            Color.fromRGBO(
                                                                169,
                                                                169,
                                                                169,
                                                                1)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text("08:34 pm", style: Theme.of(context).textTheme.headline3,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Text("Allowed By You",style: Theme.of(context).textTheme.headline3),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "    Call   ",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          color: Colors.black,
                                          height: 50,
                                          width: 1,
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Wrong Entry",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color.fromRGBO(250, 209, 178, 1),
                        height: 250,
                        child: Spring.slide(
                          slideType: SlideType.slide_in_bottom,
                          withFade: true,
                          delay: Duration(seconds: 1),
                          animDuration: Duration(seconds: 1),
                          child: Card(
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                leading: Image.asset(
                                                    "assets/user/user.png"),
                                                title: Text(
                                                    "Jhon",
                                                    style: Theme.of(context).textTheme.headline2
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(3.0),
                                                        child: Text(
                                                            " Left     ",
                                                            style: Theme.of(context).textTheme.headline3
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(90),
                                                        color: Color.fromRGBO(
                                                            169, 169, 169, 1),
                                                        border: Border.all(
                                                            color:
                                                            Color.fromRGBO(
                                                                169,
                                                                169,
                                                                169,
                                                                1)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text("08:34 pm", style: Theme.of(context).textTheme.headline4,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Text("Allowed By You",style: Theme.of(context).textTheme.headline4),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "    Call   ",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          color: Colors.black,
                                          height: 50,
                                          width: 1,
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Wrong Entry",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color.fromRGBO(250, 209, 178, 1),
                        height: 250,
                        child: Spring.slide(
                          slideType: SlideType.slide_in_bottom,
                          withFade: true,
                          delay: Duration(seconds: 1),
                          animDuration: Duration(seconds: 1),
                          child: Card(
                            margin: EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(70),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            elevation: 10,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                leading: Image.asset(
                                                    "assets/user/user.png"),
                                                title: Text(
                                                    "Jhon",
                                                    style: Theme.of(context).textTheme.headline2
                                                ),
                                                subtitle: Row(
                                                  children: [
                                                    Container(
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(3.0),
                                                        child: Text(
                                                            " Left     ",
                                                            style: Theme.of(context).textTheme.headline3
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(90),
                                                        color: Color.fromRGBO(
                                                            169, 169, 169, 1),
                                                        border: Border.all(
                                                            color:
                                                            Color.fromRGBO(
                                                                169,
                                                                169,
                                                                169,
                                                                1)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 25,
                                                    ),
                                                    Text("08:34 pm", style: Theme.of(context).textTheme.headline4,),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Text("Allowed By You",style: Theme.of(context).textTheme.headline4),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "    Call   ",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            )),
                                        Container(
                                          color: Colors.black,
                                          height: 50,
                                          width: 1,
                                        ),
                                        Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Wrong Entry",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 15.sp),
                                                ),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
