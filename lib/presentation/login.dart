import 'package:animations/animations.dart';
import 'package:design/constant/custom.dart';
import 'package:design/main.dart';
import 'package:design/presentation/icon.dart';
import 'package:design/presentation/login.dart';
import 'package:design/presentation/mainpage.dart';
import 'package:design/presentation/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../constant/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _expanded = false;
  bool _switch = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController(text: 'Hello');
  final TextEditingController _passwordController = TextEditingController(text: 'Password@123');

  @override
  void initState() {
    super.initState();
  }

  void _toggleSwitch() {
    setState(() {
      _switch = !_switch;
    });
  }

  void _toggleExpand() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      if (username == "Hello" && password == "Password@123") {
        Get.to(Mainheadpage());
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialogBox(
              title: 'The username or password is incorrect.',
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/bg_image.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: _expanded ? 0.h : 270.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/liquidremove.png',
                      height: 230.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Say hello to new universe!',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: AppColors.primaryColor.withOpacity(1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _expanded ? 280.h : 0.h,
                child: Image.asset(
                  'assets/liquidremove.png',
                  height: 200.h,
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  border: _switch
                      ? Border(
                          // left: BorderSide(
                          //   color: Colors.white,
                          //   width: 2.8,
                          // ),
                          top: BorderSide(
                            color: Colors.white,
                            width: 2.8,
                          ),
                          // right: BorderSide(
                          //   color: Colors.white,
                          //   width: 2.8,
                          // ),
                        )
                      : Border(
                          // left: BorderSide(
                          //   color: Colors.white,
                          //   width: 2.8,
                          // ),
                          top: BorderSide(
                            color: Colors.black,
                            width: 2.8,
                          ),
                          // right: BorderSide(
                          //   color: Colors.white,
                          //   width: 2.8,
                          // ),
                        ),
                  color: _switch ? Colors.black : AppColors.primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: _expanded ? Radius.circular(80) : Radius.circular(30),
                    topRight: _expanded ? Radius.circular(0) : Radius.circular(30),
                  ),
                ),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                height: _expanded ? 400.h : 120.h,
                alignment: Alignment.center,
                child: _expanded
                    ? RawScrollbar(
                        thickness: 2.0,
                        thumbColor: AppColors.primaryWhite,
                        radius: Radius.circular(20),
                        crossAxisMargin: 2.0,
                        mainAxisMargin: 20.0,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100.h,
                                  child: _switch
                                      ? Padding(
                                          padding: const EdgeInsets.only(top: 50),
                                          child: Text(
                                            "Welcome back my friend.\n click to access reality",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.spaceGrotesk(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _expanded ? 23 : 0,
                                              color: AppColors.primaryColor.withOpacity(0.8),
                                            ),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(top: 40),
                                          child: Text(
                                            "Experience the boundless possibilities of creativity with Liquid.",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.spaceGrotesk(
                                              fontWeight: FontWeight.w600,
                                              fontSize: _expanded ? 22 : 0,
                                              color: AppColors.textPrimary.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut,
                                        width: _switch ? MediaQuery.of(context).size.width : 300.w,
                                        height: _switch ? 300.h : 100.h,
                                        alignment: Alignment.center,
                                        child: _switch
                                            ? SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    TextfieldC(
                                                      hint: 'Username',
                                                      controller: _usernameController,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter a username';
                                                        } else if (value.length < 5 ||
                                                            value.length > 10) {
                                                          return 'Username: between 5 and 10 characters';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    TextfieldC(
                                                      hint: 'Password',
                                                      controller: _passwordController,
                                                      obscureText: true,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter a password';
                                                        } else if (!RegExp(
                                                                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                                                            .hasMatch(value)) {
                                                          return 'Password: 8+ alpha-numeric with special characters only';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    CustomButtonS(
                                                      wid: 330.w,
                                                      colorbox: AppColors.primaryWhite.withOpacity(0.9),
                                                      title: 'LOG IN',
                                                      textcolor:
                                                          AppColors.primaryAccent.withOpacity(1.0),
                                                      page: _login,
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    Goback(
                                                      tapbutton: () {
                                                        _toggleSwitch();
                                                        _usernameController.clear();
                                                        _passwordController.clear();
                                                      },
                                                      colour: AppColors.primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : CustomButtonS(
                                                colorbox: AppColors.primaryAccent.withOpacity(0.99),
                                                title: 'LOG IN',
                                                textcolor: AppColors.primaryColor,
                                                page: _toggleSwitch,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                                _switch
                                    ? SizedBox(height: 1.h)
                                    : OpenContainer(
                                        transitionDuration: Duration(milliseconds: 800),
                                        transitionType: ContainerTransitionType.fadeThrough,
                                        openBuilder: (context, _) => Signuppage(),
                                        closedElevation: 0,
                                        closedShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        closedColor: AppColors.primaryWhite,
                                        closedBuilder: (context, openContainer) => CustomButtonS(
                                          colorbox: AppColors.primaryColor,
                                          title: 'SIGN ME',
                                          textcolor: AppColors.primaryAccent.withOpacity(0.99),
                                          page: openContainer,
                                        ),
                                      ),
                                SizedBox(
                                  height: 90.h,
                                ),
                                _switch
                                    ? Container()
                                    : Goback(
                                        tapbutton: _toggleExpand,
                                        colour: AppColors.textBlack,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CustomButtonS(
                          colorbox: AppColors.primaryAccent.withOpacity(0.99),
                          title: 'SIGN ME UP',
                          textcolor: AppColors.primaryColor.withOpacity(0.99),
                          page: _toggleExpand,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
