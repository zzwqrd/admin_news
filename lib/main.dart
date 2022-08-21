import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:admin_pnal/screens/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as lang;

import 'kiwi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initKiwi();
  runApp(
    lang.EasyLocalization(
      path: 'assets/langs',
      saveLocale: true,
      // assetLoader: const CodegenLoader(),
      startLocale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'As App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Color(0xFF3E3E61),
        scaffoldBackgroundColor: Color(0xFF3E3E61),
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 75,
          titleTextStyle: TextStyle(
            fontFamily: 'NeoSansArabicBold',
            fontSize: 18,
          ),
        ),
      ),
      builder: (context, widget) => Directionality(
        textDirection: context.locale.languageCode == "ar" ? TextDirection.rtl : TextDirection.ltr,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: _Unfocus(child: widget),
        ),
      ),
      home: SidebarXExampleApp(),
    );
  }
}

class _Unfocus extends StatefulWidget {
  const _Unfocus({Key? key, required this.child}) : super(key: key);

  final Widget? child;

  @override
  __UnfocusState createState() => __UnfocusState();
}

class __UnfocusState extends State<_Unfocus> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: widget.child,
    );
  }
}
