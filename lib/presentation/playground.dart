//import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
//
// import 'MyCardPage.dart';
//
// class MySample extends StatefulWidget {
//   const MySample({Key? key});
//
//   @override
//   State<StatefulWidget> createState() => MySampleState();
// }
//
// class MySampleState extends State<MySample> {
//   bool isLightTheme = false;
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   bool useGlassMorphism = false;
//   bool useBackgroundImage = false;
//   bool useFloatingAnimation = true;
//   final OutlineInputBorder border = OutlineInputBorder(
//     borderSide: BorderSide(
//       color: Colors.grey.withOpacity(0.7),
//       width: 2.0,
//     ),
//   );
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   late BuildContext scaffoldContext;
//
//   Glassmorphism? _getGlassmorphismConfig() {
//     if (!useGlassMorphism) {
//       return null;
//     }
//
//     final LinearGradient gradient = LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
//       stops: const <double>[0.3, 0],
//     );
//
//     return isLightTheme
//         ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
//         : Glassmorphism.defaultConfig();
//   }
//
//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber!;
//       expiryDate = creditCardModel.expiryDate!;
//       cardHolderName = creditCardModel.cardHolderName!;
//       cvvCode = creditCardModel.cvvCode!;
//       isCvvFocused = creditCardModel.isCvvFocused!;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
//     );
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Builder(
//         builder: (BuildContext context) {
//           scaffoldContext = context;
//           return Container(
//             decoration: BoxDecoration(
//                 // image: DecorationImage(
//                 //   image: ExactAssetImage(
//                 //     isLightTheme ? 'assets/bgimage.jpeg' : 'assets/bg_image.jpeg',
//                 //   ),
//                 //   fit: BoxFit.fill,
//                 // ),
//                 ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 // IconButton(
//                 //   onPressed: () => setState(() {
//                 //     isLightTheme = !isLightTheme;
//                 //   }),
//                 //   icon: Icon(
//                 //     isLightTheme ? Icons.light_mode : Icons.dark_mode,
//                 //   ),
//                 // ),
//                 CreditCardWidget(
//                   enableFloatingCard: useFloatingAnimation,
//                   glassmorphismConfig: _getGlassmorphismConfig(),
//                   cardNumber: cardNumber,
//                   expiryDate: expiryDate,
//                   cardHolderName: cardHolderName,
//                   cvvCode: cvvCode,
//                   bankName: 'FEDERAL BANK',
//                   frontCardBorder: useGlassMorphism ? null : Border.all(color: Colors.grey),
//                   backCardBorder: useGlassMorphism ? null : Border.all(color: Colors.grey),
//                   showBackView: isCvvFocused,
//                   obscureCardNumber: true,
//                   obscureCardCvv: true,
//                   isHolderNameVisible: true,
//                   // cardBgColor:
//                   //     isLightTheme ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
//                   // backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
//                   isSwipeGestureEnabled: true,
//                   onCreditCardWidgetChange: (CreditCardBrand? creditCardBrand) {},
//                   customCardTypeIcons: <CustomCardTypeIcon>[
//                     CustomCardTypeIcon(
//                       cardType: CardType.mastercard,
//                       cardImage: Image.asset(
//                         'assets/icon/msremove.png',
//                         height: 48,
//                         width: 48,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: <Widget>[
//                         CreditCardForm(
//                           formKey: formKey,
//                           obscureCvv: true,
//                           obscureNumber: true,
//                           cardNumber: cardNumber,
//                           cvvCode: cvvCode,
//                           isHolderNameVisible: true,
//                           isCardNumberVisible: true,
//                           isExpiryDateVisible: true,
//                           cardHolderName: cardHolderName,
//                           expiryDate: expiryDate,
//                           inputConfiguration: const InputConfiguration(
//                             cardNumberDecoration: InputDecoration(
//                               labelText: 'Number',
//                               hintText: 'XXXX XXXX XXXX XXXX',
//                             ),
//                             expiryDateDecoration: InputDecoration(
//                               labelText: 'Expired Date',
//                               hintText: 'XX/XX',
//                             ),
//                             cvvCodeDecoration: InputDecoration(
//                               labelText: 'CVV',
//                               hintText: 'XXX',
//                             ),
//                             cardHolderDecoration: InputDecoration(
//                               labelText: 'Card Holder',
//                             ),
//                           ),
//                           onCreditCardModelChange: onCreditCardModelChange,
//                         ),
//                         const SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               const Text('Glassmorphism'),
//                               const Spacer(),
//                               Switch(
//                                 value: useGlassMorphism,
//                                 inactiveTrackColor: Colors.grey,
//                                 activeColor: Colors.white,
//                                 activeTrackColor: Colors.red,
//                                 onChanged: (bool value) => setState(() {
//                                   useGlassMorphism = value;
//                                 }),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               const Text('Card Image'),
//                               const Spacer(),
//                               Switch(
//                                 value: useBackgroundImage,
//                                 inactiveTrackColor: Colors.grey,
//                                 activeColor: Colors.white,
//                                 activeTrackColor: Colors.green,
//                                 onChanged: (bool value) => setState(() {
//                                   useBackgroundImage = value;
//                                 }),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               const Text('Floating Card'),
//                               const Spacer(),
//                               Switch(
//                                 value: useFloatingAnimation,
//                                 inactiveTrackColor: Colors.grey,
//                                 activeColor: Colors.white,
//                                 activeTrackColor: Colors.yellow,
//                                 onChanged: (bool value) => setState(() {
//                                   useFloatingAnimation = value;
//                                 }),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         GestureDetector(
//                           onTap: _onValidate,
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 8,
//                             ),
//                             decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: <Color>[Colors.white, Colors.black],
//                                 begin: Alignment(-1, -4),
//                                 end: Alignment(1, 4),
//                               ),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             alignment: Alignment.center,
//                             child: const Text(
//                               'Validate',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: 'halter',
//                                 fontSize: 14,
//                                 package: 'flutter_credit_card',
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _onValidate() {
//     if (formKey.currentState?.validate() ?? false) {
//       showDialog(
//         context: scaffoldContext,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.black,
//             title: Text('Congrats'),
//             content: Text('Your card has been validated!'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => MyCardPage(
//                         cards: [
//                           CreditCardModel(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused)
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text('Okay'),
//               ),
//             ],
//           );
//         },
//       );
//       print('valid!');
//     } else {
//       print('invalid!');
//     }
//   }
// }























// appBar: CustomAppbarback(back: true,front: true,widget: Text('card selector', textAlign: TextAlign.center,
//         style: GoogleFonts.spaceGrotesk(
//           fontWeight: FontWeight.w800,
//           fontSize: 18,
//           color: AppColors.primaryWhite.withOpacity(1.0),
//         ),),),
