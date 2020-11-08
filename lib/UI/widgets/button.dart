import 'package:flutter/material.dart';
import 'package:test_project/constant_values.dart';

class Button extends StatelessWidget {
  final String text;
  final bool boldText;
  final Widget child;
  final Function onTap;
  final Color backgroundColor, textColor, borderColor;
  final double height;
  final BorderRadius borderRadius;
  final bool autoPadding;

  const Button({
    Key key,
    this.text,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.child,
    this.boldText = false,
    this.borderRadius,
    this.height = BUTTON_HEIGHT,
    this.autoPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: RaisedButton(
        padding: autoPadding ? EdgeInsets.symmetric(horizontal: 20) : EdgeInsets.zero,
        onPressed: onTap,
        color: backgroundColor,
        disabledColor: backgroundColor.withOpacity(0.4),
        child: text != null ? _buildText(context) : child,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(BORDER_RADIUS),
          side: borderColor != null
              ? BorderSide(color: borderColor, width: BORDER_WIDTH)
              : BorderSide.none,
        ),
      ),
    );
  }

  Text _buildText(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(color: textColor, fontWeight: boldText ? FontWeight.bold : FontWeight.normal),
    );
  }
}
