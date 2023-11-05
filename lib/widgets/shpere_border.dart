import 'package:flutter/material.dart';

class SphereBorder extends StatelessWidget {
  final Offset lightSource;
  const SphereBorder({
    Key? key,
    required this.lightSource
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          // center: Alignment(
          //   this.widget.lightSource.dx,
          //   this.widget.lightSource.dy),

          colors: [Color(0x661F1F1F), Colors.red],
        ),
      ),
    );
  }
}
