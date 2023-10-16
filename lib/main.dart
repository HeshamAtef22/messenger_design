import 'package:flutter/material.dart';
//import 'package:messenger_design/home_screen.dart';
import 'package:messenger_design/users_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersScreen(),
    );
  }
}
