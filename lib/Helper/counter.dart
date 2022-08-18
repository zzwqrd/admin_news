import 'package:admin_pnal/Helper/Color.dart';
import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef void CounterChangeCallback(num value);

class Counterwidget extends StatelessWidget {
  final CounterChangeCallback? onChanged;

  Counterwidget({
    Key? key,
    @required num? initialValue,
    @required this.minValue,
    @required this.maxValue,
    @required this.onChanged,
    @required this.decimalPlaces,
    this.color,
    this.textStyle,
    this.step = 1,
    this.buttonSize = 25,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        //        assert(maxValue > minValue),
        assert(initialValue! >= minValue! && initialValue <= maxValue!),
        assert(step! > 0),
        selectedValue = initialValue,
        super(key: key);

  ///min value user can pick
  final num? minValue;

  ///max value user can pick
  final num? maxValue;

  /// decimal places required by the counter
  final int? decimalPlaces;

  ///Currently selected integer value
  num? selectedValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final num? step;

  /// indicates the color of fab used for increment and decrement
  Color? color;

  /// text syle
  TextStyle? textStyle;

  final double buttonSize;

  void _incrementCounter() {
    if (selectedValue! + step! <= maxValue!) {
      onChanged!((selectedValue! + step!));
    }
  }

  void _decrementCounter() {
    if (selectedValue! - step! >= minValue!) {
      onChanged!((selectedValue! - step!));
    }
  }

  double _size = 25;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    color = color ?? themeData.accentColor;
    textStyle = textStyle ??
        new TextStyle(
          fontSize: 20.0,
        );

    return Container(
      width: 80,
      //decoration: BoxDecoration(color: Colors.red),
      height: 35,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: _incrementCounter,
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
//                border: Border.all(
//                  color: Color(getColorHexFromStr("#F9F9FB")),
//                ),
                borderRadius: BorderRadius.all(Radius.circular(3)),
//                translator.currentLanguage == 'en'
//                    ? BorderRadius.only(
//                        bottomRight: Radius.circular(30),
//                        topRight: Radius.circular(30),
//                      )
//                    : BorderRadius.only(
//                        bottomLeft: Radius.circular(30),
//                        topLeft: Radius.circular(30),
//                      ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                //                  Image.asset(
                //                    "add.png",
                //                    width: 80,
                //                    height: 80,
                //                  ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(getColorHexFromStr("#FFFFFF")),
//                border: Border.all(
//                  color: Color(getColorHexFromStr("#F9F9FB")),
//                ),
              ),
              child: Center(
                child: Text(
                  ' ${num.parse((selectedValue)!.toStringAsFixed(decimalPlaces!))}',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    // fontFamily: AppTheme.fontName,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: _decrementCounter,
            child: Container(
              width: _size,
              height: _size,
              decoration: BoxDecoration(
//                  border: Border.all(
//                    color: Color(getColorHexFromStr("#F9F9FB")),
//                  ),
                  borderRadius:
//                  context.locale.languageCode == 'en'
//                      ? BorderRadius.only(
//                          bottomLeft: Radius.circular(30),
//                          topLeft: Radius.circular(30),
//                        )
//                      :
                      BorderRadius.all(Radius.circular(3)),
                  color: Color(getColorHexFromStr("#FAFAFA"))),
              child: Center(
                child: Text(
                  "ـــــ",
                  style: TextStyle(color: AppTheme.primaryColor),
                ),
                //                  Image.asset(
                //                    "assets/ /subtract.png",
                //                    width: 80,
                //                    height: 80,
                //                  ),
              ),
            ),
          ),
        ],
      ),
    );

    // return new Container(
    //   padding: new EdgeInsets.all(4.0),
    //   child: new Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Center(
    //        child: IconButton(
    //          onPressed: _decrementCounter,
    //          icon: Icon(Icons.remove),
    //        ),
    //         ),
    //       new Container(
    //         padding: EdgeInsets.all(4.0),
    //         child: new Text(
    //             '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
    //             style: textStyle),
    //       ),
    //       Center(
    //         child: IconButton(
    //           onPressed: _incrementCounter,
    //           icon: Icon(Icons.add),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
