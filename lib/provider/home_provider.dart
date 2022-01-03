import 'package:flutter/foundation.dart';

class HomePageProvider extends ChangeNotifier{

  int counter =0;
  int totalClick=0;
  int total = 0;
  int subcounter =0;



  void counterReset(){
      counter = 0;
      totalClick =0;
      notifyListeners();
  }

  void increment  () {
      totalClick++;
      counter++;
      notifyListeners();
      subTotal();
  }
  void decrement (){
      totalClick++;
      counter--;
      subTotal();
      notifyListeners();
  }

  void subTotal(){
   total= counter + subcounter;
    notifyListeners();
  }

  void subincrement(){
    subcounter++;
    totalClick++;
    notifyListeners();
    subTotal();
  }

  void subdecrement(){
    subcounter--;
    totalClick++;
    subTotal();
    notifyListeners();
  }

}