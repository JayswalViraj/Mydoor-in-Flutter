import 'package:flutter/cupertino.dart';
import 'package:project_one/activity/activity.dart';
import 'package:project_one/community/community.dart';
import 'package:project_one/home/home.dart';
import 'package:project_one/household/household.dart';
enum containers {ehome, eactivity, ehousehold, ecommunity, emenagementcommity}
class SidedrawerProvider with ChangeNotifier{

  containers? selectedContainer = containers.ehome;

  void home(){
    selectedContainer = containers.ehome;
    notifyListeners();
  }
  void activity(){
    selectedContainer = containers.eactivity;
    notifyListeners();
  }
  void household(){
    selectedContainer = containers.ehousehold;
    notifyListeners();
  }

  void community(){
    selectedContainer = containers.ecommunity;
    notifyListeners();
  }

  Widget switching() {
    switch (selectedContainer) {
      case containers.ehome:
        return Home();
      case containers.eactivity:
        return Activity();
      case containers.ehousehold:
        return HouseHold();
      case containers.ecommunity:
        return Community();
    }
    return Home();
  }

}