import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:easy_localization/easy_localization.dart';

Widget customProduct({
  contex,
  dynamic? onTap,
  String? image,
  String? nameProd,
  String? txt,
  dynamic? date,
  String? openn,
  dynamic? ccc,
  bool? open,
  dynamic border,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 120,
      width: MediaQuery.of(contex).size.width,
      margin: const EdgeInsets.only(bottom: 10, right: 25, left: 25),
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 3.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 120,
            child: ClipRRect(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(20),
              //   bottomLeft: Radius.circular(20),
              // ),
              borderRadius: border,
              child: Image(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                image: NetworkImage(
                  image ?? "",
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameProd ?? "",
                  style: TextStyle(color: HexColor("A5A5A5")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  txt ?? "",
                  style: TextStyle(color: HexColor("A5A5A5")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/time.png",
                      width: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      openn ?? "",
                      style: TextStyle(color: ccc),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      date ?? "",
                      style: TextStyle(color: HexColor("A5A5A5")),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    ),
  );
}
