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
    return LegendScaffold(
      pageName: "Product",
      layoutType: LayoutType.FixedHeader,
      children: [
        LegendText(
          text: "${route?.arguments}",
          textStyle: theme.typography.h0,
        ),
      ],
    );
  }
}
