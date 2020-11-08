import 'package:flutter/material.dart';
import 'package:test_project/UI/widgets/tap_widget.dart';

import '../../../constant_values.dart';

class SectionSelector extends StatefulWidget {
  @override
  _SectionSelectorState createState() => _SectionSelectorState();
}

class _SectionSelectorState extends State<SectionSelector> {
  int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  void setIndex(int newIndex) {
    setState(() => index = newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          _buildButton(
            0,
            text: 'Reservas',
            roundedLeft: true,
          ),
          _buildButton(1, text: 'Mesa Ya!'),
          _buildButton(
            2,
            text: 'Take Away',
            roundedRight: true,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    int i, {
    String text,
    bool roundedLeft = false,
    bool roundedRight = false,
  }) {
    final theme = Theme.of(context);
    final bool center = !roundedLeft && !roundedRight;
    final bool selected = i == index;
    final Radius roundLeft = roundedLeft ? Radius.circular(50.0) : Radius.zero;
    final Radius roundRight = roundedRight ? Radius.circular(50.0) : Radius.zero;
    final BorderRadius borderRadius = BorderRadius.only(
      bottomLeft: roundLeft,
      topLeft: roundLeft,
      bottomRight: roundRight,
      topRight: roundRight,
    );
    return Expanded(
      child: TapWidget(
        borderRadius: borderRadius,
        onTap: () => setIndex(i),
        splashColor: Colors.white.withOpacity(0.2),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: selected ? theme.primaryColor : Colors.white,
            borderRadius: center ? null : borderRadius,
            border: Border.symmetric(
              horizontal: BorderSide(color: theme.primaryColor, width: BORDER_WIDTH),
              vertical:
                  center ? BorderSide.none : BorderSide(color: theme.primaryColor, width: BORDER_WIDTH),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Text(
                text,
                style: theme.textTheme.headline5.copyWith(
                  color: selected ? Colors.white : theme.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
