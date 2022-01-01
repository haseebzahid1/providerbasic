
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ItemsProvider extends ChangeNotifier{
  List<int> intList=[];
  int counter = 0;
  List _itemData = [];
  List get getItemData => _itemData;

  void addItems(String value,){
    _itemData.add({'title':value,"count":0});
   notifyListeners();
  }

  void incrementCounter(int index){
    _itemData[index]["count"]++;
    notifyListeners();
  }

}




//
// class A{
//   int a = 20;
// }

// class B extends A{
//   int b = 40;
//   B({
//     required this.b,
// });
// }
//
// var c =  B(b: 20);
