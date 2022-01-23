import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:adleft/overrides/appBarAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/modals/legendPopups.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/datadisplay/avatar/legend_avatar.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/provider.dart';

class AppBarBuilder extends StatelessWidget {
  final bool showWishList;
  final bool showUsername;

  const AppBarBuilder({
    Key? key,
    this.showWishList = true,
    this.showUsername = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    bool menuCollapsed = theme.menuCollapsed;

    double avatarHeight = theme.sizing.appBarSizing.appBarHeight / 3 * 2;

    MenuOption profileOption = RouterProvider.of(context)
        .menuOptions
        .singleWhere((element) => element.page == "/profile");
    List<MenuOption> menu_options = [
      profileOption,
    ];
    menu_options.addAll(profileOption.children ?? []);

    MenuOption? sel = RouterProvider.of(context).current;

    List<DrawerMenuTile> options = menu_options
        .map(
          (option) => DrawerMenuTile(
            icon: option.icon,
            title: option.title,
            path: option.page,
            left: false,
            backgroundColor: theme.colors.foreground[1],
            activeColor: theme.colors.selectionColor,
            color: theme.colors.textColorLight,
            collapsed: false,
            onClicked: () => {
              RouterProvider.of(context).pushPage(
                settings: RouteSettings(
                  name: option.page,
                ),
              )
            },
            rectangleIndicator: true,
            forceColor: option == sel,
            bottomSpacing: 16,
          ),
        )
        .toList();

    return Row(
      children: [
        if (showWishList)
          LegendAnimatedIcon(
            icon: Icons.list_alt_rounded,
            iconSize: 28,
            padding: EdgeInsets.only(right: 32),
            theme: LegendAnimtedIconTheme(
              enabled: theme.colors.selectionColor,
              disabled: theme.colors.appBarColors.foreground,
            ),
            onPressed: () {
              RouterProvider.of(context).pushPage(
                settings: const RouteSettings(
                  name: "/wishlist",
                ),
              );
            },
          ),
        Consumer<AuthProvider>(
          builder: (context, auth, child) {
            bool isLoggedIn = true; //auth.isSignedIn();
            User? user = auth.getUser;
            String? letter;

            if (user != null) {
              letter = user.email?[0].toUpperCase();
            }

            return isLoggedIn
                ? Row(
                    children: [
                      AppBarAvatar(
                        avatarHeight: avatarHeight,
                        letter: "T",
                        options: options,
                        onRight: !menuCollapsed,
                      ),
                      if (showUsername)
                        LegendText(
                          text: user?.email ?? "Username",
                          textStyle: theme.typography.h4,
                        )
                    ],
                  )
                : LegendButton(
                    margin: const EdgeInsets.only(
                      right: 32,
                    ),
                    text: LegendText(
                      text: "Anmelden",
                      textStyle: theme.typography.h1,
                      textAlign: TextAlign.center,
                    ),
                    style: LegendButtonStyle.gradient(
                      [
                        theme.colors.secondaryColor,
                        LegendColorTheme.darken(
                          theme.colors.secondaryColor,
                          0.04,
                        ),
                      ],
                      height: theme.appBarSizing.appBarHeight / 2,
                      width: LegendUtils.calcTextSize(
                            "Anmelden",
                            theme.typography.h1,
                          ).width +
                          36,
                    ),
                    onPressed: () {
                      RouterProvider.of(context).pushPage(
                        settings: const RouteSettings(
                          name: "/login",
                        ),
                      );
                    },
                  );
          },
        ),
      ],
    );
  }
}
