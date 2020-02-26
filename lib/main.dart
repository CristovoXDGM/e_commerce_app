import 'package:flutter/material.dart';
import 'package:loja_virtual_app/models/user_model.dart';
import 'package:loja_virtual_app/screens/home_screen.dart';
import 'package:loja_virtual_app/screens/login_screen.dart';
import 'package:loja_virtual_app/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ScopedModel<UserModel>(
    model: UserModel(),
    child: MaterialApp(
      title: "Flutter's Clothing",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
          dividerTheme: DividerThemeData(color: Colors.grey),
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 4, 125, 141)),
    ),
  ));
}
