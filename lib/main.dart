import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Login sayfasını import et

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yerelize Turizm',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Başlangıç ekranı olarak login ekranını ata
    );
  }
}

