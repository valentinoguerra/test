import 'package:flutter/material.dart';

class TapWidget extends StatelessWidget {
  final Color splashColor;
  final Widget child;
  final VoidCallback onTap;
  final BorderRadius borderRadius;

  TapWidget({
    this.splashColor,
    this.child,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius,
              splashColor: splashColor ?? Theme.of(context).splashColor,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
