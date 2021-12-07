import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:provider/src/provider.dart';

class ProductCard extends StatelessWidget {
  final String uuid;

  ProductCard({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return LegendCard(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: LegendAnimatedIcon(
            icon: Icons.thumb_up_alt,
            onPressed: () {
              RouterProvider.of(context).pushPage(
                settings: RouteSettings(name: "/products", arguments: uuid),
              );
            },
            theme: LegendAnimtedIconTheme(
              enabled: theme.colors.selectionColor,
              disabled: theme.colors.primaryColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: LegendText(
            text: "Product",
            textStyle: theme.typography.h4,
          ),
        ),
      ],
    );
  }
}