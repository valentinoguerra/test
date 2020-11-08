import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/UI/home/home_screen.dart';
import 'package:test_project/UI/login/login_screen.dart';
import 'package:test_project/UI/widgets/button.dart';
import 'package:test_project/UI/widgets/tap_widget.dart';

import '../../constant_values.dart';

class LandingScreen extends StatefulWidget {
  final bool splashScreen;

  const LandingScreen({Key key, this.splashScreen = true}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  void goToLogin() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Stack(
            children: [
              SlideTransition(
                position: Tween(begin: Offset(0.0, 0.0), end: Offset(1.0, 0.0)).animate(animation),
                child: widget,
              ),
              SlideTransition(
                position: Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                child: child,
              ),
            ],
          );
        },
      ),
    );
  }

  void goToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            SizedBox(height: PADDING * 2),
            _buildTitle(),
            SizedBox(height: PADDING),
            _buildSubtitle(),
            SizedBox(height: PADDING * 2),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    final theme = Theme.of(context);
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/app_logo.svg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'HOLA!',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'A dónde vamos hoy?',
      style: Theme.of(context).textTheme.headline3,
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        _buildCircularButton('Mesa Ya!', goToHomeScreen),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCircularButton('Reservas', goToHomeScreen),
            SizedBox(width: PADDING),
            _buildCircularButton('Take Away', goToHomeScreen),
          ],
        ),
        SizedBox(height: PADDING * 2),
        Button(
          text: 'Registrarme',
          textColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          autoPadding: true,
          onTap: goToLogin,
        ),
      ],
    );
  }

  Widget _buildCircularButton(String text, Function onTap) {
    final theme = Theme.of(context);
    return TapWidget(
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.white.withOpacity(0.2),
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
