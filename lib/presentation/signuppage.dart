import 'package:design/presentation/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../constant/constant.dart';
import '../constant/custom.dart';
import '../firebase/authenication.dart';
import 'homepage.dart';
import 'login.dart';

class Signuppage extends StatefulWidget {
  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      AuthenticationHelper()
          .signUp(email: email, password: password)
          .then((result) {
        if (result == null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return
                CustomAlertDialogBox(
                title: 'Congratulations new user',
                message: 'hit me up!',
                page: () {
                  Navigator.of(context).pop();
                  Future.delayed(
                    Duration(milliseconds: 100),
                        () {
                      Get.to(() => Mainheadpage());
                    },
                  );
                },
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return
                CustomAlertDialogBox(
                  title: 'Somethings when wrong',
                  message: result,
                  page: () {
                    // Navigator.of(context).pop();
                    // Future.delayed(
                    //   Duration(milliseconds: 200),
                    //       () {
                    //     Get.back();
                    //   },
                    // );
                  },
                );
            },
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text(
          //       result,
          //       style: TextStyle(fontSize: 16),
          //     ),
          //   ),
          // );
        }
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/bg_image.jpeg',
            fit: BoxFit.fitHeight,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            child: RawScrollbar(
              thickness: 2.0,
              thumbColor: AppColors.primaryWhite,
              radius: Radius.circular(20),
              crossAxisMargin: 2.0,
              mainAxisMargin: 20.0,
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/liquidremove.png',
                            height: 160.h,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 20.w,
                            ),
                            TextfieldC(
                              hint: 'First name',
                              controller: _firstnameController,
                              customwid: 160.w,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a first name';
                                } else if (value.length < 1 || value.length > 10) {
                                  return 'First name must be between 1 and 10 characters';
                                }
                                return null;
                              },
                            ),
                            TextfieldC(
                              hint: 'Last name',
                              customwid: 160.w,
                              controller: _lastnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a last name';
                                } else if (value.length < 1 || value.length > 10) {
                                  return 'Last name must be between 1 and 10 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextfieldC(
                          hint: 'User name',
                          controller: _userController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            } else if (value.length < 5 || value.length > 10) {
                              return 'Username must be between 5 and 10 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextfieldC(
                            hint: 'Mobile number',
                            controller: _mobileController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter mobile number';
                              } else if (!RegExp(r'^(?:[+0]9)?[0-9]{4,12}$').hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextfieldC(
                          showDatePicker: true,
                          hint: 'Date of birth',
                          controller: _dobController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextfieldC(
                          hint: 'Email address',
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email address';
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
                            } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                                .hasMatch(value)) {
                              return 'Password: 8+ alpha-numeric with special characters only';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextfieldC(
                          hint: 'Confirm Password',
                          controller: _confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
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
                          title: 'SIGN ME UP',
                          textcolor: AppColors.primaryAccent.withOpacity(1.0),
                          page: () => _signUp(context),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Goback(
                          tapbutton: () {
                            Get.back();
                          },
                          colour: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
