import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/layout/sections/section.dart';
import 'package:legend_design_core/modals/legendPopups.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';

import 'package:legend_design_widgets/modals/modal.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      singlePage: true,
      children: [],
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
    );
  }
}
