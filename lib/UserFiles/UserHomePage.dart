// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/globals.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        elevation: 2,
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: AutoSizeText(
                'User Services',
                style: GoogleFonts.montserrat(
                    color: textColorInsideTextBox,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                width: Get.width * 0.2,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.grey.shade500,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Icon(
                            Icons.chat_rounded,
                            color: textColor,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: AutoSizeText(
                            'Chat With Agent',
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                width: Get.width * 0.2,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.grey.shade500,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Icon(
                            Icons.history_rounded,
                            color: textColor,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: AutoSizeText(
                            'Chat History',
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                  width: Get.width * 0.2,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.design_services_rounded,
                              color: textColor,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'IT Solutions/ Services',
                              style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                  width: Get.width * 0.2,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.join_full_rounded,
                              color: textColor,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Subscribed Plans',
                              style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                  width: Get.width * 0.2,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.contact_page_rounded,
                              color: textColor,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Contact',
                              style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                  width: Get.width * 0.2,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.info_outlined,
                              color: textColor,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'About',
                              style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
      backgroundColor: bannerColorOne,
      appBar: AppBar(
        leadingWidth: Get.width * 0.1,
        leading: SizedBox(
          width: Get.width * 0.1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(10),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.grey.shade500,
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20)
                ),
                onPressed: () {
                  Get.to(() => MainPage());
                },
                child: AutoSizeText(
                  'Log Out',
                  minFontSize: 20,
                  style: GoogleFonts.poppins(
                      color: textColor, fontWeight: FontWeight.bold),
                )),
          ),
        ),
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
        title: Image.asset(
          'futurenet.png',
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: Get.width * 0.4,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      color: bannerColorOne,
                      image: DecorationImage(
                          image: Image.asset('assets/banner1.png').image,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              bannerColorOne, BlendMode.lighten)),
                      borderRadius: BorderRadius.circular(Get.height * 0.05),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.4,
                            height: Get.height * 0.15,
                            child: AutoSizeText(
                              'Market leading Remote IT Support Services',
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                            height: Get.height * 0.25,
                            child: AutoSizeText(
                              'We are the leading provider of remote IT support in London and our remote IT support services give business unlimited access to our experienced IT Service Desk team. With many businesses choosing to implement a remote/hybrid workforce on a permanent basis; others will continue to work 100% remotely for the foreseeable future and some have to continue to have their entire workforce in the office.',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width * 0.4,
                            height: Get.height * 0.15,
                            child: AutoSizeText(
                              'The leading remote IT support company in World',
                              softWrap: true,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.4,
                            height: Get.height * 0.25,
                            child: AutoSizeText(
                              'We have 20 years experience in delivering remote IT Support and Infinity Group are  a certified Microsoft Gold partner across nine core competencies, our Service Desk are equipped with the latest up to date knowledge across the Microsoft application stack. Our remote IT Support service enables us to assist businesses whose workforces need a quick and efficient response when technical issues arise. Providing a fast efficient service is something we pride ourselves on which is why we aim to answer all support calls within 5 minutes.',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    width: Get.width * 0.4,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      color: bannerColorOne,
                      image: DecorationImage(
                          image: Image.asset('banner2.jpg').image,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              bannerColorOne, BlendMode.lighten)),
                      borderRadius: BorderRadius.circular(Get.height * 0.05),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: Get.width * 0.8,
                height: Get.height * 0.1,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.8,
                        child: AutoSizeText(
                          'Business benefits of using our remote IT support services',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                width: Get.width * 0.8,
                height: Get.width * 0.2,
                decoration: BoxDecoration(
                  color: bannerColorOne,
                  image: DecorationImage(
                      image: Image.asset('assurances.png').image,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(bannerColorOne, BlendMode.lighten)),
                  borderRadius: BorderRadius.circular(Get.height * 0.05),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Get.width * 0.3,
                      child: AutoSizeText(
                        'Service Desk\nPerformance',
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            '1 Min',
                            softWrap: true,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          AutoSizeText(
                            'Average Call Response Time',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            '80 %',
                            softWrap: true,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          AutoSizeText(
                            'First Contact Fix Rate',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * 0.2,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AutoSizeText(
                            '100 %',
                            softWrap: true,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          AutoSizeText(
                            'Customer Satisfaction',
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: Get.width * 0.1,
                          height: Get.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: Image.asset('24hour.png').image,
                              fit: BoxFit.scaleDown,
                            ),
                            borderRadius:
                                BorderRadius.circular(Get.height * 0.05),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.2,
                          width: Get.width * 0.4,
                          child: Center(
                            child: AutoSizeText(
                              'Strategic IT Security Consultancy and related Services',
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.4,
                          child: AutoSizeText(
                            'A robust approach to IT Security is paramount to ensure employees have access to everything they need to perform their roles but the business still has control of the data and storage of those files. Our IT Consultancy team can advise on best practise IT Security measures for your remote workers and for those businesses using our remote IT business support who adopt Bring Your Own Device BYOD policies.',
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          width: Get.width * 0.1,
                          height: Get.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: Image.asset('techsp.png').image,
                              fit: BoxFit.scaleDown,
                            ),
                            borderRadius:
                                BorderRadius.circular(Get.height * 0.05),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.2,
                          width: Get.width * 0.4,
                          child: Center(
                            child: AutoSizeText(
                              'Deploying the latest Business technology on the market',
                              softWrap: true,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.4,
                          width: Get.width * 0.4,
                          child: AutoSizeText(
                            'Whether you are interested in moving your business telephony within Microsoft Teams or your telecoms to a hosted telephony solution, Infinity Group have the experience and expertise to assist you. Microsoft 365 Business Voice, an affordable solution that enables Microsoft Teams calling can be deployed remotely and be accessed by employees across devices enabling them to work from anywhere on any device.',
                            softWrap: true,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.montserrat(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
