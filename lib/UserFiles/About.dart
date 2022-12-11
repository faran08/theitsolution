// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import '../MainPage/MainPage.dart';
import '../globals.dart';
import 'UserCombinedFunctions.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bannerColorOne,
      endDrawer: getDrawer(context),
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
          return getDesktopLayout();
        } else {
          return getMobileLayout();
        }
      }),
    );
  }

  Widget getDesktopLayout() {
    return Center(
      child: Container(
        height: Get.height * 0.9,
        width: Get.width * 0.9,
        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
        decoration: BoxDecoration(
          color: colorOne,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                'About Us',
                style: GoogleFonts.poppins(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  'IT Support Solutions was initially founded in 2009 by Managing Director Justin Dean, to provide specialist IT support and IT consultancy services to financial services sector clients. Since its launch, HTL has rapidly evolved to offer a full range of cutting-edge, integrated and flexible products and services to a worldwide client base across all industries. Our experience and professionalism has been endorsed both by our clients and by many of the world\'s leading hardware and software manufacturers.\nAt HTL, we provide uniquely flexible, client-oriented solutions where service is paramount; we maintain a true can-do attitude - we will never say no!\nAll companies need to know that their IT support provider is not going to let them down when it comes to important projects. We will always find the right solution and are equally happy either functioning as project managers for your internal IT department or providing an experienced team to work under your own IT Director or project leader.\nHTL specialise in providing communication and information solutions which help you achieve your business objectives. We know that our success is entirely dependent upon that of our customers, so a great amount of care is spent understanding how you operate, and providing a rapid and effective response to the challenges and opportunities you may face from day to day.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getMobileLayout() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          // height: Get.height * 0.9,
          width: Get.width * 0.9,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          decoration: BoxDecoration(
            color: colorOne,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'About Us',
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    'IT Support Solutions was initially founded in 2009 by Managing Director Justin Dean, to provide specialist IT support and IT consultancy services to financial services sector clients. Since its launch, HTL has rapidly evolved to offer a full range of cutting-edge, integrated and flexible products and services to a worldwide client base across all industries. Our experience and professionalism has been endorsed both by our clients and by many of the world\'s leading hardware and software manufacturers.\nAt HTL, we provide uniquely flexible, client-oriented solutions where service is paramount; we maintain a true can-do attitude - we will never say no!\nAll companies need to know that their IT support provider is not going to let them down when it comes to important projects. We will always find the right solution and are equally happy either functioning as project managers for your internal IT department or providing an experienced team to work under your own IT Director or project leader.\nHTL specialise in providing communication and information solutions which help you achieve your business objectives. We know that our success is entirely dependent upon that of our customers, so a great amount of care is spent understanding how you operate, and providing a rapid and effective response to the challenges and opportunities you may face from day to day.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
