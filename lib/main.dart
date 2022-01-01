import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerbasis/provider/item_provider.dart';
import 'package:providerbasis/screen/homepage.dart';
import 'package:providerbasis/screen/provider.dart';

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
      home: ChangeNotifierProvider.value(
        value: ItemsProvider(),
        child:  MyHomePageProvider(),
      ),
      // home: const HomePage(),
    );
  }
}
