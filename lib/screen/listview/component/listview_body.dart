import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:providerbasis/modal/product.dart';
import 'package:providerbasis/screen/form/form_screen.dart';
import 'package:providerbasis/screen/listview/list_provider.dart';

import 'listView_detail.dart';




class ListViewBody extends StatefulWidget {
  final ListProvider provider;

   const ListViewBody({Key? key, required this.provider}) : super(key: key);


  @override
  State<ListViewBody> createState() => _ListViewBodyState();

}

class _ListViewBodyState extends State<ListViewBody> {
  late bool _isDataCalling;
  @override
  void initState() {
    _isDataCalling = true;
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        _isDataCalling =false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    return _isDataCalling
        ? listLoading(size)
        :listData(size, widget.provider,context);
  }
}


Widget listData(Size size, ListProvider provider, BuildContext context){

  return Container(
    height: size.height,
    child: Column(
      children: [
        SizedBox(height: 20,),
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormScreen(),));
        }, child: Text("Login")),
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: provider.productList.length,
            itemBuilder: (context, index){
              Product productItem = provider.productList[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListViewDetail(
                      provider:productItem
                  ),));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Skelton(choosePadding: false,width: 120,height: 130,child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset("${productItem.iamge}",fit: BoxFit.cover,)),),
                          // SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Skelton(choosePadding: false,child: Text("Euronews",style: TextStyle(fontSize: 17,color: Colors.red),),),
                                const SizedBox(height: 10,),
                                Skelton(choosePadding: false,child: Text("On polictics with Lisa Loureniani: Warren's growing crowds",style: TextStyle(fontSize: 20),),),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Expanded(child: Skelton(choosePadding: false,child: Text("Politics",style: TextStyle(color: Colors.blueAccent,),),)),
                                    SizedBox(width: 10,),
                                    Expanded(child: Skelton(choosePadding: false,child: Text("3m ago",style: TextStyle(color: Colors.black),),)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },),
        ),
      ],
    )
  );
}



Widget listLoading(Size size){
  return ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: 4,
    itemBuilder: (context, index){
      return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Skelton(width: 120,height: 120,),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    children: [
                      Skelton(width: 120,),
                      SizedBox(height: 10,),
                      Skelton(),
                      SizedBox(height: 10,),
                      Skelton(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    },);


}



class Skelton extends StatelessWidget {
  final double? width, height;
  Widget? child;
  EdgeInsetsGeometry? padding;
  bool? choosePadding;
   Skelton({Key? key,this.width ,this.height,this.child,this.padding ,this.choosePadding=true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:choosePadding== true?EdgeInsets.all(8):EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16)
      ),
      child: child,
    );
  }
}
