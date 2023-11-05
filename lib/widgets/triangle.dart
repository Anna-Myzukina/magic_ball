import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  final String? answer;
  const Triangle({Key? key, required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(),
      child: Center(
        child: Container(
          //alignment: Alignment.center,
          child: Text(
            answer ?? '',
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
              fontSize: 42,
              fontWeight: FontWeight.w800
            ),
          ),
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final _gradient =
      const LinearGradient(colors: [Color.fromARGB(255, 87, 135, 175), Color.fromARGB(255, 6, 41, 94)]);

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
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
