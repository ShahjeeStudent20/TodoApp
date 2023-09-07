import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/constants/colors.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: appbarclr));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: HomePage(),
    );
  }
}
