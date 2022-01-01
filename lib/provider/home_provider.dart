import 'package:flutter/foundation.dart';

class HomePageProvider extends ChangeNotifier{

  int counter =0;
  int totalClick=0;


  void counterReset(){
      counter = 0;
      totalClick =0;
      notifyListeners();
  }

  void increment  () {
      totalClick++;
      counter++;
      notifyListeners();
  }
  void decrement (){
      totalClick++;
      counter--;
      notifyListeners();
  }

}