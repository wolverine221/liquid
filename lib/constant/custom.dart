/////////////////////CUSTOM BUTTON/////////////////////

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'constant.dart';

class CustomButtonS extends StatelessWidget {
  CustomButtonS({
    super.key,
    required this.colorbox,
    required this.title,
    required this.textcolor,
    required this.page,
    this.wid,
  });

  final Color textcolor;
  final Color colorbox;
  final String title;
  final double? wid;
  final VoidCallback page;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: page,
      child: Container(
        height: 50.h,
        width: wid ?? 300.w,
        decoration: BoxDecoration(
          color: colorbox,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////GO BACK ////////////////////////////

class Goback extends StatelessWidget {
  const Goback({
    super.key,
    required this.tapbutton,
    required this.colour,
  });

  final VoidCallback tapbutton;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 1.h,
            width: 125.w,
            color: colour,
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: tapbutton,
            child: Center(
              child: Text(
                'Go back',
                style: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: colour,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 1.h,
            width: 125.w,
            color: colour,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
      ],
    );
  }
}

///////////////// ALEERT DIALOG BOX /////////////////////////

class CustomAlertDialogBox extends StatelessWidget {
  const CustomAlertDialogBox({
    Key? key,
    required this.title,
    this.fonts,
    this.message,
    this.page,
  }) : super(key: key);

  final String title;
  final double? fonts;
  final String? message;
  final VoidCallback? page;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.primaryAccent,
      title: Image.asset('assets/icon/alertsign.png'),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w600,
          fontSize: fonts ?? 15,
          color: AppColors.primaryWhite.withOpacity(1.0),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            page?.call();
            Navigator.of(context).pop(); // Dismiss dialog
          },
          child: Center(
            child: Text(
              message ?? "OK",
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w800,
                fontSize: 18,
                color: AppColors.primaryWhite.withOpacity(1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/////////////////////////TEXT FORM FIELD ///////////////////////////////

class TextfieldC extends StatefulWidget {
  TextfieldC({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.showSuffixIcon = true,
    this.showDatePicker = false,
    required this.validator,
    this.customwid,
    this.date,
  });

  final String hint;
  VoidCallback? date;
  final bool showSuffixIcon;
  final double? customwid;
  final bool showDatePicker;
  final TextEditingController controller;
  bool obscureText;
  final String? Function(String?) validator;

  @override
  State<TextfieldC> createState() => _TextfieldCState();
}

class _TextfieldCState extends State<TextfieldC> with WidgetsBindingObserver {
  final FocusNode _focusNode = FocusNode();
  double _bottomPadding = 0;
  VoidCallback? date;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _bottomPadding = bottomInset;
    });
  }

  void _toggleVisibility() {
    setState(() {
      widget.obscureText = !widget.obscureText; // Toggle the state
    });
  }

  Future<void> _showDatePicker() async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 2.8,
                    ),
                  )),
              height: 200.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 170.h,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() {
                          widget.controller.text =
                              "${newDateTime.day}-${newDateTime.month}-${newDateTime.year}";
                        });
                      },
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Done',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.textBlack,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: SizedBox(
        width: widget.customwid ?? 330.w,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 2, color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: widget.controller,
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              validator: widget.validator,
              style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.primaryColor,
              ),
              cursorColor: AppColors.primaryColor,
              readOnly: widget.showDatePicker, // Make read-only if showing date picker
              onTap: widget.showDatePicker ? _showDatePicker : null,
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  color: AppColors.primaryWhite, // Change this to your desired color
                ),
                hintText: widget.hint,
                suffixIcon: widget.showSuffixIcon && widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          !widget.obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: _toggleVisibility,
                      )
                    : null,
                hintStyle: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
