import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.alphaBlend(
        Theme.of(context).primaryColor.withOpacity(0.1),
        Theme.of(context).accentColor,
      ),
      child: SingleChildScrollView(
        child: SvgPicture.asset(
          'assets/icons/map.svg',
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
