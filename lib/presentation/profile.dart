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
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/rendering.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

enum _SelectedTab { Profile, favorite, search, person }

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  var _selectedTab = _SelectedTab.Profile;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    var anim = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );
    return Scaffold(
      appBar: CustomAppbarback(back: true, front: false,),
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: SizedBox(
        height: 140,
        child: DotNavigationBar(
          selectedItemColor: Colors.black.withOpacity(0.7),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.black,
          unselectedItemColor: Colors.black,
          splashBorderRadius: 50,
          onTap: _handleIndexChanged,
          items: [
            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.handshake),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/bg_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Expanded(
                  flex:4,
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(height: 60.h,),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: 80.h,
                                child: CircleAvatar(
                                  radius: 56,
                                  backgroundColor: Colors.white,
                                  child: SizedBox(
                                      height: 60.h,
                                      child: ClipOval(child: Image.asset('assets/icon/profile.png'))),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hai, Alias User',
                                    style: GoogleFonts.ralewayDots(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                      color: AppColors.primaryWhite,
                                    ),
                                  ),
                                  Text(
                                    'Locus Pocus Locus Pocus Locus',
                                    style: GoogleFonts.ralewayDots(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.3,
                                      color: AppColors.primaryWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h,),


                        CustomSearchBar(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.primaryAccent,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButtonS(colorbox: AppColors.primaryWhite.withOpacity(0.9), title: 'eceec', textcolor: AppColors.textBlack.withOpacity(1.0), page: (){
                          Get.back();
                        },
                          wid: 320.w,
                          height: 50.h,
                        ),
                        SizedBox(height: 30.h,),
                        CustomButtonS(colorbox: AppColors.primaryWhite.withOpacity(0.9), title: 'eceec', textcolor: AppColors.textBlack.withOpacity(1.0), page: (){
                          Get.back();
                        },
                          wid: 320.w,
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
