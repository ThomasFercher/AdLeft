import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/card/imageCard.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:provider/src/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    ProductProvider productProvider = context.watch<ProductProvider>();

    return ImageCard(
      title: product.name,
      imagePath: product.imagePath,
      description: product.description,
      heroKey: product.uid,
      onClick: () {
        RouterProvider.of(context).pushPage(
          settings: RouteSettings(
            name: "/products",
            arguments: product.uid,
          ),
        );
      },
      builder: (context) {
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
              right: theme.sizing.borderInset[0],
              top: theme.sizing.borderInset[0],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colors.cardBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(21),
                ),
              ),
              width: 42,
              height: 42,
              alignment: Alignment.center,
              child: LegendAnimatedIcon(
                icon: Icons.thumb_up_alt,
                theme: LegendAnimtedIconTheme(
                  disabled: theme.colors.foreground[0],
                  enabled: theme.colors.selectionColor,
                ),
                isSelected: productProvider.isOnWishlist(product),
                onPressed: () {
                  productProvider.addToWishlist(product);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
