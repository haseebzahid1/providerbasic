import 'package:flutter/material.dart';
import 'package:providerbasis/modal/product.dart';

class ListProvider extends ChangeNotifier{

  List<Product> productList = [
    Product(
      title: "Flash Deal",
      iamge: "assets/images/Image Banner 2.png",
    ),Product(
      title: "Bill",
      iamge: "assets/images/Image Banner 3.png",
    ),Product(
      title: "Game",
      iamge: "assets/images/ladies_bags.jpg",
    ),Product(
      title: "Daily Gift",
      iamge: "assets/images/boy_showes.jpg",
    ),Product(
      title: "More",
      iamge: "assets/images/ladies_ring.jpg",
    ),Product(
      title: "More",
      iamge: "assets/images/ladies_ring2.jpg",
    ),
  ] ;


}