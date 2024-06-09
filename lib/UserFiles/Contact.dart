// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import '../MainPage/MainPage.dart';
import '../globals.dart';
import 'UserCombinedFunctions.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              'Get in Touch',
              minFontSize: 30,
              style: GoogleFonts.poppins(
                  color: buttonColor, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: AutoSizeText(
                'If you have any questions about our IT services or would like to discuss a project you can get in touch with us on one of the following:',
                minFontSize: 20,
                style: GoogleFonts.poppins(
                    color: textColor, fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Call us on:',
                        minFontSize: 20,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        '02070936000 (Support team operates 24/7)',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: textColor, fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: AutoSizeText(
                          'Write to us:',
                          minFontSize: 20,
                          style: GoogleFonts.poppins(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      AutoSizeText(
                        'HTL Support - IT Support Services 40 Beaufort Court Admirals Way London, E14 9XL',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: textColor, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Email us at:',
                        minFontSize: 20,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.bold),
                      ),
                      AutoSizeText(
                        'help@htl.uk.com',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: textColor, fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: AutoSizeText(
                          'For Sales and General Enquiries:',
                          minFontSize: 20,
                          style: GoogleFonts.poppins(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      AutoSizeText(
                        'talk@htl.uk.com',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: textColor, fontWeight: FontWeight.normal),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'For Sales and General Enquiries:',
                      minFontSize: 20,
                      style: GoogleFonts.poppins(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: buttonColor, width: 2)),
                      child: AutoSizeText(
                        'Facebook',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: buttonColor, width: 2)),
                      child: AutoSizeText(
                        'Twitter',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: buttonColor, width: 2)),
                      child: AutoSizeText(
                        'Instagram',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: buttonColor, width: 2)),
                      child: AutoSizeText(
                        'LinkedIn',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: AutoSizeText(
                'Submit Feedback',
                minFontSize: 30,
                style: GoogleFonts.poppins(
                    color: buttonColor, fontWeight: FontWeight.bold),
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
                      onPressed: () {
                        // Get.to(() => Contact());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.contact_page_rounded,
                              color: textColorInsideTextBox,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Feed Back Form',
                              style: GoogleFonts.poppins(
                                  color: textColorInsideTextBox,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: AutoSizeText(
                'Our Strategic Partners',
                minFontSize: 30,
                style: GoogleFonts.poppins(
                    color: buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image.asset('assets/strategic_partners.png'),
            )
          ],
        ),
      ),
    );
  }

  Widget getMobileLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: AutoSizeText(
                  'Get in Touch',
                  minFontSize: 20,
                  style: GoogleFonts.poppins(
                      color: buttonColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Center(
                child: AutoSizeText(
                  'If you have any questions about our IT services or would like to discuss a project you can get in touch with us on one of the following:',
                  minFontSize: 12,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      color: textColor, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    'Call us on:',
                    minFontSize: 20,
                    style: GoogleFonts.poppins(
                        color: buttonColor, fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    '02070936000 (Support team operates 24/7)',
                    minFontSize: 15,
                    style: GoogleFonts.poppins(
                        color: textColor, fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: AutoSizeText(
                      'Write to us:',
                      minFontSize: 20,
                      style: GoogleFonts.poppins(
                          color: buttonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: AutoSizeText(
                      'HTL Support - IT Support Services 40 Beaufort Court Admirals Way London, E14 9XL',
                      minFontSize: 15,
                      style: GoogleFonts.poppins(
                          color: textColor, fontWeight: FontWeight.normal),
                    ),
                  ),
                  AutoSizeText(
                    'Email us at:',
                    minFontSize: 20,
                    style: GoogleFonts.poppins(
                        color: buttonColor, fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    'help@htl.uk.com',
                    minFontSize: 15,
                    style: GoogleFonts.poppins(
                        color: textColor, fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: AutoSizeText(
                      'For Sales and General Enquiries:',
                      minFontSize: 20,
                      style: GoogleFonts.poppins(
                          color: buttonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AutoSizeText(
                    'talk@htl.uk.com',
                    minFontSize: 15,
                    style: GoogleFonts.poppins(
                        color: textColor, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: buttonColor, width: 2)),
                    child: Center(
                      child: AutoSizeText(
                        'Facebook',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: buttonColor, width: 2)),
                    child: Center(
                      child: AutoSizeText(
                        'Twitter',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: buttonColor, width: 2)),
                    child: Center(
                      child: AutoSizeText(
                        'Instagram',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: buttonColor, width: 2)),
                    child: Center(
                      child: AutoSizeText(
                        'Linked In',
                        minFontSize: 15,
                        style: GoogleFonts.poppins(
                            color: buttonColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: AutoSizeText(
                      'Submit Feedback',
                      minFontSize: 30,
                      style: GoogleFonts.poppins(
                          color: buttonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SizedBox(
                        width: Get.width * 0.8,
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: buttonColor,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.grey.shade500,
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                            onPressed: () {
                              // Get.to(() => Contact());
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Icon(
                                    Icons.contact_page_rounded,
                                    color: textColorInsideTextBox,
                                    size: 30,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: AutoSizeText(
                                    'Feed Back Form',
                                    style: GoogleFonts.poppins(
                                        color: textColorInsideTextBox,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: AutoSizeText(
                      'Our Strategic Partners',
                      minFontSize: 30,
                      style: GoogleFonts.poppins(
                          color: buttonColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Image.asset('assets/strategic_partners.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
