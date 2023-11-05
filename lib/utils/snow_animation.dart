import 'dart:async';
import 'dart:math';
//import 'dart:ui';

import 'package:flutter/material.dart';

class SnowWidget extends StatefulWidget {
  const SnowWidget({super.key});

  @override
  State<SnowWidget> createState() => _SnowWidgetState();
}

class _SnowWidgetState extends State<SnowWidget> {
  List<SnowModel> listSnow = [];
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      var data = SnowModel(
        size: (Random().nextInt(16) + 4).toDouble(),
        top: -10,
        left: Random().nextDouble() * MediaQuery.of(context).size.width * 0.95,
        duration: Random().nextInt(8) + 4,
      );
      setState(() {
        listSnow.add(data);
      });
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          listSnow.last.top = MediaQuery.of(context).size.height;
        });
      });
      if (timer.tick > 10) {
        var max = 4;
        var min = listSnow.length - 5;
        var randomIndex = Random().nextInt(max) + min;

        listSnow[randomIndex].left = listSnow[randomIndex].left! +
            (listSnow[randomIndex].left! >
                    MediaQuery.of(context).size.width * 0.5
                ? -50.0
                : 50.0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return //Scaffold(
        //body: //Stack(children: [
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       'assets/images/santa.png',
        //     ),
        //     fit: BoxFit.contain,
        //   ),
        // ),
        // child: ClipRRect(
        //   // make sure we apply clip it properly
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        //     child: Container(
        //       alignment: Alignment.center,
        //       color: Colors.transparent,
        //     ),
        //   ),
        // ),
        //),
        Stack(
      children: listSnow.map((element) {
        return AnimatedPositioned(
          top: element.top,
          left: element.left,
          duration: Duration(seconds: element.duration!),
          curve: Curves.linear,
          child: Container(
            width: element.size,
            height: element.size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
          ),
        );
      }).toList(),
      //)
      //]
    );
    //);
  }
}

class SnowModel {
  double? size;
  double? top;
  double? left;
  int? duration;

  SnowModel({this.size, this.top, this.left, this.duration});

  SnowModel.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    top = json['top'];
    left = json['left'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['top'] = top;
    data['left'] = left;
    data['duration'] = duration;
    return data;
  }
}