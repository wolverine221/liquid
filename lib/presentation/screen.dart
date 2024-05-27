import 'package:animations/animations.dart';
import 'package:design/constant/constant.dart';
import 'package:design/presentation/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _screenState();
}

class _screenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/endos_prev_ui.png',
              width: 180.w,
              height: 104.h,
              fit: BoxFit.fill,
              // Adjust width and height as needed
            ),
            SizedBox(
              width: 50.w,
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // Button color
                child: InkWell(
                  hoverColor: AppColors.black, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 42.w,
                    height: 37.h,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.home,
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            ClipOval(
              child: Material(
                color: Colors.transparent, // Button color
                child: InkWell(
                  hoverColor: AppColors.black, // Splash color
                  onTap: () {},
                  child: SizedBox(
                    width: 42.w,
                    height: 37.h,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.search,
                        color: AppColors.primaryAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Divider(color: AppColors.textBlack,indent: 20,endIndent: 20,),
          BarWidget(
            title: 'ON TRENDING',
            fontcustom: GoogleFonts.ralewayDots,
            fs: 15,
            weight: FontWeight.bold,
            textcolor: AppColors.primaryColor,
            icon: LineIcons.infinity,
            iconColor: AppColors.primaryColor,
          ),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
