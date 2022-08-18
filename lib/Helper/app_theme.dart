import 'package:admin_pnal/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  AppTheme._();
  static Color primaryColor = Color(
    getColorHexFromStr("#0E0E10"),
  );

  static Color mainButtonColor = Color.fromARGB(0, 113, 202, 196);
  static Color acceptButtonColor = Color(getColorHexFromStr("#03CB03"));
  static Color btnColor = Color(getColorHexFromStr("#01AAE5"));
  static Color subTitleColor = Color(getColorHexFromStr("#B5BED1"));
  static Color toastColor = Color(getColorHexFromStr("#2E3191"));
  static Color rateColor = Color(getColorHexFromStr("#F2D515"));
  static Color priceColor = Color(getColorHexFromStr("#7BAE3B"));
  // static Color priceColor = Color((getColorHexFromStr("#12BA2D")));
  static Color counterColor = Color(getColorHexFromStr("#4DD894"));
  static Color rejectButtonColor = Color(getColorHexFromStr("#E24848"));
  static Color appBarColor = AppTheme.primaryColor;

  static Color appBarTextColor = Color(getColorHexFromStr("#FFFFFF"));
  static Color mainTextColor = Color(getColorHexFromStr("#020202"));

  static Color inputFilledColor = Color(getColorHexFromStr("#FFFFFF"));
  static Color filledColor = Color(getColorHexFromStr("##F9F9F9"));
  static const double sizedBoxHeight = 18;

  // static const String fontName = FontFamily.neoSansArabicLight;
  static const String boldFont = 'Bold';

  static TextStyle appStayle = TextStyle(
    fontSize: 14,
    color: HexColor("7B8E7A"),
    fontWeight: FontWeight.bold,
    // fontFamily: fontName,
  );

  static TextStyle inputHintStyle = TextStyle(
    // fontFamily: fontName,
    fontSize: 8,
    letterSpacing: -0.17,
    height: 10,
    color: Color(getColorHexFromStr("#7C8184")),
  );
}

class Family {
  Family._();
  static String bold = "Bold";
  static String regular = "Regular";
  static String fontFamilyMedium = "Medium";
  static String light = "Light";
  static String fontFamilyExtraBold = "ExtraBold";
  static String semiBold = "SemiBold";
}
