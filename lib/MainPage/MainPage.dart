// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/AdminFiles/AdminHomePage.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/globals.dart';

import '../UserFiles/UserHomePage.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  void checkSignInImplementation() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        EasyLoading.dismiss();
        print('User is currently signed out!');
        Get.to(() => MainPage());
        Get.clearRouteTree();
      } else {
        EasyLoading.show(
          maskType: EasyLoadingMaskType.clear,
          status: 'Loading Privilidges',
        );
        users
            .where('email', isEqualTo: auth.currentUser!.email)
            .limit(1)
            .get()
            .then(
          (value) {
            if (value.docs.first['role'] == 'user') {
              print('User is signed in!');
              if (auth.currentUser != null) {
                EasyLoading.dismiss();
                Get.clearRouteTree();
                Get.to(() => UserHomePage());
              }
            } else {
              print('Admin is signed in!');
              if (auth.currentUser != null) {
                EasyLoading.dismiss();
                Get.clearRouteTree();
                Get.to(() => AdminHomePage());
              }
            }
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkSignInImplementation();
    return Scaffold(
      backgroundColor: bannerColorOne,
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade500,
                  ),
                  onPressed: () {
                    Get.to(() => MainLoginPage());
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(
                          Icons.login,
                          color: textColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: AutoSizeText(
                          'Log In',
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
        toolbarHeight: Get.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/futurenet.png',
          width: 80,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return getCommonHomePage();
        } else {
          return getCommonHomePageMobile();
        }
      }),
    );
  }
}
