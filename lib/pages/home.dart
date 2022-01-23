import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:adleft/overrides/productCard.dart';
import 'package:adleft/overrides/appBarBuilder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/datadisplay/avatar/legend_avatar.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legendCarousel.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home();

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
      showTopSubMenu: true,
      appBarBuilder: (context) => AppBarBuilder(),
      children: [
        LegendCarousel(
          height: 300,
          isInfinite: true,
          //padding: EdgeInsets.all(4),
          items: [
            LegendCard(),
            LegendCard(),
            LegendCard(),
          ],
        ),
        LegendGrid(
          padding: EdgeInsets.all(4),
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: children,
          sizes: LegendGridSize(
            xxl: LegendGridSizeInfo(6, 520),
            large: LegendGridSizeInfo(4, 420),
            medium: LegendGridSizeInfo(2, 360),
            small: LegendGridSizeInfo(1, 480),
          ),
        )
      ],
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
    );
  }
}
