import 'package:flutter/material.dart';
import 'package:qrreader/pages/home_page.dart';
import 'package:qrreader/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lector de códigos QR',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {'home': (_) => HomePageScreen(), 'Map': (_) => MapPageScreen()},
    );
  }
}
