import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routeInfoProvider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
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
      singlePage: true,
      maxContentWidth: 1200,
      contentBuilder: (context, s) {
        return Container(
          width: s.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (p?.imagePath != null)
                Hero(
                  tag: p!.uid,
                  child: Image.asset(
                    p.imagePath,
                    height: 600,
                  ),
                ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LegendText(
                      text: p?.name,
                      textStyle: theme.typography.h5,
                    ),
                    LegendText(
                      text: "${p?.price}",
                      textStyle: theme.typography.h3,
                    ),
                    LegendText(
                      text: p?.description,
                      textStyle: theme.typography.h1,
                    ),
                    LegendButton(
                      text: LegendText(
                        text: "Zum Angebot",
                      ),
                      onPressed: () {
                        if (p?.link != null)
                          LegendUtils.launchInBrowser(p!.link);
                      },
                      style: LegendButtonStyle.gradient(
                        [
                          Colors.red,
                          Colors.yellow,
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
