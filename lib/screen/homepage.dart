import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/provider/home_provider.dart';
import 'package:providerbasis/screen/form/form_screen.dart';
import 'package:providerbasis/screen/listview/component/listview_body.dart';
import 'package:providerbasis/screen/product/product_mainscreen.dart';
import '../style/constent.dart';
import '../widget/rounded_icon_button.dart';
import 'listview/listview_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<HomePageProvider>(
        create: (BuildContext context)=>HomePageProvider(),
      child:HomePageWidget(),
    );

  }
}


class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final provider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hard",style: TextStyle(fontSize: 28),),
                      Row(
                        children: [
                          RoundIconButton(icon: Icons.remove, onPress: provider.subdecrement,
                            btnTextColor: Colors.white,btnColor: Colors.blueAccent,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20),
                            child: Text(provider.subcounter.toString(),
                              style: TextStyle(color:
                              provider.subcounter==0?Colors.black:provider.subcounter>0?Colors.green:Colors.red,
                                  fontSize: 28),),
                          ),
                          RoundIconButton(icon:Icons.add, onPress:provider.subincrement,
                            btnTextColor: Colors.white,btnColor: Colors.blueAccent,),
                        ],
                      ),

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
              Column(
                children: [
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
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SubTotal",style: kTextStyle),
                      // GestureDetector(
                      //   onTap: (){},
                      //   // onTap: counter < 0 ? null : counterReset,
                      //   child: Text("Reset",style: kTextStyle),
                      // ),
                      Text("${provider.counter+provider.subcounter}", style: kTextStyle,
                      ),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductMainScreen()));
                        },
                        child: Text("GridView"),
                      ),
                      SizedBox(width: 30,),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormScreen()));
                        },
                        child: Text("Login",),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
