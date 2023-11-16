import 'package:flutter/material.dart';
import 'package:magic_ball/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> 
with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Christmas Ball',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: Colors.blueGrey
        ),
        home: const HomeScreen()
    );
  }
}

