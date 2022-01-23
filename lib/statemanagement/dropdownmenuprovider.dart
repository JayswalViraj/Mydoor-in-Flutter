import 'package:flutter/cupertino.dart';

class DropdownmenuProvider with ChangeNotifier{

  String? filterdropdownvalue;

  void filterDropdown(String value){
    filterdropdownvalue = value;
    notifyListeners();
  }

  String? sortdropdownvalue;

  void sortDropdown(String value){
    sortdropdownvalue = value;
    notifyListeners();
  }


}