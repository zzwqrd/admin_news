import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget boxCart({
  context,
  String? image,
  String? txt,
  dynamic txtSize,
  String? price,
  String? addprice,
  int? count,
  int? countTow,
  dynamic plusTap,
  dynamic munTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      bottom: 10,
    ),
    child: Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: HexColor("#7b8e7a5e"),
            spreadRadius: -3,
            blurRadius: 10,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.network(
              // "https://www.annalindhfoundation.org/sites/default/files/styles/main_image_desktop/public/2019-10/bg-featured-second.jpg?itok=jF6hZXI8",
              image ?? "",
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt ?? "",
                  style: TextStyle(
                    fontSize: 13,
                    color: HexColor("7B8E7A"),
                    // //fontFamily: FontFamily.neoSansArabicLight,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  txtSize ?? "",
                  style: TextStyle(
                    fontSize: 11,
                    color: HexColor("7B8E7A"),
                    ////fontFamily: FontFamily.neoSansArabicLight,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          price ?? "",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("7B8E7A"),
                            //fontFamily: FontFamily.neoSansArabicLight,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SAR",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("7B8E7A"),
                            //fontFamily: FontFamily.neoSansArabicLight,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "* ${countTow}",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("7B8E7A"),
                            //fontFamily: FontFamily.neoSansArabicLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "=",
                      style: TextStyle(
                        fontSize: 13,
                        color: HexColor("7B8E7A"),
                        //fontFamily: FontFamily.neoSansArabicLight,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          addprice ?? "",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("7B8E7A"),
                            //fontFamily: FontFamily.neoSansArabicLight,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SAR",
                          style: TextStyle(
                            fontSize: 13,
                            color: HexColor("7B8E7A"),
                            //fontFamily: FontFamily.neoSansArabicLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: munTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2.5,
                        color: HexColor("7B8E7A"),
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: HexColor("7B8E7A"),
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  "${count}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: HexColor("7B8E7A"),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: plusTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2.5,
                        color: HexColor("7B8E7A"),
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: HexColor("7B8E7A"),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
