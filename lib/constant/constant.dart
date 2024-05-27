
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // /#5C418E
  static const Color primaryColor = Color(0xfffafafa);
  static const Color primaryColorDisabled = Color(0xd72c3e6b);
  static const Color primaryAccent = Color(0xff191a1c);
  static const Color primaryAccent2 = Color(0xffafb0b6);
  static const Color gold = Color(0xffe4a954);
  static const Color bgbrown = Color(0xff0b0c0c);
  static const Color primaryWhite = Color(0xF5FBFBFF);
  static const Color black = Color(0xFF151414);

  AppColors._();
  factory AppColors.forSwatch() {
    return AppColors._();
  }
  MaterialColor customSwatch = MaterialColor(primaryColor.value, {
    50: primaryColor.withOpacity(0.1),
    100: primaryColor.withOpacity(0.2),
    200: primaryColor.withOpacity(0.3),
    300: primaryColor.withOpacity(0.4),
    400: primaryColor.withOpacity(0.5),
    500: primaryColor, // Primary color
    600: primaryColor.withOpacity(0.6),
    700: primaryColor.withOpacity(0.7),
    800: primaryColor.withOpacity(0.8),
    900: primaryColor.withOpacity(0.9),
  });

  static const Color textBlack = Color(0xff323232);
  static const Color subTextBlack = Color(0xff535353);
  static const Color lightGreyBg = Color(0xffF1F1F1);
  static const Color bgLight = Color(0xffF7F4FB);
  static const Color blackRed = Color(0xff676262);
  static const Color dimBlack = Color(0xff7a7a7a);
  static const Color labelGray = Color(0xff999999);
  static const Color lightestGray = Color(0xfff6f6f6);
  static const Color textGray = Color(0xffA4A4A4);
  static const Color lineGray = Color(0xffb7b6b6);
  static const Color bgGray = Color(0xfff5f4f4);
  static const Color cardBg = Color(0xffF5F5F5);
  static const Color backgroundColor = Color(0xffEEEEEE);
  static const Color lightBlue = Color(0xff479ED0);

  static const Color textPrimary = Color(0xff211f1f);
  static const Color appSecondary = Color(0xff01A6E0);
  static const Color textButton = Color(0xff3D436D);
  static const Color darkPrimary = Color(0xff9F1118);
  static const Color lightRed = Color(0xffE33C40);
  static const Color lightPink = Color(0xffEEDFE0);
  static const Color lightGrayPink = Color(0xffcbbfc1);
  static const Color lightGreen = Color(0xff10D60F);
  static const Color darkerPrimary = Color(0xff650a00);
  static const Color errorRed = Color(0xffE72C1D);
  static const Color textSecondary = Color(0xff5A5A5A);
  static const Color blueWhite = Color(0xffF2F3F7);
  static const Color appPrimary20 = Color(0x33c4161c);

  // static const Color sheetBgPrimary = Color(0xff9b9ea6);
  static const Color sheetBgPrimary = Color(0xfff5f4f4);
  static const Color lightPrimary = Color(0xfff4f4f6);
  static const Color bgPrimary = Color(0xfffafafa);
  static const Color mediumPrimary = Color(0xfffafafa);
  static const Color white = Color(0xfffafafa);
  static const whiteGray = Color(0xfff5f5f5);

  static const cardGrad = LinearGradient(
    colors: [Color(0xff5397ea), Color(0xff994fe8)],
    stops: [0.25, 0.75],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}

class Constants {
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}



//import 'package:animations/animations.dart';
// import 'package:design/constant/constant.dart';
// import 'package:design/presentation/homepage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:line_icons/line_icons.dart';
//
// class screen extends StatelessWidget {
//   const screen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/endos_prev_ui.png',
//               width: 180.w,
//               height: 104.h,
//               fit: BoxFit.fill,
//               // Adjust width and height as needed
//             ),
//             SizedBox(
//               width: 50.w,
//             ),
//             ClipOval(
//               child: Material(
//                 color: Colors.transparent, // Button color
//                 child: InkWell(
//                   hoverColor: AppColors.black, // Splash color
//                   onTap: () {},
//                   child: SizedBox(
//                     width: 42.w,
//                     height: 37.h,
//                     child: IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           LineIcons.home,
//                           color: AppColors.primaryAccent,
//                         )),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10.w,
//             ),
//             OpenContainer(
//               transitionType: ContainerTransitionType.fadeThrough,
//               openBuilder: (BuildContext context, VoidCallback _) {
//                 return Container(
//                   child: IconButton(onPressed: Get.back, icon: Icon(Icons.abc_sharp,color: AppColors.black,)),
//                 );
//               },
//               closedBuilder: (BuildContext context, VoidCallback openContainer) {
//                 return ClipOval(
//                   child: Material(
//                     color: Colors.transparent, // Button color
//                     child: InkWell(
//                       hoverColor: AppColors.black, // Splash color
//                       onTap: () {},
//                       child: SizedBox(
//                         width: 42.w,
//                         height: 37.h,
//                         child: IconButton(
//                             onPressed: openContainer,
//                             icon: Icon(
//                               LineIcons.search,
//                               color: AppColors.primaryAccent,
//                             )),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Container(),
//     );
//   }
// },