import 'package:flutter/material.dart';
import 'instagram_login_screen.dart';

void main() {
  runApp(MyApp()); // Por favor correr el proyecto en Chrome
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Pantalla de login similar a la de Instagram
        fontFamily: 'Roboto',
      ),
      home: InstagramLoginScreen(),
    );
  }
}