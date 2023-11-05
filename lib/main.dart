import 'package:flutter/material.dart';
import 'package:magic_ball/utilities/snow_animation.dart';
//import 'package:magic_ball/screens/ball_page.dart';
import 'package:magic_ball/widgets/sphere.dart';
import 'package:magic_ball/widgets/sphere_glass.dart';
//import 'package:snowfall/snowfall.dart';
import 'package:shake/shake.dart';

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

  //bool _isRunning = true;

  @override
  void initState() {
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Christmas Ball',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: Colors.blueGrey
        ),
        home: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              title: const Text('Hi! I\'m magic Christmas ball'),
              elevation: 0,
              backgroundColor: const Color.fromARGB(168, 59, 110, 164),
            ),
            body: Stack(
            children: [
              Container(
              //color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/balls.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            ),
          const SnowWidget(),

              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
                child: Container(
                  margin: const EdgeInsets.all(28),
                  child: const Column(
                    children: [
                        SphereGlass(diameter: 0, lightSource: Offset(0, 2), 
                        childSphere: Column(),),
                        SphereWidget(),
                          
                    ],
                  )
                          ),
              )
            ],)
        )
    );
  }
}