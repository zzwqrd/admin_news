import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          xl: 3,
          lg: 3,
          md: 6,
          child: Container(
            height: 100,
            alignment: Alignment(0, 0),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
                boxShadow: const [BoxShadow()],
              ),
              child: Text(
                "المستخدمين",
                style: AppTheme.appStayle,
              ),
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 3,
          md: 6,
          child: Container(
            height: 100,
            alignment: Alignment(0, 0),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
                boxShadow: const [BoxShadow()],
              ),
              child: Text(
                "المستخدمين",
                style: AppTheme.appStayle,
              ),
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 3,
          md: 6,
          child: Container(
            height: 100,
            alignment: Alignment(0, 0),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
                boxShadow: const [BoxShadow()],
              ),
              child: Text(
                "المستخدمين",
                style: AppTheme.appStayle,
              ),
            ),
          ),
        ),
        ResponsiveGridCol(
          xl: 3,
          lg: 3,
          md: 6,
          child: Container(
            height: 100,
            alignment: Alignment(0, 0),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).canvasColor,
                boxShadow: const [BoxShadow()],
              ),
              child: Text(
                "المستخدمين",
                style: AppTheme.appStayle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
