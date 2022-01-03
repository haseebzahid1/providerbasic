import 'package:flutter/material.dart';

import 'package:providerbasis/screen/listview/listview_screen.dart';

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
      home: ListViewScreen(),
      // home: ChangeNotifierProvider.value(
      //   value: FormProvider(),
      //   child:  FormScreen(),
      // ),
      // home: const HomePage(),
    );
  }
}
