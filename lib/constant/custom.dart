/////////////////////CUSTOM BUTTON/////////////////////

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../presentation/login.dart';
import 'constant.dart';

class CustomButtonS extends StatelessWidget {
  CustomButtonS({
    super.key,
    required this.colorbox,
    required this.title,
    required this.textcolor,
    required this.page,
    this.height,
    this.wid,
  });

  final Color textcolor;
  final Color colorbox;
  final String title;
  final double? wid;
  final double? height;
  final VoidCallback page;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: page,
      child: Container(
        height: height??50.h,
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
              decoration:
              InputDecoration(
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

///////////////CUSTOM APP BAR ????????????????????????????????

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    required this.title,
    this.page,
    super.key,
  });

  final String title;
  final VoidCallback? page;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              title,
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
                onPressed: page ??
                    () {
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
    );
  }
}

////////////////////Customappbar2/////////////////////////////

class CustomAppbarback extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbarback({
    this.widget,
    this.page,
    this.forward,
    required this.back,
    super.key,
    required this.front,
  });

  final Widget? widget;
  final VoidCallback? page;
  final VoidCallback? forward;
  final bool back;
  final bool front;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (back)
              GestureDetector(
                onTap: () {
                  if (forward != null) {
                    forward!();
                  } else {
                    Get.back();
                  }
                },
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    "assets/icon/back.png",
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
              )
            else
              Spacer(),
            widget ?? Spacer(),
            if (front)
              RotatedBox(
                quarterTurns: 2,
                child: GestureDetector(
                  onTap: () {
                    if (forward != null) {
                      forward!();
                    } else {
                      Get.back();
                    }
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      "assets/icon/back.png",
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            else
              Spacer(),
          ],
        ),
      ),
    );
  }
}


//////////////////////TEXTINBOX/////////////////

class TextinBox extends StatelessWidget {
  const TextinBox({
    super.key,
    this.height,
    this.width,
    required this.widget,
  });

  final Widget widget;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 220.h,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite.withOpacity(0.2),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(child: widget),
    );
  }
}

////////////////////// SEARCH BAR///////////////


class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  _CustomSearchBarState() {
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch() {
    // Implement search functionality here
    print('Search text: $_searchText');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          CustomButtonS(
            colorbox: Colors.blue,
            title: 'Search',
            textcolor: Colors.white,
            page: _onSearch,
            height: 50.0,
            wid: 100.0,
          ),
        ],
      ),
    );
  }
}