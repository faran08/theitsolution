// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/UserFiles/About.dart';
import 'package:theitsolution/UserFiles/AvailableSolutions.dart';
import 'package:theitsolution/UserFiles/BoughtSolutions.dart';
import 'package:theitsolution/UserFiles/ChatHistory.dart';
import 'package:theitsolution/UserFiles/ChatWithAgent.dart';
import 'package:theitsolution/UserFiles/Contact.dart';

import '../globals.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Widget getDrawer(BuildContext context) {
  return Drawer(
    elevation: 2,
    backgroundColor: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                width: Get.width * 0.05,
                height: Get.width * 0.05,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Icon(
                  Icons.person,
                  size: Get.width * 0.03,
                  color: textColorInsideTextBox,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: AutoSizeText(
                auth.currentUser!.displayName!,
                minFontSize: 20,
                style: GoogleFonts.montserrat(
                  color: textColorInsideTextBox,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
            width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade500,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                onPressed: () {
                  Get.to(() => ChatWithAgent());
                },
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
                            color: textColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
            width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.grey.shade500,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                onPressed: () {
                  Get.to(() => ChatHistory());
                },
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
                            color: textColor, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
              width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.grey.shade500,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    Get.to(() => AvailableSolutions());
                  },
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
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
              width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.grey.shade500,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    Get.to(() => BoughtSolutions());
                  },
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
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
              width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.grey.shade500,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    Get.to(() => Contact());
                  },
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
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
              width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.grey.shade500,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    Get.to(() => About());
                  },
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
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SizedBox(
              width: context.width > 600 ? Get.width * 0.3 : Get.width * 0.8,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.grey.shade500,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                  onPressed: () {
                    auth.signOut();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(
                          Icons.offline_bolt_rounded,
                          color: textColor,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: AutoSizeText(
                          'Log Out',
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ))),
        )
      ],
    ),
  );
}
