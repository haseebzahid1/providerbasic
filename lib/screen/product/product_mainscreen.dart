import 'package:flutter/material.dart';

import 'components/product_body.dart';

class ProductMainScreen extends StatelessWidget {
  const ProductMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
        actions: [
          Icon(Icons.add_shopping_cart,color: Colors.black,),
          SizedBox(width: 10,),
          Icon(Icons.favorite_border,color: Colors.black,),
        ],
        backgroundColor: Colors.white,
        title: Text("CATEGORIES",style: TextStyle(color:Colors.black),),
      ),
      body: ProductBody(),
    );

  }
}
