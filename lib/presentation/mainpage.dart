import 'package:design/presentation/goodtogo.dart';
import 'package:design/presentation/login.dart';
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
      appBar:
      CustomAppbar(title: 'Main Page',),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/bg_image.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      'Wallet Balance',
                      style: TextStyle(fontSize: 25, color: AppColors.primaryWhite),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      '\$ 10000000',
                      style: TextStyle(fontSize: 28, color: AppColors.primaryWhite),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 250.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),
                      border: Border.all(color: AppColors.primaryWhite.withOpacity(1.0), width: 1.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Container(
                    height: 90.w,
                    width: 340.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),
                      border: Border.all(color: AppColors.primaryWhite.withOpacity(0.4), width: 1.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Expense Amount',
                              style: TextStyle(fontSize: 14, color: AppColors.primaryWhite),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text(
                                '\$100',
                                style: TextStyle(fontSize: 30, color: AppColors.primaryWhite),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            LucideIcons.coins,
                            size: 60.0,
                            color: AppColors.primaryWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Container(
                    width: 340.w,
                    height: 90.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.white.withOpacity(0.0),
                        ],
                      ),
                      border: Border.all(color: AppColors.primaryWhite.withOpacity(0.4), width: 1.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Income Amount',
                              style: TextStyle(fontSize: 14, color: AppColors.primaryWhite),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text(
                                '\$100',
                                style: TextStyle(fontSize: 30, color: AppColors.primaryWhite),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            LucideIcons.coins,
                            size: 60.0,
                            color: AppColors.primaryWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'caesar',
                  style: TextStyle(fontSize: 20, color: AppColors.primaryWhite),
                ),
              ],
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
                      onPressed: () {
                        Get.to(Goodtogo());
                      },
                      icon: Icon(
                        LineIcons.tradeFederation,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Transaction',
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
                      onPressed: () {
                        Get.to(MySample());
                      },
                      icon: Icon(
                        LucideIcons.badgeX,
                        size: 32.0,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                    Text(
                      'Spam',
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
