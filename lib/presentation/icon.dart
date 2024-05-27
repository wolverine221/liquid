import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';


class BarWidget extends StatelessWidget {
  final String title;
  final Function fontcustom;
  final double fs;
  final Color textcolor;
  final FontWeight weight;
  final IconData icon;
  final Color iconColor;


  const BarWidget({
    super.key,
    required this.fontcustom,
    required this.title,
    required this.fs,
    required this.weight,
    required this.textcolor,
    required this.icon, // Added required for icon
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 38.h,
          width: 330.w,
          decoration: BoxDecoration(
            color: AppColors.textBlack,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17),topRight: Radius.circular(17)),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Padding(
          padding: const EdgeInsets.only(left: 15),
          child:
          Text(
            title,
            textAlign: TextAlign.left,
            style: fontcustom(fontWeight: weight, fontSize: fs, color: textcolor),
          ),
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
                    icon, // Using the provided icon parameter
                    color: iconColor, // Using the provided icon color parameter
                  ),
                ),
              ),
            ),
          ),
        ),
    ],
    ),
    ),
    );
  }
}







// class spam extends StatefulWidget {
//   @override
//   State<spam> createState() => _spamState();
// }

// class _spamState extends State<spam> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Open Container Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Open Container Example'),
//         ),
//         body: Center(
//           child: OpenContainer(
//             transitionDuration: Duration(milliseconds: 500),
//             closedBuilder: (BuildContext _, VoidCallback openContainer) {
//               return Container(
//                 width: 200,
//                 height: 100,
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Tap to Open',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               );
//             },
//             openBuilder: (BuildContext _, VoidCallback closeContainer) {
//               return Container(
//                 width: 200,
//                 height: 100,
//                 color: Colors.green,
//                 child: Center(
//                   child: Text(
//                     'Opened!',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  _renderBg() {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
    );
  }

  _renderAppBar(context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow,
      ),
    );
  }

  _renderContent(context) {
    return
      Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child:
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Front',),
              Text('Click here to flip back',
                  ),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Back', ),
              Text('Click here to flip front',
                 ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlipCard'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _renderBg(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _renderAppBar(context),
              Expanded(
                flex: 4,
                child: _renderContent(context),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
