import 'package:design/presentation/login.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../constant/constant.dart';

class Mainheadpage extends StatefulWidget {
  const Mainheadpage({super.key});

  @override
  State<Mainheadpage> createState() => _MainheadpageState();
}

class _MainheadpageState extends State<Mainheadpage> {
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: AppColors.primaryWhite, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    LucideIcons.stepBack,
                    size: 28.0,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
              Text(
                'Main Page',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.primaryWhite,
                ),
              ),
              Container(
                height: 40.h,
                width: 45.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: AppColors.primaryWhite, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(Login());
                  },
                  icon: Icon(
                    LineIcons.home,
                    size: 28.0,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg_image.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(
            child: Text(
              'caesar',
              style: TextStyle(fontSize: 20, color: AppColors.primaryWhite),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: FlipCard(
          key: _cardKey,
          direction: FlipDirection.VERTICAL,
          side: CardSide.FRONT,
          speed: 750,
          onFlipDone: (status) {
            print(status);
          },
          front: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: AppColors.primaryWhite, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.home,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.home,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LineIcons.home,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _cardKey.currentState?.toggleCard();
                      },
                      icon: Icon(
                        LineIcons.addressBookAlt,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'More Option',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          back: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: AppColors.primaryWhite, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.badgeX,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.home,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        LucideIcons.badgeX,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        _cardKey.currentState?.toggleCard();
                      },
                      icon: Icon(
                        LucideIcons.alarmCheck,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'More Option',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
