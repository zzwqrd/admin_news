import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget textOrder({
  String? txt,
  dynamic? pr,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      // top: 7,
      bottom: 15,
    ),
    child: Row(
      children: [
        Text(
          txt ?? "",
          style: TextStyle(
            fontSize: 14,
            color: HexColor("7B8E7A"),
          ),
        ),
        Spacer(),
        Row(
          children: [
            Text(
              pr ?? "0.0",
              style: TextStyle(
                fontSize: 14,
                color: HexColor("7B8E7A"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "SAR",
              style: TextStyle(
                fontSize: 14,
                color: HexColor("7B8E7A"),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
