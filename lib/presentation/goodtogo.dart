import 'dart:ui';

import 'package:design/presentation/login.dart';
import 'package:design/presentation/mainpage.dart';
import 'package:design/presentation/signuppage.dart';
import 'package:design/presentation/spam.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../constant/constant.dart';
import '../constant/custom.dart';

class Goodtogo extends StatelessWidget {
  const Goodtogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/bg_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          // CustomAppbarback(
          //   // back: () {
          //   //   Get.back();
          //   // },
          //   back: true,
          //   front: false,
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Image.asset(
                    "assets/icon/check.png",
                    fit: BoxFit.cover,
                    color: Colors.white,
                    height: 70.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Congratulations,Jamie!',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                      color: AppColors.primaryWhite.withOpacity(1.0),
                    ),
                  ),
                  Text(
                    'You are ready to go.',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColors.primaryWhite.withOpacity(1.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Your next payment will be withdrawn on January 3rd. Beginning on January 3rd, all future payments will be withdrawn on the 3rd of each month from your bank account ending in 1262.',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: AppColors.primaryWhite.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextinBox(
                    height: 180.h,
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WE WILL HELP YOU',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: AppColors.primaryWhite.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/icon/mark.png",
                                fit: BoxFit.cover,
                                color: Colors.white,
                                height: 17.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Choose a Markus Invest Account',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.primaryWhite.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Image.asset(
                                  "assets/icon/mark.png",
                                  fit: BoxFit.cover,
                                  color: Colors.white,
                                  height: 17.h,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Select a portfolio that matches\nyour goals',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.primaryWhite.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/icon/mark.png",
                                fit: BoxFit.cover,
                                color: Colors.white,
                                height: 17.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Set up and fund your account',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.primaryWhite.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButtonS(
                      wid: MediaQuery.of(context).size.width,
                      colorbox: AppColors.primaryWhite,
                      title: 'GOT IT',
                      textcolor: AppColors.textBlack.withOpacity(1.0),
                      page: () {
                        Get.to(Mainheadpage());
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
