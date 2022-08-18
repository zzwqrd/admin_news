import 'package:admin_pnal/Helper/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget authLoader() {
  return SpinKitThreeBounce(
    size: 30,
    color: Colors.white,
  );
}

Widget btnLoader() {
  return SpinKitThreeBounce(
    size: 30,
    color: AppTheme.primaryColor,
  );
}

Widget dropDownLoader() {
  return SpinKitThreeBounce(
    size: 30,
    color: Colors.white,
  );
}

Widget authDropDownLoader() {
  return SpinKitThreeBounce(
    size: 30,
    color: Colors.white,
  );
}

Widget loader() {
  return Center(
    child: SpinKitCubeGrid(
      size: 30,
      color: AppTheme.primaryColor,
    ),
  );
}

Widget dialogLoader() {
  return Center(
    child: SpinKitThreeBounce(
      size: 30,
      color: AppTheme.primaryColor,
    ),
  );
}

Widget minyLoader() {
  return Center(
    child: SpinKitThreeBounce(
      size: 10,
      color: AppTheme.primaryColor,
    ),
  );
}

class HomeCategoriesLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: AppTheme.primaryColor,
      size: 30,
    );
  }
}

// class ShimmerVerticalListView extends StatelessWidget {
//   final double? height;
//   final double? width;
//   const ShimmerVerticalListView(this.height, {this.width});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: 20,
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return Shimmer.fromColors(
//             baseColor: Colors.black12.withOpacity(0.1),
//             highlightColor: Colors.black.withOpacity(0.2),
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10, left: 10),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   color: Colors.red,
//                 ),
//                 width: width ?? MediaQuery.of(context).size.width,
//                 height: height,
//                 margin: EdgeInsets.all(8),
//               ),
//             ),
//           );
//         });
//   }
// }
