import 'package:flutter/material.dart';
//import 'package:magic_ball/utilities/snow_animation.dart';
import 'package:magic_ball/widgets/shpere_border.dart';
import 'package:magic_ball/widgets/sphere_glass.dart';
//import 'package:magic_ball/widgets/sphere_shadow.dart';

class SphereWidget extends StatefulWidget {
  const SphereWidget({super.key});

  @override
  State<SphereWidget> createState() => _SphereWidgetState();
}

class _SphereWidgetState extends State<SphereWidget> {
  static const lightSource = Offset(0, -0.75);

  @override
  Widget build(BuildContext context) {
    final size = Size.square(MediaQuery.of(context).size.shortestSide);

    return Stack(
      children: [
        // SphereShadow(
        //     diameter: size.shortestSide
        // ),
        SphereGlass(
            lightSource: lightSource,
            diameter: size.shortestSide,

            childSphere: Transform(
              transform: Matrix4.identity()..scale(0.5),
              child: const SphereBorder(
                lightSource: lightSource,
              ),
            )
        ),
      ],
    );
  }
}