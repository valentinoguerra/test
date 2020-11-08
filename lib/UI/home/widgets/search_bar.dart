import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/UI/widgets/button.dart';
import 'package:test_project/constant_values.dart';

class SearchBar extends StatefulWidget {
  final bool initialFilterActive;
  final Function(bool value) onLocation, onFilter;

  const SearchBar({
    Key key,
    this.onLocation,
    this.onFilter,
    this.initialFilterActive,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool locationActive;
  bool textFieldActive;

  @override
  void initState() {
    super.initState();
    locationActive = false;
    textFieldActive = true;
  }

  void onLocation() {
    setState(() {
      locationActive = true;
      textFieldActive = false;
    });
    widget.onLocation(true);
  }

  void onSearch() {
    setState(() => locationActive = false);
    widget.onLocation(false);
  }

  void onAnimationEnds() {
    if (locationActive == false) {
      setState(() {
        textFieldActive = true;
      });
    }
  }

  void onFilter() {
    setState(() {
      if (widget.initialFilterActive) {
        widget.onFilter(false);
      } else {
        widget.onFilter(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(),
            SizedBox(width: PADDING),
            _buildFilterButton(),
          ],
        ),
        widget.initialFilterActive ? Container() : SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextField() {
    final theme = Theme.of(context);
    // Animated variables
    final double width = locationActive ? 50 : 260;
    final Color colorBackground = locationActive ? theme.primaryColor : Colors.white;
    final Color colorIcon = locationActive ? Colors.white : theme.colorScheme.secondary;
    final BorderRadius borderRadius = locationActive
        ? BorderRadius.circular(BORDER_RADIUS)
        : BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            topRight: Radius.circular(100),
            bottomRight: Radius.circular(100),
          );
    final Border border = locationActive
        ? Border()
        : Border.all(color: theme.colorScheme.secondary, width: BORDER_WIDTH);
    return Container(
      width: 260,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          onEnd: onAnimationEnds,
          width: width,
          duration: Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: colorBackground,
            borderRadius: borderRadius,
            border: border,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search, color: colorIcon),
                onPressed: onSearch,
              ),
              textFieldActive
                  ? Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Buscar',
                            hintStyle: theme.textTheme.headline4
                                .copyWith(color: theme.colorScheme.secondary),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            border: InputBorder.none),
                      ),
                    )
                  : Container(),
              textFieldActive
                  ? IconButton(
                      icon: Container(
                        decoration:
                            BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 16,
                          ),
                        ),
                      ),
                      onPressed: onLocation,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    final theme = Theme.of(context);
    return Expanded(
      child: Button(
        onTap: onFilter,
        backgroundColor: theme.primaryColor,
        height: widget.initialFilterActive ? 62 : 48,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.filter_list, color: Colors.white),
                Text('Filtrar', style: theme.textTheme.headline5.copyWith(color: Colors.white))
              ],
            ),
          ),
        ),
        borderRadius: widget.initialFilterActive
            ? BorderRadius.only(
                topLeft: Radius.circular(BORDER_RADIUS),
                topRight: Radius.circular(BORDER_RADIUS),
              )
            : BorderRadius.circular(BORDER_RADIUS),
      ),
    );
  }
}
