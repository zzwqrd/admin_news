import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:admin_pnal/screens/home/view.dart';
import 'package:admin_pnal/screens/news/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sidebarx/sidebarx.dart';

class ScreensExample extends StatelessWidget {
  const ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final theme = Theme.of(context);
    return ListView(
      children: [
        if (!isSmallScreen)
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF3E3E61),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 100, 100, 146),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: Offset(-5, 2), // changes position of shadow
                ),
              ],
            ),
            height: 60.h,
            width: double.infinity,
            // child: Builder(
            //   builder: (BuildContext context) {
            //     return IconButton(
            //       icon: Icon(Icons.menu_open_rounded),
            //       onPressed: () {
            //         Scaffold.of(context).openDrawer();
            //       },
            //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            //     );
            //   },
            // ),
          ),
        SizedBox(
          height: 70.h,
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final pageTitle = getTitleByIndex(controller.selectedIndex);
            switch (controller.selectedIndex) {
              case 0:
                return HomeScreen();
                 case 1:
                return NewsScreen();
              default:
                return Text(
                  pageTitle,
                  style: theme.textTheme.headline5,
                );
            }
          },
        ),
      ],
    );
  }
}
