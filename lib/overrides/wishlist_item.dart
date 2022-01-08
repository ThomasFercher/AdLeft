import 'dart:html';

import 'package:adleft/logic/objects/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:provider/provider.dart';

class WishlistItem extends StatelessWidget {
  final Product product;
  final double? itemHeight;
  final GlobalKey? heroKey;
  final void Function(Product p)? onDelete;
  const WishlistItem({
    Key? key,
    required this.product,
    this.itemHeight,
    this.heroKey,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: itemHeight ?? 96,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colors.cardBackgroundColor,
          borderRadius: theme.sizing.borderRadius[1],
        ),
        child: Row(
          children: [
            Container(
              child: getImage(theme),
            ),
            LegendText(
              text: product.name,
              textStyle: theme.typography.h3,
              padding: EdgeInsets.only(
                left: 12,
              ),
            ),
            Expanded(child: Container()),
            LegendText(
              text: "${product.price}€",
              textStyle: theme.typography.h2,
            ),
            Expanded(child: Container()),
            LegendText(
              text: product.category,
              textStyle: theme.typography.h2,
            ),
            Expanded(child: Container()),
            LegendAnimatedIcon(
              padding: EdgeInsets.only(
                right: 12,
              ),
              iconSize: 28,
              icon: Icons.delete,
              theme: LegendAnimtedIconTheme(
                enabled: Colors.redAccent,
                disabled: theme.colors.foreground[0],
              ),
              onPressed: () {
                if (onDelete != null) onDelete!(product);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(ThemeProvider theme) {
    return heroKey != null
        ? Hero(
            tag: heroKey!,
            child: ClipRRect(
              borderRadius: theme.sizing.borderRadius[2],
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: theme.sizing.borderRadius[1],
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
            ),
          );
  }
}
