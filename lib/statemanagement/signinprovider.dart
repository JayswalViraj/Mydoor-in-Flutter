import 'package:flutter/cupertino.dart';

class SigninProvider with ChangeNotifier{
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
