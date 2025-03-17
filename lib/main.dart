// main.dart
import 'package:flutter/material.dart';
// import 'package:konversisuhu/konversi.dart';
import 'package:konversisuhu/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TemperatureConverter()      
      home: MyLoginPage()
    );
  }
}