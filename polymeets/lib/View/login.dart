// ignore_for_file: prefer_const_constructors

import 'package:polymeets/View/home.dart';
import 'package:polymeets/View/swipe.dart';
//import 'package:datingapp/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:polymeets/View/userprofile.dart';
import 'package:polymeets/View/userInfoPages/phonenum.dart';
import 'package:polymeets/View/swipe.dart';
import 'package:polymeets/View/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                Colors.red,
                Colors.purple,
              ]),
        ),
        // color: Colors.redAccent,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/images/PolyMeLogoHibiscus.png'),
                ),
                //SizedBox(height: 30),
                Image(
                  height: 150,
                  width: 150,
                  image: AssetImage('assets/images/PolyMeetsWhite Logo.png'),
                ),
                SizedBox(height: 30),
                Container(
                  //height: 100,
                  width: 250,
                  // margin:
                  //     EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(fontSize: 10, color: Colors.white70),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'By tapping Create Account or Sign In, you agree to\n our'),
                            TextSpan(
                                text: ' Terms',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                                text:
                                    ' . Learn how we process your data in our\n'),
                            TextSpan(
                                text: ' Privacy Policy and Cookies Policy',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline)),
                          ]),
                      textAlign: TextAlign.center),
                ),
                SizedBox(height: 30),
                ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  buttonColor: Colors.white,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 82, 169))),
                    ),

                    onPressed: () async {
                      // final result = await FacebookAuth.instance.login(
                      //   permissions: [
                      //     'email',
                      //     'public_profile',
                      //     'user_birthday',
                      //     'user_friends',
                      //     'user_gender',
                      //     'user_link'
                      //   ],
                      // );
                      // if (result.status == LoginStatus.success) {
                      //   final userData =
                      //       await FacebookAuth.instance.getUserData(
                      //     fields:
                      //         "name,email,picture.width(200),birthday,friends,gender,link",
                      //   );
                      //   print(userData.toString());
                      // } else {
                      //   print("LOGIN FAILED");
                      // }
                      //
                      //
                      //
                      //
                      // final LoginResult result = await FacebookAuth.instance
                      //     .login(); // by the fault we request the email and the public profile
                      // if (result.status == LoginStatus.success) {
                      //   // you are logged
                      //   print("SUCCESS!!!!!!!!!!!!!!!s");
                      //   final AccessToken accessToken = result.accessToken;

                      //   if (accessToken != null) {
                      //     // user is logged
                      //     print("SUCCESS!!!!!!!!!!!!!!!s");
                      //   } else {
                      //     print("ERRORDASDADAS ");
                      //   }
                      // } else {
                      //   print("ERRORDASDABVB FDAS ");
                      // }
                      // final AccessToken accessToken =
                      //     await FacebookAuth.instance.accessToken;

//                       final LoginResult result = await FacebookAuth.instance.login(
//  permissions:['public_profile','email','pages_show_list','pages_messaging','pages_manage_metadata'],
// );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>

                                  //Swipe()

                                  Home()));
                    },
                    //=> authBloc.login(),
                    child: Text(
                      'CONTINUE WITH FACEBOOK',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 82, 226)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  buttonColor:
                      Color.fromARGB(255, 255, 82, 226).withOpacity(0.5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.white)),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PhoneNumber()));
                    },
                    //color: Colors.redAccent.withOpacity(0.5),
                    child: Text(
                      'USE PHONE NUMBER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Divider(
                  indent: 60,
                  endIndent: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'Trouble Signing In?',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
