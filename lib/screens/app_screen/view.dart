import 'package:admin_pnal/generated/locale_keys.g.dart';
import 'package:admin_pnal/screens/admin_screen/view.dart';
import 'package:admin_pnal/screens/Screens_example/view.dart';
import 'package:admin_pnal/screens/news/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sidebarx/sidebarx.dart';

class SidebarXExampleApp extends StatefulWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  @override
  State<SidebarXExampleApp> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<SidebarXExampleApp> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  title: Text(getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      _controller.setExtended(true);
                      _key.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: ExampleSidebarX(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) ExampleSidebarX(controller: _controller),
              Expanded(
                child: Center(
                  child: ScreensExample(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExampleSidebarX extends StatefulWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  State<ExampleSidebarX> createState() => _ExampleSidebarXState();
}

class _ExampleSidebarXState extends State<ExampleSidebarX> {
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 20, right: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20, right: 20),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            // child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: FontAwesomeIcons.home,
          label: lang.tr(LocaleKeys.drawer_home),
          onTap: () {
            debugPrint('Home');
          },
        ),
        SidebarXItem(
            icon: FontAwesomeIcons.film,
            label: 'الاخبار',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
              setState(() {
                debugPrint('news');
              });
            }),
        SidebarXItem(
          icon: Icons.settings,
          label: lang.tr(LocaleKeys.drawer_team),
          onTap: () {
            // AdminScreen
            debugPrint('AdminScreen');
          },
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.film,
          label: lang.tr(LocaleKeys.drawer_media),
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.solidIdBadge,
          label: lang.tr(LocaleKeys.drawer_trainees),
        ),
        SidebarXItem(
          icon: Icons.favorite,
          label: lang.tr(LocaleKeys.drawer_favorite),
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.envelopeOpen,
          label: lang.tr(LocaleKeys.drawer_connect_with_us),
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.hotel,
          label: lang.tr(LocaleKeys.drawer_who_are_we),
        ),
        SidebarXItem(
          icon: FontAwesomeIcons.exclamationCircle,
          label: lang.tr(LocaleKeys.drawer_about_the_club),
        ),
      ],
    );
  }
}

getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'News';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Custom iconWidget2';
    case 6:
      return 'Custom iconWidget3';
    case 7:
      return 'Custom iconWidget4';
    case 8:
      return 'Custom iconWidget4';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
