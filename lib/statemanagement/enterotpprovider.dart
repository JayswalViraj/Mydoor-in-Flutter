import 'package:flutter/cupertino.dart';

class EnterotpProvider with ChangeNotifier{

  var vieworhidepassword = true ;


  void hidePassword() {
    vieworhidepassword =true;
    notifyListeners();
  }
  void viewPassword(){
    vieworhidepassword = false;
    notifyListeners();
  }

}