import 'package:flutter/material.dart';
import 'package:loja_virtual_app/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter's Clothing",
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141)),
  ));
}
