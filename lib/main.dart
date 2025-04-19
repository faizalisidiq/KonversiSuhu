// main.dart
import 'package:flutter/material.dart';
import 'package:konversisuhu/converter_provider.dart';
// import 'package:konversisuhu/konversi.dart';
import 'package:konversisuhu/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyLoginPage(),
      ),
    );
  }
}