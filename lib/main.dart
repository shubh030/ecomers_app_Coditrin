import 'package:ecomers_app/widgets/app_with_bottom_navigation.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 3.0.4',
      home: const AppWithBottomNavigation(),
    );
  }
}
