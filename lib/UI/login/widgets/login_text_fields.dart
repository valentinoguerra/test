import 'package:flutter/material.dart';
import 'package:test_project/constant_values.dart';

class LoginTextFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BORDER_RADIUS)),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          _buildTextField(
            context,
            hintText: 'Nombre de usuario',
          ),
          _buildDivider(),
          _buildTextField(
            context,
            hintText: 'Contraseña',
            visible: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    String hintText,
    bool visible = true,
  }) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: theme.textTheme.headline6.copyWith(color: Colors.black.withOpacity(0.4)),
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        border: InputBorder.none,
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 1,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }
}
