// Gradient icon class if we're not using pre-made assets for our icons.
// - Carlos

import 'package:flutter/material.dart';
import 'package:foodboard/constants.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  const GradientIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return LinearGradientMask(child: Icon(icon, color:Colors.white));
  }
}

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(colors: <Color>[
            light_green,
            dark_green,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(bounds);
      },
      child: child,
    );
  }
}
