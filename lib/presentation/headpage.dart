import 'package:design/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Headpage extends StatelessWidget {
  const Headpage({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            // Customize height here
            child: AppBar(
              backgroundColor: AppColors.primaryColorDisabled,
              title:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Sweep',style: GoogleFonts.bevan(
                        fontSize: 32, color: Colors.white)
                      ),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: AppColors.appSecondary,
                          shape: BoxShape.circle,
                        ),
                      )
                      // IconButton(onPressed: (){} , icon: Icon(Icons.search))
                    ],
                  ),
                ],
              ),
            ),
          ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                SizedBox(
                  height: 280,
                  width: 280,
                  child:
                  CircleAvatar(
                    backgroundColor:Colors.transparent,
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: ClipOval(
                        child:
                        Image.asset("assets/alias.jpeg",fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )

        ),
      );
  }
}
