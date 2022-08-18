import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:hexcolor/hexcolor.dart';
import 'app_theme.dart';

Widget btn({
  BuildContext? context,
  String? txt,
  dynamic onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
    child: InkWell(
      onTap: onTap,
      hoverColor: Colors.white,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          // color: _pressed ? AppTheme.primaryColor : Colors.indigo,
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 10,
          //     color: Colors.grey.shade300,
          //     offset: Offset(0, 0),
          //   ),
          // ],
        ),
        child: Text(
          txt ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ).tr(),
      ),
    ),
  );
}

Widget butAdd({
  context,
  String? txt,
  dynamic onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40,
      child: Center(
        child: Text(
          txt ?? "",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            // fontFamily: FontFamily.neoSansArabicBold,
          ),
        ).tr(),
      ),
      margin: const EdgeInsets.only(right: 0, left: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[HexColor("7B8E7A"), HexColor("4F5D4F")],
        ),
      ),
    ),
  );
}
//
// Widget btnB(BuildContext context, String txt, Function onTap) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 60,
//         decoration: BoxDecoration(
//           color: AppTheme.appColors,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Center(
//           child: Text(
//             txt,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget staticBtn(
//   BuildContext context,
//   String txt,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
//     child: Container(
//       width: MediaQuery.of(context).size.width,
//       height: 55,
//       decoration: BoxDecoration(
//         color: Color(
//           getColorHexFromStr("#BFBFBF"),
//         ),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Center(
//         child: Text(
//           txt,
//           style: TextStyle(
//               color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget dialogBtn(BuildContext context, String txt, Function onTap) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 50, left: 50, top: 15, bottom: 15),
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 40,
//         decoration: BoxDecoration(
//           color: AppTheme.appColors,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Center(
//           child: Text(
//             txt,
//             style: TextStyle(
//                 color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget rejectBtn(BuildContext context, String txt, Function onTap) {
//   return Padding(
//     padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 50,
//         decoration: BoxDecoration(
//           color: AppTheme.rejectButtonColor,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Center(
//           child: Text(
//             txt,
//             style: TextStyle(
//                 color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// Widget customLoginBox({BuildContext context, String image, String txt, Function onTap}){
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 15),
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 60,
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 70,
//               child: Row(
//                 children: [
//                   Image.asset(
//                     image,
//                     width: 40,
//                     fit: BoxFit.cover,
//                   ),
//                   Spacer(),
//                   Container(
//                     color: AppTheme.pparagraphColors,
//                     width: 1.0,
//                     height: MediaQuery.of(context).size.height,
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             Text(
//               txt,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.black,
//               ),
//             ),
//             Spacer(),
//           ],
//         ),
//       ),
//     ),
//   );
// }
