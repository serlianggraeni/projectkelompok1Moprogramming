import 'package:flutter/material.dart';
import 'package:penjualantokosendal/pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan Toko Sendal Jepit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      fontFamily: 'Roboto', 
        primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}

