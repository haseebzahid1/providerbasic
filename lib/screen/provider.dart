import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/provider/item_provider.dart';


class MyHomePageProvider extends StatefulWidget {
  const MyHomePageProvider({Key? key}) : super(key: key);

  @override
  _MyHomePageProviderState createState() => _MyHomePageProviderState();
}

class _MyHomePageProviderState extends State<MyHomePageProvider> {
  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final ddd = Provider.of<ItemsProvider>(context,listen: false);
    print(ddd);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Provider"),
        // leading: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            // color: Colors.red,
            width: double.infinity,
            child: Column(
              children: [
                TextFormField(
                  controller: _textEditingController,
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: (){
                      if(_textEditingController.text.isNotEmpty){
                        ddd.addItems(_textEditingController.text);
                      }
                      print(_textEditingController.text);
                    },
                    child: const Text("Add Items")
                ),
                Consumer<ItemsProvider>(builder: (context, data, _){
                  return Expanded(
                      child:ListView.builder(
                        itemCount: data.getItemData.length,
                        itemBuilder: (
                            context, index){
                          return   ListTile(
                            onTap: (){
                              data.incrementCounter(index);
                            },
                            title: Text("${data.getItemData[index]["title"]}"),
                            trailing:  CircleAvatar(
                              child: Text("${data.getItemData[index]["count"]}"),
                            ),
                          );
                        },
                      )
                  );
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
