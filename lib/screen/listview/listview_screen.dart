import 'package:flutter/material.dart';

import 'component/listview_body.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back,color: Colors.black,)
        ),
        centerTitle: true,
        title: Text("ListView",style: TextStyle(color: Colors.black),),
      ),
      body: ListViewBody(),
    );
  }
}
