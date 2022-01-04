import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/screen/listview/list_provider.dart';

import 'component/listview_body.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:ChangeNotifierProvider<ListProvider>(
        create:(context)=> ListProvider(),
        child:ListViewWidget(),
      ),
    );
  }
}


class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ListProvider>(context);
    return  Scaffold(
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
      body: ListViewBody(provider: _provider,),
    );
  }
}
