import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:adleft/overrides/appBarBuilder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routeInfoProvider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/datadisplay/searchableList.dart/legend_searchable_list.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings? route = RouteInfoProvider.of(context)?.route;
    ThemeProvider theme = context.watch<ThemeProvider>();
    User? user = context.watch<AuthProvider>().getUser;

    return LegendScaffold(
      pageName: "Wishlist",
      layoutType: LayoutType.FixedHeader,
      showAppBarMenu: true,
      appBarBuilder: (context) => AppBarBuilder(
        showUsername: true,
        showWishList: false,
      ),
      singlePage: true,
      contentBuilder: (context, size) {
        return Container(
          width: size.width,
          padding: EdgeInsets.all(
            theme.sizing.padding[0],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LegendText(
                text: "Wishlist",
                textStyle: theme.typography.h5,
              ),
              LegendSearchableList(),
            ],
          ),
        );
      },
    );
  }
}
