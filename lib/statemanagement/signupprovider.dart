import 'package:flutter/cupertino.dart';

enum SelectEnumOption{owner,rent}

class SignupProvider with ChangeNotifier {

String enumval = "owner";


  SelectEnumOption? character = SelectEnumOption.owner;

  var value1 = SelectEnumOption.owner;

  var value2 = SelectEnumOption.rent;

  void fun(value) {
    character = value;
    notifyListeners();
  }

  void fun2(){
    if(character == SelectEnumOption.owner){
      enumval = "owner";
    }
    else{
      enumval = "rent";
    }
  }



  // Password

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


  var cvieworhidepassword = true ;

  void chidePassword() {
    cvieworhidepassword =true;
    notifyListeners();
  }
  void cviewPassword(){
    cvieworhidepassword = false;
    notifyListeners();
  }



}
