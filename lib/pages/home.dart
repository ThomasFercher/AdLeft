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

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      singlePage: true,
      verticalChildrenSpacing: 12,
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
        SizedBox(
          height: 600,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: LegendCard(),
                          ),
                          Expanded(
                            flex: 3,
                            child: LegendGrid(
                              padding: EdgeInsets.all(4),
                              crossAxisCount: 4,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              children: [
                                ProductCard(
                                  uuid: "Number1",
                                ),
                                ProductCard(
                                  uuid: "Number2",
                                ),
                                ProductCard(
                                  uuid: "Number3",
                                ),
                                ProductCard(
                                  uuid: "Number4",
                                ),
                                LegendCard(),
                                LegendCard(),
                                LegendCard(),
                                LegendCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: LegendCard(),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: LegendCard(),
              ),
            ],
          ),
        )
      ],
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
    );
  }
}
