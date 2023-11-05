import 'package:flutter/material.dart';
import 'package:magic_ball/widgets/ball.dart';
import 'package:snowfall/snowfall.dart';

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Ask Me Anything'),
      ),
      body: const SnowfallWidget(
        child: BallWidget()),
    );
  }
}