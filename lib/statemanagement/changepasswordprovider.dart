import 'package:flutter/cupertino.dart';

class ChangepasswordProvider with ChangeNotifier{

  var vieworhidepassword = true ;

  void hidePassword() {
    vieworhidepassword =true;
    notifyListeners();
  }
  void viewPassword(){
    vieworhidepassword = false;
    notifyListeners();
  }

  // Current Password


  var retypevieworhidepassword = true ;

  void retypehidePassword() {
    retypevieworhidepassword =true;
    notifyListeners();
  }
  void retypeviewPassword(){
    retypevieworhidepassword = false;
    notifyListeners();
  }
}