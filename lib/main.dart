import 'dart:js_interop';
import 'package:ecommerce/shop.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/intro_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>Shop(),
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}

