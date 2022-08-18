import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

void showNetworkErrorDialog(BuildContext context, dynamic onTap) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(
//          translator.currentLanguage == "en"
//              ? "please check your internet connection"
//              :
          "تأكد من الاتصال بالانترنت",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppTheme.primaryColor,
            // fontFamily: AppTheme.fontName,
          ),
        ),
        actions: <Widget>[
          CupertinoButton(
            onPressed: onTap,
            child: Text(
//              translator.currentLanguage == "en"
//                  ? "Try again"
//                  :
              "حاول مرة أخرى",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.grey, fontFamily: AppTheme.boldFont),
            ),
          ),
        ],
      );
    },
  );
}
