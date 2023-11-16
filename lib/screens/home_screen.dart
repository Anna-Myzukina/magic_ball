import 'package:flutter/material.dart';
import 'package:magic_ball/utils/snow_animation.dart';
import 'package:magic_ball/widgets/sphere.dart';
import 'package:magic_ball/widgets/sphere_glass.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Ask me anything & shake your phone:'),
          elevation: 0,
          backgroundColor: const Color.fromARGB(161, 0, 0, 0),
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
              'assets/images/bg.png',
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
    );
  }
}