import 'package:flutter/material.dart';
import 'instagram_profile_screen.dart';

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
      ),
      home: InstagramProfileScreen(),
    );
  }
}