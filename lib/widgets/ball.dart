import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class BallWidget extends StatefulWidget {
  const BallWidget({super.key});

  @override
  State<BallWidget> createState() => _BallWidgetState();
}

class _BallWidgetState extends State<BallWidget> { 
  static const List ballImages = [
    'ball1.png',
    'ball2.png',
    'ball3.png',
    'ball4.png',
    'ball5.png'
  ];
  String ballImage = ballImages.first;

  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();

    detector = ShakeDetector.autoStart(onPhoneShake: () {
      
      final newBallImage = (List.of(ballImages)
            ..remove(ballImage)
            ..shuffle())
          .first;

      setState(() {
        ballImage = newBallImage;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    detector.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Image.asset('assets/images/$ballImage'),
    );
  }
}
