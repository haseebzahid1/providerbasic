import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/provider/home_provider.dart';
import '../style/constent.dart';
import '../widget/rounded_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   final provider = Provider.of<HomePageProvider>(context);
      print(provider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ram",style: TextStyle(fontSize: 28),),
                  Row(
                    children: [
                      RoundIconButton(icon: Icons.remove, onPress: provider.decrement,
                        btnTextColor: Colors.white,btnColor: Colors.blueAccent,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text(provider.counter.toString(),
                          style: TextStyle(color:
                          provider.counter==0?Colors.black:provider.counter>0?Colors.green:Colors.red,
                               fontSize: 28),),
                      ),
                      RoundIconButton(icon:Icons.add, onPress:provider.increment,
                        btnTextColor: Colors.white,btnColor: Colors.blueAccent,),
                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: provider.counter<0?true:false,
                      child: Text("Set to Positive",style: kTextStyle,),
                  ),
                  ElevatedButton(
                      onPressed:provider.counter>=0?null
                          :(){
                        provider.counterReset();
                        print("click");
                      },
                      child: Text("0 Plus"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: kTextStyle),
                  GestureDetector(
                    onTap: provider.counterReset,
                    // onTap: counter < 0 ? null : counterReset,
                      child: Text("Reset",style: kTextStyle),
                  ),
                  Text(
                    provider.totalClick.toString(), style: kTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

