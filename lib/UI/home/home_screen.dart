import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_project/UI/home/widgets/filter_panel.dart';
import 'package:test_project/UI/home/widgets/home_list.dart';
import 'package:test_project/UI/home/widgets/location_view.dart';
import 'package:test_project/UI/home/widgets/search_bar.dart';
import 'package:test_project/UI/home/widgets/section_selector.dart';
import 'package:test_project/UI/widgets/tap_widget.dart';

import '../../constant_values.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool location, filter;

  @override
  void initState() {
    super.initState();
    location = false;
    filter = false;
  }

  void setLocation(bool value) {
    setState(() {
      location = value;
    });
  }

  void setFilter(bool value) {
    setState(() {
      filter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    final theme = Theme.of(context);
    return AppBar(
      title: Text(
        'Hola!',
        style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white),
      ),
      leading: Stack(
        children: [
          Center(
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.dehaze_rounded),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        HomeList(),
        location ? LocationView() : Container(),
        filter
            ? TapWidget(
                child: _blurBackground(),
                onTap: () => setFilter(false),
              )
            : Container(),
        Stack(
          children: [
            filter ? Container() : _blurBackground(height: 128),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: PADDING),
                      SectionSelector(),
                      SizedBox(height: PADDING),
                      SearchBar(
                        onLocation: setLocation,
                        onFilter: setFilter,
                        initialFilterActive: filter,
                      ),
                    ],
                  ),
                  filter ? FilterPanel() : Container(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _blurBackground({double height = double.infinity}) {
    return Container(
      height: height,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.15)),
          ),
        ),
      ),
    );
  }
}
