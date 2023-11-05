import 'package:flutter/material.dart';

class SphereInTheMiddle extends StatelessWidget {
  final Offset lightSource;
  final Widget childWidget;
  const SphereInTheMiddle({Key? key, required this.lightSource, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final innerShadowWidth = lightSource.distance * 0.2;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          stops: [1 - innerShadowWidth, 1],
          colors: const [
            Color.fromARGB(56, 212, 232, 247),
           // Color(0xff11fff7),
            Color.fromARGB(190, 19, 99, 142),
          ],
        ),
      ),
      child: childWidget,
    );
  }
}
