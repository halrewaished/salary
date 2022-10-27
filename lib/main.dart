import 'package:expense_project/start.dart';
import 'package:expense_project/welcome.dart';
import 'package:flutter/material.dart';
import 'package:expense_project/colors.dart' as color;
import 'package:flutter/services.dart';

import 'home.dart';


void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: color.Colors.greenColor,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
          // primarySwatch: Colors.green,
        fontFamily: 'Inter',
          textTheme: TextTheme(
            headline1: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
            headline4: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            bodyText1: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            bodyText2: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
            subtitle1: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color.Colors.disableColor),
            subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color.Colors.greenColor),
          )
      ),
      home: HomePage(),
    );
  }
}
