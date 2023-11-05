import 'package:flutter/material.dart';

class SphereGlass extends StatefulWidget {
  final double diameter;
  final Offset lightSource;
  final Widget childSphere;
  const SphereGlass(
      {Key? key,
      required this.diameter,
      required this.lightSource,
      required this.childSphere})
      : super(key: key);

  @override
  State<SphereGlass> createState() => _SphereGlassState();
}

class _SphereGlassState extends State<SphereGlass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.diameter,
      height: widget.diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center:
          Alignment(widget.lightSource.dx, widget.lightSource.dy),
          colors: const [
            Color.fromARGB(255, 212, 232, 247),
            Color.fromARGB(121, 19, 99, 142),
          ],
        ),
      ),
      //child: this.widget.childSphere,
    );
  }
}
