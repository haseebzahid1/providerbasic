import 'package:flutter/material.dart';

import '../../../modal/product.dart';


class ProductBody extends StatelessWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          width:size.width,
          color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child:GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85
                  ),
                  itemBuilder: (context, index){
                    Product productItem = productList[index];
                    return Container(
                      decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(

                          children: [

                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  productItem.iamge,width: size.width,height: size.height,fit: BoxFit.cover,)
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF343434).withOpacity(0.4),
                                    Color(0xFF343434).withOpacity(0.15),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                                  // height: 30,
                                  // width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple
                                  ),
                                  child: Text(productItem.title,style: TextStyle(fontSize: 18,color: Colors.white),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },)
          )
        ],
      ),
    ));
  }
}
