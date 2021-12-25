import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:adleft/overrides/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legendCarousel.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:provider/provider.dart';

class MerchantRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = context.watch<ThemeProvider>();
    List<Product> products = context.watch<ProductProvider>().products;
    List<Widget> children;

    children = products.map((p) => ProductCard(product: p)).toList();

    return LegendScaffold(
      singlePage: false,
      verticalChildrenSpacing: 12,
      showAppBarMenu: true,
      contentBuilder: (context, s) {
        return Container();
      },
      layoutType: LayoutType.FixedHeader,
      pageName: "Merchant Register",
    );
  }
}
