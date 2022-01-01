import 'package:flutter/material.dart';
import '../style/constent.dart';
import '../widget/rounded_icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    int counter =0;
    int totalClick=0;

    void counterReset(){
      setState(() {
        counter = 0;
        totalClick =0;
      });
    }

    void increment  () {
      setState(() {
        totalClick++;
        counter++;

      });
    }
    void decrement (){
      setState(() {
       totalClick++;
       counter--;
      });
    }
  @override
  Widget build(BuildContext context) {
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
                      RoundIconButton(icon: Icons.remove, onPress: decrement,
                        btnTextColor: Colors.white,btnColor: Colors.blueAccent,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child: Text(counter.toString(),
                          style: TextStyle(color:
                          counter==0?Colors.black:counter>0?Colors.green:Colors.red,
                               fontSize: 28),),
                      ),
                      RoundIconButton(icon:Icons.add, onPress:increment,
                        btnTextColor: Colors.white,btnColor: Colors.blueAccent,),
                    ],
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: counter<0?true:false,
                      child: Text("Set to Positive",style: kTextStyle,),
                  ),
                  ElevatedButton(
                      onPressed:counter>=0?null
                          :(){
                        counterReset();
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
                    onTap: counterReset,
                    // onTap: counter < 0 ? null : counterReset,
                      child: Text("Reset",style: kTextStyle),
                  ),
                  Text(
                    totalClick.toString(), style: kTextStyle,
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

