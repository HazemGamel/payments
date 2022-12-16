import 'package:flutter/material.dart';
import 'package:payment/presintison/registerScreen.dart';

import 'data/dioHelper.dart';

void main() async{
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}


