import 'package:adleft/logic/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routeInfoProvider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:provider/src/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings? route = RouteInfoProvider.of(context)?.route;
    ThemeProvider theme = context.watch<ThemeProvider>();
    String? uid = route?.arguments.toString();
    Product? p = context.watch<ProductProvider>().getFromUid(uid!);

    return LegendScaffold(
      pageName: "Product",
      layoutType: LayoutType.FixedHeader,
      showAppBarMenu: false,
      singleScreen: true,
      contentBuilder: (context) {
        return Column(
          children: [
            if (p?.imagePath != null)
              Hero(
                tag: p!.uid,
                child: Image.asset(
                  p.imagePath,
                  height: 600,
                ),
              ),
          ],
        );
      },
    );
  }
}
