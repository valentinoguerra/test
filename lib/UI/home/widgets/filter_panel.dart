import 'package:flutter/material.dart';
import 'package:test_project/UI/widgets/button.dart';

import '../../../constant_values.dart';

class FilterPanel extends StatefulWidget {
  @override
  _FilterPanelState createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  int orderBy, specialSelected;
  double price;

  @override
  void initState() {
    super.initState();
    orderBy = 0;
    price = 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        transform: Matrix4.translationValues(0, -1, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(BORDER_RADIUS),
            topRight: Radius.zero,
            bottomLeft: Radius.circular(BORDER_RADIUS),
            bottomRight: Radius.circular(BORDER_RADIUS),
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(PADDING),
      child: Column(
        children: [
          _buildTitle('Ordenar por'),
          Row(
            children: [
              SizedBox(width: PADDING),
              _buildOrderByItem(text: 'Calificación', value: 0),
              SizedBox(width: PADDING),
              _buildOrderByItem(text: 'Distancia', value: 1),
            ],
          ),
          Row(
            children: [
              SizedBox(width: PADDING),
              _buildOrderByItem(text: 'Mayor precio', value: 2),
              SizedBox(width: PADDING),
              _buildOrderByItem(text: 'Menor precio', value: 3),
            ],
          ),
          SizedBox(height: PADDING),
          _buildTitle('Precio'),
          _buildPriceSlider(),
          SizedBox(height: PADDING),
          _buildTitle('Otras opciones'),
          SizedBox(height: PADDING),
          Row(
            children: [
              SizedBox(width: PADDING),
              _buildSpecialOption(text: 'Menú Vegetariano', value: 1),
              SizedBox(width: PADDING),
              _buildSpecialOption(text: 'Menú Celíaco', value: 2),
            ],
          ),
          SizedBox(height: PADDING),
          Row(
            children: [
              SizedBox(width: PADDING),
              _buildSpecialOption(text: 'Happy Hour', value: 3),
              SizedBox(width: PADDING),
              _buildSpecialOption(text: 'Tarjeta de Crédito', value: 4),
            ],
          ),
          SizedBox(height: PADDING * 2),
          Row(
            children: [
              Expanded(
                child: Button(
                  text: 'Aplicar',
                  textColor:  Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  boldText: true,
                  onTap: () {},
                ),
              ),
              SizedBox(width: PADDING),
              Expanded(
                child: Button(
                  text: 'Limpiar',
                  textColor: Colors.white,
                  boldText: true,
                  backgroundColor: Theme.of(context).primaryColor,
                  borderColor: Colors.white,
                  onTap: () {},
                ),
              )
            ],
          ),
           SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildTitle(String text) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: theme.textTheme.headline3.copyWith(color: Colors.white),
      ),
    );
  }

  Widget _buildOrderByItem({String text, int value}) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          text,
          style: theme.textTheme.headline4.copyWith(color: Colors.white, fontSize: 16),
        ),
        Container(
          height: 35,
          child: Radio(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            groupValue: orderBy,
            onChanged: (v) => setState(() => orderBy = v),
            activeColor: Colors.white,
            hoverColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSlider() {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(width: PADDING),
        Text(
          '\$',
          style: theme.textTheme.headline4.copyWith(color: Colors.white, fontSize: 16),
        ),
        Expanded(
          child: Slider(
            value: price,
            onChanged: (value) => setState(() => price = value),
            activeColor: Colors.white,
            inactiveColor: Colors.white.withOpacity(0.2),
          ),
        ),
        Text(
          r'$$$',
          style: theme.textTheme.headline4.copyWith(color: Colors.white, fontSize: 16),
        ),
        SizedBox(width: PADDING),
      ],
    );
  }

  Widget _buildSpecialOption({String text, int value}) {
    final bool selected = value == specialSelected;
    final theme = Theme.of(context);
    return Button(
      backgroundColor: selected ? Colors.white : theme.primaryColor,
      borderColor: Colors.white,
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        setState(() {
          if (selected) {
            specialSelected = 0;
          } else {
            specialSelected = value;
          }
        });
      },
      autoPadding: true,
      height: 30,
      child: Text(
        text,
        style: theme.textTheme.headline5.copyWith(
          color: selected ? theme.primaryColor : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
