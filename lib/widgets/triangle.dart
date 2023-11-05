import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class Triangle extends StatefulWidget {
  //late bool shakeIsStart = false;
  Triangle({
    Key? key,
    
    }) : super(key: key);

  @override
  State<Triangle> createState() => _TriangleState();
}

class _TriangleState extends State<Triangle> {
    static List<String> ballAnswers = [
    'YES',
    'NO',
    'HMMM try again',
    'I\'m not sure',
    'ASK AGAIN LATER',
    'THE ANSWER IS YES',
    'I HAVE NO IDEA'
  ];
  String answer = ballAnswers.first;
  late ShakeDetector detector;

    @override
      void initState() {
        super.initState();

        detector = ShakeDetector.autoStart(
          onPhoneShake: () {
          //widget.shakeIsStart = true;
          final newBallAnswer = (List.of(ballAnswers)
                ..remove(answer)
                ..shuffle())
              .first;

          setState(() {
            answer = newBallAnswer;
          });
        });
      }

        @override
          void dispose() {
            super.dispose();
            detector.stopListening();
            //widget.shakeIsStart = false;
          }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 255),
                      ),
                    ],
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800),
                child: 
                    AnimatedTextKit(
                        pause: const Duration(milliseconds: 3000),
                        totalRepeatCount: 2,
                        stopPauseOnTap: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            'Thinking about what are you worring',
                            textStyle: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                            speed: const Duration(milliseconds: 500),
                          ),
                          TyperAnimatedText('Asking your question'),
                          TyperAnimatedText('After shake your phone'),
                          TyperAnimatedText('Waiting for my unswer'),
                          TyperAnimatedText('I\'ll be happy to help'),
                          TyperAnimatedText(''),
                        ],
                       
                        // answer ?? '',
                        // textAlign: TextAlign.center,
                        // style: const TextStyle(
                        //   shadows: [
                        //     Shadow(
                        //     offset: Offset(10.0, 10.0),
                        //     blurRadius: 4.0,
                        //     color: Color.fromARGB(255, 0, 0, 0),
                        //   ),
                        //   Shadow(
                        //     offset: Offset(10.0, 10.0),
                        //     blurRadius: 8.0,
                        //     color: Color.fromARGB(125, 0, 0, 255),
                        //   ),
                        //   ],
                        //   color: Colors.white,
                        //   fontSize: 22,
                        //   fontWeight: FontWeight.w800
                        // ),
                        ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final _gradient = const LinearGradient(colors: [
    Color.fromARGB(255, 87, 135, 175),
    Color.fromARGB(255, 6, 41, 94)
  ]);

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..shader = _gradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;
    final path = Path()
      ..moveTo(width * 0.2, height * 0.3)
      ..quadraticBezierTo(width * 0.5, height * 0.1, width * 0.8, height * 0.3)
      ..quadraticBezierTo(
          width * 0.85, height * 0.6, width * 0.5, height * 0.85)
      ..quadraticBezierTo(width * 0.15, height * 0.6, width * 0.2, height * 0.3)
      ..close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
