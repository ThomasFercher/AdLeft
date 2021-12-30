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
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings? route = RouteInfoProvider.of(context)?.route;
    ThemeProvider theme = context.watch<ThemeProvider>();
    User? user = context.watch<AuthProvider>().getUser;

    return LegendScaffold(
      pageName: "Profile",
      layoutType: LayoutType.FixedHeader,
      showAppBarMenu: false,
      maxContentWidth: 1200,
      disableContentDecoration: false,
      appBarBuilder: (context) => AppBarBuilder(),
      singlePage: true,
      contentBuilder: (context, s) {
        return Container(
          padding: EdgeInsets.all(
            theme.sizing.padding[0],
          ),
          width: s.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LegendText(
                text: user?.email ?? "Profile",
                textStyle: theme.typography.h5,
              ),
              Divider(
                color: theme.colors.background[2],
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LegendText(
                      text: "Email",
                      textStyle: theme.typography.h4,
                    ),
                    LegendText(
                      text: user?.email,
                      textStyle: theme.typography.h4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
