import 'package:flutter/material.dart';
import 'Signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My sign app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Signup(),
    );
  }
}
