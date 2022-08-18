import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sidebarx/sidebarx.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final theme = Theme.of(context);
    return ResponsiveGridRow(
      children: [],
    );
  }
}
