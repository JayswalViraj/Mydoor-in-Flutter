import 'package:flutter/cupertino.dart';

class EnterOtpFirstTimeProvider with ChangeNotifier{

  var currentvalue ;



  void nextValue(var value) {

  currentvalue=value;
    notifyListeners();
  }


}