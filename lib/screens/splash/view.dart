import 'dart:async';

import 'package:admin_pnal/Helper/cache_helper.dart';
import 'package:admin_pnal/screens/app_screen/view.dart';
import 'package:admin_pnal/screens/auth/login/view.dart';
import 'package:admin_pnal/screens/auth/register/view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaling/flutter_screen_scaling.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goToHomePage() async {
    // if (CacheHelper.getFCMToken() == null || CacheHelper.getFCMToken() == '') {
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginScreen(),
    //     ),
    //     (Route<dynamic> route) => false,
    //   );
    // } else {
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SidebarXExampleApp(),
    //     ),
    //     (Route<dynamic> route) => false,
    //   );
    // }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => SidebarXExampleApp(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    Timer(
      const Duration(seconds: 4),
      () {
        goToHomePage();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(),
        child: FadeInDown(
          child: Container(
            margin: EdgeInsets.only(bottom: 120, left: 13),
            alignment: Alignment.center,
            child: Text('LOGO'),
          ),
        ),
      ),
    );
  }
}
