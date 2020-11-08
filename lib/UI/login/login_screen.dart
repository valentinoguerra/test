import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/UI/landing/landing_screen.dart';
import 'package:test_project/UI/login/widgets/login_text_fields.dart';
import 'package:test_project/UI/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    void goToLanding() {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) => LandingScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Stack(
            children: [
              SlideTransition(
                position: Tween(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0)).animate(animation),
                child: widget,
              ),
              SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                child: child,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLogo(),
              SizedBox(height: 50),
              LoginTextFields(),
              SizedBox(height: 25),
              _buildLoginButton(),
              _buildRecoverPasswordButton(),
              SizedBox(height: 25),
              _buildBottomButtons(),
            ],
          ),
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

  Widget _buildLoginButton() {
    final theme = Theme.of(context);
    return Button(
      text: 'Ingresar',
      textColor: Colors.white,
      boldText: true,
      backgroundColor: theme.primaryColor,
      onTap: () {},
    );
  }

  Widget _buildRecoverPasswordButton() {
    final theme = Theme.of(context);
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Olvidé mi contraseña',
        style: theme.textTheme.headline5.copyWith(decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildBottomButtons() {
    final theme = Theme.of(context);
    final double spacing = 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button(
          text: 'Cuenta Nueva',
          boldText: true,
          backgroundColor: theme.accentColor,
          borderColor: theme.primaryColor,
          onTap: () {},
        ),
        SizedBox(height: spacing),
        Button(
          text: 'Ingresar con Facebook',
          backgroundColor: theme.accentColor,
          borderColor: theme.primaryColor,
          onTap: () {},
        ),
        SizedBox(height: spacing),
        Button(
          text: 'Ingresar con Google',
          backgroundColor: theme.accentColor,
          borderColor: theme.primaryColor,
          onTap: () {},
        ),
        SizedBox(height: spacing),
        Button(
          text: 'Registrarme Luego',
          boldText: true,
          backgroundColor: theme.accentColor,
          borderColor: theme.primaryColor,
          onTap: goToLanding,
        ),
      ],
    );
  }
}
