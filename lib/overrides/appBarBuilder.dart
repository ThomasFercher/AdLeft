import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
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
    return Row(
      children: [
        Consumer<AuthProvider>(
          builder: (context, auth, child) {
            bool isLoggedIn = auth.isSignedIn();
            User? user = auth.getUser;
            String? letter;

            if (user != null) {
              letter = user.email?[0].toUpperCase();
            }

            double avatarHeight =
                theme.sizing.appBarSizing.appBarHeight / 3 * 2;

            return isLoggedIn
                ? Row(
                    children: [
                      LegendAvatar(
                        width: avatarHeight,
                        height: avatarHeight,
                        borderRadius: avatarHeight / 2,
                        backgroundColor: theme.colors.secondaryColor,
                        child: LegendText(
                          text: letter,
                          textStyle: TextStyle(
                            fontSize: avatarHeight / 2,
                            color: Colors.white,
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 24),
                        onTap: () {
                          RouterProvider.of(context).pushPage(
                            settings: const RouteSettings(
                              name: "/profile",
                            ),
                          );
                        },
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
        if (showWishList)
          LegendAnimatedIcon(
            icon: Icons.list_alt_rounded,
            iconSize: 28,
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
      ],
    );
  }
}
