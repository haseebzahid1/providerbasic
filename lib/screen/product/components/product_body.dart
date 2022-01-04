import 'package:flutter/material.dart';
import 'package:providerbasis/modal/product.dart';


class ProductBody extends StatelessWidget {
   ProductBody({Key? key}) : super(key: key);
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
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          width:size.width,
          color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child:GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.45,
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
                                  "${productItem.iamge}",width: size.width,height: size.height,fit: BoxFit.cover,)
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
                                  child: Text("${productItem.title}",style: TextStyle(fontSize: 18,color: Colors.white),),
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
