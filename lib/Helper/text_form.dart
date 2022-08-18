import 'package:admin_pnal/Helper/Color.dart';
import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget txtField(
    {BuildContext? context,
    dynamic validator,
    dynamic onSaved,
    String? hintText,
    bool? enabled,
    TextInputType? textInputType,
    String? prefix,
    bool? obscureText,
    TextEditingController? controller}) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
    child: TextFormField(
      validator: validator,
      controller: controller,
      onSaved: onSaved,
      enabled: enabled,
      //   textAlign: TextAlign.center,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,

      style: TextStyle(
        // fontFamily: AppTheme.boldFont,
        color: Color(getColorHexFromStr('#C1C1C1')),
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
            // color: AppTheme.mainColorText,
          ),
        ),
        errorStyle: TextStyle(
          // fontFamily: AppTheme.boldFont,
          color: Color(getColorHexFromStr('#C1C1C1')),
          fontSize: 13,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            prefix ?? "",
            width: 15,
            // height: 20,
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
            // color: AppTheme.mainColorText,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
            // color: AppTheme.mainColorText,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 0.5,
            style: BorderStyle.solid,
            // color: AppTheme.mainColorText,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        enabled: true,
        labelText: hintText == null ? "" : hintText.tr(),
        labelStyle: TextStyle(
          color: Color(getColorHexFromStr('#C1C1C1')),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget searsh({
  context,
  dynamic validator,
  dynamic onSaved,
  String? hintText,
  bool? enabled,
  TextInputType? textInputType,
  bool? obscureText,
  TextEditingController? controller,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      right: 5,
      left: 5,
    ),
    child: Container(
      width: MediaQuery.of(context).size.width - 200,
      child: TextFormField(
        validator: validator,
        controller: controller,
        enabled: enabled,
        onSaved: onSaved,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.0),
          filled: true,
          isDense: true, // Added this
          contentPadding: EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.0), width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.0), width: 0),
          ),
          hintStyle: const TextStyle(
            // color: HexColor("A9A9A9"),
            fontSize: 16,
            // fontFamily: FontFamily.neoSansArabicLight,
          ),
          hintText: hintText,
        ),
      ),
    ),
  );
}

TextFormField textFormField({
  BuildContext? context,
  String? hintText,
  TextInputType? textInputType,
  bool obscureText = false,
  TextEditingController? controller,
  dynamic? onValidate,
  dynamic? onSave,
  Function(String)? onFieldSubmitted,
  bool enabled = true,
  int maxLines = 1,
  bool label = true,
  bool error = false,
}) {
  return TextFormField(
    onFieldSubmitted: onFieldSubmitted,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    maxLines: maxLines,
    controller: controller,
    enabled: enabled,
    validator: onValidate,
    onSaved: onSave,
    obscureText: obscureText,
    keyboardType: textInputType,
    cursorHeight: 20,
    // cursorColor: hintTextColor,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 17,
    ),
    decoration: InputDecoration(
      errorStyle: TextStyle(fontSize: 0, height: 0),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      filled: false,

      // fillColor: Colors.white,
      // focusColor: secondTextColor,
      // hoverColor: secondTextColor,
      border: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      labelText: label ? hintText : null,
      labelStyle: label
          ? TextStyle(
              height: 0,
              fontSize: 20,
              color: Colors.black,
              // fontFamily: FontFamily.cairoRegular,
            )
          : null,
      //  errorText: snapshot.error,
      hintText: label ? null : hintText,
      hintStyle: label
          ? null
          : TextStyle(
              height: 0,
              fontSize: 17,
              color: error ? Colors.red : Colors.grey,
              // fontFamily: FontFamily.cairoRegular,x
            ),
    ),
  );
}
