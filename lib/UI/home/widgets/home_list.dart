import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/UI/widgets/tap_widget.dart';

import '../../../constant_values.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 130),
        _buildSection(
          context,
          items: [
            _buildCircularItem(
              context,
              name: 'Parrillas',
              icon: SvgPicture.asset(
                'assets/icons/section/parrillas.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
            _buildCircularItem(
              context,
              name: 'Cafés',
              icon: SvgPicture.asset(
                'assets/icons/section/cafes.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
            _buildCircularItem(
              context,
              name: 'Comida China',
              icon: SvgPicture.asset(
                'assets/icons/section/comida_china.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
            _buildCircularItem(
              context,
              name: 'Cocina De Mar',
              icon: SvgPicture.asset(
                'assets/icons/section/cocina_de_mar.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
            _buildCircularItem(
              context,
              name: 'Hamburgueserías',
              icon: SvgPicture.asset(
                'assets/icons/section/hamburgueserias.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
            _buildCircularItem(
              context,
              name: 'Empanadas',
              icon: SvgPicture.asset(
                'assets/icons/section/empanadas.svg',
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: PADDING / 2),
        _buildSection(
          context,
          height: 180,
          name: 'Cerca Tuyo!',
          showAllButton: true,
          items: [
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: PADDING / 2),
        _buildSection(
          context,
          height: 180,
          name: 'Mejores Calificados!',
          items: [
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
            _buildSquareItem(
              context,
              name: 'Nombre Local',
              image: Icon(Icons.image, color: Colors.white, size: 50),
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: PADDING / 2),
        _buildSection(
          context,
          height: 120,
          items: [
            _buildPromoItem(
              context,
              name: 'Promo',
              onTap: () {},
            ),
            _buildPromoItem(
              context,
              name: 'Promo',
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: PADDING / 2),
        _buildSection(
          context,
          height: 120,
          items: [
            _buildPromoItem(
              context,
              name: 'Promo',
              onTap: () {},
            ),
            _buildPromoItem(
              context,
              name: 'Promo',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCircularItem(
    BuildContext context, {
    Widget icon,
    String name,
    Function onTap,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TapWidget(
            borderRadius: BorderRadius.circular(100),
            splashColor: Colors.white.withOpacity(0.2),
            onTap: onTap,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(child: icon),
            ),
          ),
          SizedBox(height: PADDING / 2),
          Text(
            name,
            style: theme.textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Widget _buildSquareItem(
    BuildContext context, {
    Widget image,
    String name,
    Function onTap,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: TapWidget(
        borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
        splashColor: Colors.white.withOpacity(0.2),
        onTap: onTap,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: PADDING),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.person, color: Colors.white),
                      SizedBox(width: PADDING / 2),
                      Text(
                        name,
                        style: theme.textTheme.headline5
                            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: PADDING,
                left: PADDING,
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoItem(
    BuildContext context, {
    String name,
    Function onTap,
  }) {
    final theme = Theme.of(context);
    return Center(
      child: TapWidget(
        borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
        splashColor: Colors.white.withOpacity(0.2),
        onTap: onTap,
        child: Container(
          height: 75,
          width: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(BORDER_RADIUS / 2),
          ),
          child: Center(
            child: Text(
              name,
              style: theme.textTheme.headline5
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    List<Widget> items,
    String name,
    bool showAllButton = false,
    double height = 120,
  }) {
    final theme = Theme.of(context);
    Widget spacing = SizedBox(width: PADDING / 2);
    items.insert(0, spacing);
    items.add(spacing);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          name != null
              ? Padding(
                  padding: const EdgeInsets.only(left: PADDING, top: PADDING),
                  child: Row(
                    children: [
                      Text(name, style: theme.textTheme.headline3),
                      SizedBox(width: PADDING),
                      showAllButton
                          ? Text(
                              'Ver Todos',
                              style: theme.textTheme.headline5
                                  .copyWith(decoration: TextDecoration.underline),
                            )
                          : Container(),
                    ],
                  ),
                )
              : Container(),
          Container(
            constraints: BoxConstraints(maxHeight: height),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) => items[index],
              separatorBuilder: (context, index) => SizedBox(width: PADDING),
            ),
          ),
        ],
      ),
    );
  }
}
