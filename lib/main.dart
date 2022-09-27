import 'package:flutter/material.dart';
import 'package:magicalworld/presentation/pages/home_page.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}