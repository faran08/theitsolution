// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/globals.dart';
import 'UserCombinedFunctions.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: getDrawer(context),
      backgroundColor: bannerColorOne,
      appBar: AppBar(
        leadingWidth: Get.width * 0.1,
        leading: Container(),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              icon: Icon(
                Icons.menu_rounded,
                size: 35,
              ),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: Get.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: titleBox,
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
