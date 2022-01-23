import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/modals/legendPopups.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/avatar/legend_avatar.dart';
import 'package:provider/src/provider.dart';

class AppBarAvatar extends StatefulWidget {
  final double avatarHeight;
  final String letter;
  final List<Widget> options;
  final bool onRight;

  AppBarAvatar({
    Key? key,
    required this.avatarHeight,
    required this.letter,
    required this.options,
    this.onRight = false,
  }) : super(key: key);

  @override
  _AppBarAvatarState createState() => _AppBarAvatarState();
}

class _AppBarAvatarState extends State<AppBarAvatar> {
  late bool menuShown;
  late bool popped;
  late GlobalKey key;

  @override
  void initState() {
    menuShown = false;
    popped = false;
    key = GlobalKey();

    super.initState();
  }

  BorderRadiusGeometry getBorderRadius(ThemeProvider theme) {
    if (!widget.onRight) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(theme.sizing.borderInset[1]),
      );
    } else {
      return BorderRadius.vertical(
        bottom: Radius.circular(theme.sizing.borderInset[1]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return MouseRegion(
      onEnter: (event) {
        if (!menuShown) {
          LegendPopups.showSubMenu(
            theme: theme,
            menuWidth: 160,
            itemWidth: widget.avatarHeight,
            parentHeight: theme.sizing.appBarSizing.appBarHeight,
            context: context,
            key: key,
            menuItems: widget.options,
            borderRadius: getBorderRadius(theme),
            onParentTap: () {
              popped = true;
              RouterProvider.of(context).pushPage(
                settings: const RouteSettings(
                  name: "/profile",
                ),
              );
            },
            onParentExit: (event, p) {
              popped = true;
              menuShown = false;
              Navigator.pop(context);
            },
            onExit: (event) {
              if (popped == false) {
                Navigator.pop(context);
                menuShown = false;
              } else {
                popped = false;
              }
            },
          );
          menuShown = true;
        }
      },
      child: LegendAvatar(
        key: key,
        width: widget.avatarHeight,
        height: widget.avatarHeight,
        borderRadius: widget.avatarHeight / 2,
        backgroundColor: theme.colors.secondaryColor,
        child: LegendText(
          text: widget.letter,
          textStyle: TextStyle(
            fontSize: widget.avatarHeight / 2,
            color: Colors.white,
          ),
        ),
        onTap: () {
          RouterProvider.of(context).pushPage(
            settings: const RouteSettings(
              name: "/profile",
            ),
          );
        },
      ),
    );
  }
}
