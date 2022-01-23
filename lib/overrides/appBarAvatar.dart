import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/modals/legendPopups.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/avatar/legend_avatar.dart';
import 'package:provider/src/provider.dart';

class AppBarAvatar extends StatefulWidget {
  final double avatarHeight;
  final String letter;

  final bool onRight;

  AppBarAvatar({
    Key? key,
    required this.avatarHeight,
    required this.letter,
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
            onClicked: () {
              popped = true;
              menuShown = false;
              RouterProvider.of(context).pushPage(
                settings: RouteSettings(
                  name: option.page,
                ),
              );
            },
            rectangleIndicator: true,
            forceColor: option == sel,
            bottomSpacing: 16,
          ),
        )
        .toList();

    return MouseRegion(
      onEnter: (event) {
        if (!menuShown) {
          LegendPopups.showSubMenu(
            theme: theme,
            menuWidth: 160,
            snappedRightPadding: 20,
            itemWidth: widget.avatarHeight,
            parentHeight: theme.sizing.appBarSizing.appBarHeight,
            context: context,
            key: key,
            menuItems: options,
            borderRadius: getBorderRadius(theme),
            onParentTap: () {
              popped = true;
              Navigator.pop(context);
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
              } else {
                popped = false;
              }
              menuShown = false;
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
