// // ignore_for_file: deprecated_member_use

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:polymeets/View/userInfoPages/password.dart';

// enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

// class PhoneNumber extends StatefulWidget {
//   @override
//   _PhoneNumberState createState() => _PhoneNumberState();
// }

// class _PhoneNumberState extends State<PhoneNumber> {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;

//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();

//   FirebaseAuth _auth = FirebaseAuth.instance;

//   late String verificationId;

//   int _value = 1;

//   bool showLoading = false;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });

//     try {
//       final authCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);

//       setState(() {
//         showLoading = false;
//       });

//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Password()));
//       }
//     } on FirebaseException catch (e) {
//       setState(() {
//         showLoading = false;
//       });

//       _scaffoldKey.currentState!
//           .showSnackBar(SnackBar(content: Text(e.message!)));
//     }
//   }

//   getMobileForWidget(context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           child: Center(
//             child: Text(
//               'Enter Your Number',
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ),
//         ),
//         Container(
//           //color: Colors.blue,
//           padding: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 20),
//           child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 child: TextField(
//                   style: TextStyle(color: Colors.white),
//                   controller: phoneController,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white)),
//                     isDense: true, // important line
//                     contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                     labelText: 'phone number',
//                     prefix: Padding(
//                       padding: EdgeInsets.all(4),
//                       child: DropdownButton(
//                           value: _value,
//                           items: [
//                             DropdownMenuItem(
//                               child: Text('+61'),
//                               value: 1,
//                             ),
//                             DropdownMenuItem(
//                               child: Text('+64'),
//                               value: 2,
//                             )
//                           ],
//                           onChanged: (value) {
//                             setState(() {
//                               //_value = value;
//                             });
//                           }),
//                     ),
//                   ),
//                   maxLength: 12,
//                   keyboardType: TextInputType.number,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: new RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     side: BorderSide(color: Colors.redAccent))),
//             onPressed: () async {
//               setState(() {
//                 showLoading = true;
//               });

//               await _auth.verifyPhoneNumber(
//                   phoneNumber: "+61" + phoneController.text,
//                   verificationCompleted: (PhoneAuthCredential) async {
//                     setState(() {
//                       showLoading = false;
//                     });
//                     //signInWithPhoneAuthCredential(phoneAuthCredential);
//                   },
//                   verificationFailed: (verificationFailed) async {
//                     setState(() {
//                       showLoading = false;
//                     });
//                     _scaffoldKey.currentState!.showSnackBar(
//                       SnackBar(
//                         content: Text(verificationFailed.message!),
//                       ),
//                     );
//                   },
//                   codeSent: (verificationId, resendingToken) async {
//                     setState(() {
//                       showLoading = false;
//                       currentState =
//                           MobileVerificationState.SHOW_OTP_FORM_STATE;
//                       this.verificationId = verificationId;
//                     });
//                   },
//                   codeAutoRetrievalTimeout: (verificationId) async {});
//             },
//             child: Text(
//               'SEND CODE',
//               style: TextStyle(color: Colors.redAccent),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   getOtpFormWidget(context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Container(
//           child: Center(
//             child: Text(
//               'Enter Code',
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 40, right: 10, left: 10),
//           child: TextField(
//             controller: otpController,
//             decoration: InputDecoration(
//               //border: OutlineInputBorder(),
//               labelText: 'Enter Code',
//               prefix: Padding(
//                 padding: EdgeInsets.all(4),
//               ),
//             ),
//             //maxLength: 9,
//             keyboardType: TextInputType.number,
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           width: double.infinity,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 primary: Colors.white,
//                 shape: new RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     side: BorderSide(color: Colors.redAccent))),
//             onPressed: () async {
//               PhoneAuthCredential phoneAuthCredential =
//                   PhoneAuthProvider.credential(
//                       verificationId: verificationId,
//                       smsCode: otpController.text);

//               signInWithPhoneAuthCredential(phoneAuthCredential);
//             },
//             child: Text(
//               'VERIFY',
//               style: TextStyle(color: Colors.redAccent),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Center(
//         child: Container(
//           alignment: Alignment.centerLeft,
//           color: Colors.redAccent,
//           padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
//           child: SingleChildScrollView(
//               child: showLoading
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : currentState ==
//                           MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                       ? getMobileForWidget(context)
//                       : getOtpFormWidget(context)),
//         ),
//       ),
//     );
//   }
// }
