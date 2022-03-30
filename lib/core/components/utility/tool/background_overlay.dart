library flutter_speed_dial;

import 'package:flutter/material.dart';

class BackgroundOverlayVar extends AnimatedWidget {
  final Color? color;
  final double? opacity;

  const BackgroundOverlayVar({
    Key? key,
    required Animation<double> animation,
    this.color = Colors.white,
    this.opacity = 0.8,
  }) : super(key: key, listenable: animation);
  Animation<double> get _progress => listenable as Animation<double>;
  Widget build(BuildContext context) {
   // final Animation<double> animation = listenable;
    return Container(
      color: color!.withOpacity(_progress.value * opacity!),
    );
  }
}
