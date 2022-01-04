import 'package:flutter/material.dart';
import 'screen/form/form_screen.dart';
import 'screen/homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // home: ProductBody(),
      // home: ChangeNotifierProvider.value(
      //   value: ListProvider(),
      //   child:  ListViewScreen(),
      // ),

    );
  }
}
