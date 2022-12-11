library theitsolution;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/UserFiles/UserHomePage.dart';

Color colorOne = const Color(0xFF022342);
Color buttonColor = const Color(0xFF00dca5);
Color buttonColorTwo = const Color(0xFFe7faff);
Color textColor = Colors.white;
Color textColorInsideTextBox = Colors.black;
Color bannerColorOne = const Color(0xFF320838);
String globalUserName = '';
String globalEmailAddress = '';

List<String> professions_list = [
  'Waiter',
  'Paramedic',
  'Dentist',
  'Train conductor',
  'Nurse',
  'Electrician',
  'Doctor',
  'Businessman',
  'American football player',
  'Student',
  'Surgeon',
  'Doorman',
  'Secretary',
  'Soldier',
  'Repairman',
  'Scientist',
  'Reporter',
  'Construction worker',
  'Professor',
  'Police officer',
  'Postman',
  'Photographer',
  'Pilot',
  'Catholic nun',
  'Painter',
  'Mechanic',
  'Magician',
  'Lifeguard',
  'Lunchroom supervisor',
  'Clown',
  'Housekeeper',
  'Gardener',
  'Geisha',
  'Footballer',
  'Forest ranger',
  'Builder',
  'Foreman',
  'Farmer',
  'Flight attendant',
  'Fireman',
  'Engineer',
  'Carpenter',
  'Architect',
  'Boxer',
  'Cameraman',
  'Detective',
  'Journalist',
  'Housewife',
  'Diver',
  'Pope',
  'Priest',
  'Salesman',
  'Librarian',
  'Pirate',
  'Singer'
];

Widget getCommonHomePageMobile() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width * 0.9,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: bannerColorOne,
            borderRadius: BorderRadius.circular(Get.height * 0.05),
          ),
          child: AspectRatio(
            aspectRatio: 10 / 8,
            child: Image(
              image: Image.asset('assets/banner1.png').image,
              fit: BoxFit.cover, // use this
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.9,
          // height: Get.height * 0.5,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: AutoSizeText(
                    'Market leading Remote IT Support Services',
                    style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(
                  child: AutoSizeText(
                    'We are the leading provider of remote IT support in London and our remote IT support services give business unlimited access to our experienced IT Service Desk team. With many businesses choosing to implement a remote/hybrid workforce on a permanent basis; others will continue to work 100% remotely for the foreseeable future and some have to continue to have their entire workforce in the office.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.9,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
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
                  child: AutoSizeText(
                    'We have 20 years experience in delivering remote IT Support and Infinity Group are  a certified Microsoft Gold partner across nine core competencies, our Service Desk are equipped with the latest up to date knowledge across the Microsoft application stack. Our remote IT Support service enables us to assist businesses whose workforces need a quick and efficient response when technical issues arise. Providing a fast efficient service is something we pride ourselves on which is why we aim to answer all support calls within 5 minutes.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: Get.width * 0.9,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: bannerColorOne,
            borderRadius: BorderRadius.circular(Get.height * 0.05),
          ),
          child: AspectRatio(
            aspectRatio: 10 / 8,
            child: Image(
              image: Image.asset('assets/banner2.png').image,
              fit: BoxFit.cover, // use this
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.8,
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
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          width: Get.width,
          height: Get.width * 0.3,
          decoration: BoxDecoration(
            color: bannerColorOne,
            image: DecorationImage(
                image: Image.asset('assets/assurances.png').image,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(bannerColorOne, BlendMode.lighten)),
            borderRadius: BorderRadius.circular(Get.height * 0.02),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * 0.3,
                child: AutoSizeText(
                  'Service\nDesk\nPerformance',
                  softWrap: true,
                  maxLines: 3,
                  minFontSize: 15,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: Get.width * 0.5,
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
                          fontSize: 20),
                    ),
                    AutoSizeText(
                      'Average Call Response Time',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                width: Get.width * 0.5,
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
                          fontSize: 20),
                    ),
                    AutoSizeText(
                      'First Contact Fix Rate',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width * 0.5,
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
                          fontSize: 20),
                    ),
                    AutoSizeText(
                      'Customer Satisfaction',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
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
                    width: Get.width * 0.2,
                    height: Get.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // image: DecorationImage(
                      //   image: .image,
                      //   fit: BoxFit.none,
                      // ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/24hour.png',
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                    width: Get.width * 0.4,
                    child: Center(
                      child: AutoSizeText(
                        'Strategic IT Security Consultancy and related Services',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    height: Get.height * 0.6,
                    child: AutoSizeText(
                      'A robust approach to IT Security is paramount to ensure employees have access to everything they need to perform their roles but the business still has control of the data and storage of those files. Our IT Consultancy team can advise on best practise IT Security measures for your remote workers and for those businesses using our remote IT business support who adopt Bring Your Own Device BYOD policies.',
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.montserrat(
                        color: textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: Get.width * 0.2,
                    height: Get.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // image: DecorationImage(
                      //   image: .image,
                      //   fit: BoxFit.none,
                      // ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/techsp.png',
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.2,
                    width: Get.width * 0.4,
                    child: Center(
                      child: AutoSizeText(
                        'Deploying the latest Business technology on the market',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.6,
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
  );
}

Widget getCommonHomePage() {
  return SingleChildScrollView(
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
                      colorFilter:
                          ColorFilter.mode(bannerColorOne, BlendMode.lighten)),
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
                          minFontSize: 30,
                          style: GoogleFonts.montserrat(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
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
                          minFontSize: 30,
                          style: GoogleFonts.montserrat(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
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
                      image: Image.asset('assets/banner2.jpg').image,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(bannerColorOne, BlendMode.lighten)),
                  borderRadius: BorderRadius.circular(Get.height * 0.05),
                ),
              )
            ],
          ),
          SizedBox(
            width: Get.width * 0.8,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Business benefits of using our remote IT support services',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    minFontSize: 30,
                    style: GoogleFonts.montserrat(
                      color: textColor,
                      fontWeight: FontWeight.bold,
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
                  image: Image.asset('assets/assurances.png').image,
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
                          image: Image.asset('assets/24hour.png').image,
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius: BorderRadius.circular(Get.height * 0.05),
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
                          image: Image.asset('assets/techsp.png').image,
                          fit: BoxFit.scaleDown,
                        ),
                        borderRadius: BorderRadius.circular(Get.height * 0.05),
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
  );
}

Widget titleBox = IconButton(
    onPressed: () {
      Get.to(() => UserHomePage());
    },
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    iconSize: Get.width * 0.3,
    icon: Image.asset(
      'assets/futurenet.png',
      width: 80,
    ));

// GestureDetector(
//   onTap: () {
//     Get.to(() => UserHomePage());
//   },
//   child: Container(
//     width: Get.width * 0.1,
//     height: Get.height * 0.1,
//     decoration: BoxDecoration(
//         image: DecorationImage(
//       image: Image.asset(
//         'assets/futurenet.png',
//       ).image,
//       fit: BoxFit.contain,
//     )),
//   ),
// );

final List<Map> countryList = [
  {"Code": "AU", "Name": "Australia"},
  {"Code": "BH", "Name": "Bahrain"},
  {"Code": "IN", "Name": "India"},
  {"Code": "PK", "Name": "Pakistan"},
  {"Code": "SE", "Name": "Sweden"},
  {"Code": "GB", "Name": "United Kingdom"},
  {"Code": "US", "Name": "United States"}
];

final List<Map> countryList2 = [
  {"Code": "AF", "Name": "Afghanistan"},
  {"Code": "AL", "Name": "Albania"},
  {"Code": "DZ", "Name": "Algeria"},
  {"Code": "AS", "Name": "American Samoa"},
  {"Code": "AD", "Name": "Andorra"},
  {"Code": "AO", "Name": "Angola"},
  {"Code": "AI", "Name": "Anguilla"},
  {"Code": "AQ", "Name": "Antarctica"},
  {"Code": "AG", "Name": "Antigua and Barbuda"},
  {"Code": "AR", "Name": "Argentina"},
  {"Code": "AM", "Name": "Armenia"},
  {"Code": "AW", "Name": "Aruba"},
  {"Code": "AU", "Name": "Australia"},
  {"Code": "AT", "Name": "Austria"},
  {"Code": "AZ", "Name": "Azerbaijan"},
  {"Code": "BS", "Name": "Bahamas"},
  {"Code": "BH", "Name": "Bahrain"},
  {"Code": "BD", "Name": "Bangladesh"},
  {"Code": "BB", "Name": "Barbados"},
  {"Code": "BY", "Name": "Belarus"},
  {"Code": "BE", "Name": "Belgium"},
  {"Code": "BZ", "Name": "Belize"},
  {"Code": "BJ", "Name": "Benin"},
  {"Code": "BM", "Name": "Bermuda"},
  {"Code": "BT", "Name": "Bhutan"},
  {"Code": "BO", "Name": "Bolivia, Plurinational State of"},
  {"Code": "BQ", "Name": "Bonaire, Sint Eustatius and Saba"},
  {"Code": "BA", "Name": "Bosnia and Herzegovina"},
  {"Code": "BW", "Name": "Botswana"},
  {"Code": "BV", "Name": "Bouvet Island"},
  {"Code": "BR", "Name": "Brazil"},
  {"Code": "IO", "Name": "British Indian Ocean Territory"},
  {"Code": "BN", "Name": "Brunei Darussalam"},
  {"Code": "BG", "Name": "Bulgaria"},
  {"Code": "BF", "Name": "Burkina Faso"},
  {"Code": "BI", "Name": "Burundi"},
  {"Code": "KH", "Name": "Cambodia"},
  {"Code": "CM", "Name": "Cameroon"},
  {"Code": "CA", "Name": "Canada"},
  {"Code": "CV", "Name": "Cape Verde"},
  {"Code": "KY", "Name": "Cayman Islands"},
  {"Code": "CF", "Name": "Central African Republic"},
  {"Code": "TD", "Name": "Chad"},
  {"Code": "CL", "Name": "Chile"},
  {"Code": "CN", "Name": "China"},
  {"Code": "CX", "Name": "Christmas Island"},
  {"Code": "CC", "Name": "Cocos (Keeling) Islands"},
  {"Code": "CO", "Name": "Colombia"},
  {"Code": "KM", "Name": "Comoros"},
  {"Code": "CG", "Name": "Congo"},
  {"Code": "CD", "Name": "Congo, the Democratic Republic of the"},
  {"Code": "CK", "Name": "Cook Islands"},
  {"Code": "CR", "Name": "Costa Rica"},
  {"Code": "CI", "Name": "C\u00f4te d'Ivoire"},
  {"Code": "HR", "Name": "Croatia"},
  {"Code": "CU", "Name": "Cuba"},
  {"Code": "CW", "Name": "Cura\u00e7ao"},
  {"Code": "CY", "Name": "Cyprus"},
  {"Code": "CZ", "Name": "Czech Republic"},
  {"Code": "DK", "Name": "Denmark"},
  {"Code": "DJ", "Name": "Djibouti"},
  {"Code": "DM", "Name": "Dominica"},
  {"Code": "DO", "Name": "Dominican Republic"},
  {"Code": "EC", "Name": "Ecuador"},
  {"Code": "EG", "Name": "Egypt"},
  {"Code": "SV", "Name": "El Salvador"},
  {"Code": "GQ", "Name": "Equatorial Guinea"},
  {"Code": "ER", "Name": "Eritrea"},
  {"Code": "EE", "Name": "Estonia"},
  {"Code": "ET", "Name": "Ethiopia"},
  {"Code": "FK", "Name": "Falkland Islands (Malvinas)"},
  {"Code": "FO", "Name": "Faroe Islands"},
  {"Code": "FJ", "Name": "Fiji"},
  {"Code": "FI", "Name": "Finland"},
  {"Code": "FR", "Name": "France"},
  {"Code": "GF", "Name": "French Guiana"},
  {"Code": "PF", "Name": "French Polynesia"},
  {"Code": "TF", "Name": "French Southern Territories"},
  {"Code": "GA", "Name": "Gabon"},
  {"Code": "GM", "Name": "Gambia"},
  {"Code": "GE", "Name": "Georgia"},
  {"Code": "DE", "Name": "Germany"},
  {"Code": "GH", "Name": "Ghana"},
  {"Code": "GI", "Name": "Gibraltar"},
  {"Code": "GR", "Name": "Greece"},
  {"Code": "GL", "Name": "Greenland"},
  {"Code": "GD", "Name": "Grenada"},
  {"Code": "GP", "Name": "Guadeloupe"},
  {"Code": "GU", "Name": "Guam"},
  {"Code": "GT", "Name": "Guatemala"},
  {"Code": "GG", "Name": "Guernsey"},
  {"Code": "GN", "Name": "Guinea"},
  {"Code": "GW", "Name": "Guinea-Bissau"},
  {"Code": "GY", "Name": "Guyana"},
  {"Code": "HT", "Name": "Haiti"},
  {"Code": "HM", "Name": "Heard Island and McDonald Islands"},
  {"Code": "VA", "Name": "Holy See (Vatican City State)"},
  {"Code": "HN", "Name": "Honduras"},
  {"Code": "HK", "Name": "Hong Kong"},
  {"Code": "HU", "Name": "Hungary"},
  {"Code": "IS", "Name": "Iceland"},
  {"Code": "IN", "Name": "India"},
  {"Code": "ID", "Name": "Indonesia"},
  {"Code": "IR", "Name": "Iran, Islamic Republic of"},
  {"Code": "IQ", "Name": "Iraq"},
  {"Code": "IE", "Name": "Ireland"},
  {"Code": "IM", "Name": "Isle of Man"},
  {"Code": "IL", "Name": "Israel"},
  {"Code": "IT", "Name": "Italy"},
  {"Code": "JM", "Name": "Jamaica"},
  {"Code": "JP", "Name": "Japan"},
  {"Code": "JE", "Name": "Jersey"},
  {"Code": "JO", "Name": "Jordan"},
  {"Code": "KZ", "Name": "Kazakhstan"},
  {"Code": "KE", "Name": "Kenya"},
  {"Code": "KI", "Name": "Kiribati"},
  {"Code": "KP", "Name": "Korea, Democratic People's Republic of"},
  {"Code": "KR", "Name": "Korea, Republic of"},
  {"Code": "KW", "Name": "Kuwait"},
  {"Code": "KG", "Name": "Kyrgyzstan"},
  {"Code": "LA", "Name": "Lao People's Democratic Republic"},
  {"Code": "LV", "Name": "Latvia"},
  {"Code": "LB", "Name": "Lebanon"},
  {"Code": "LS", "Name": "Lesotho"},
  {"Code": "LR", "Name": "Liberia"},
  {"Code": "LY", "Name": "Libya"},
  {"Code": "LI", "Name": "Liechtenstein"},
  {"Code": "LT", "Name": "Lithuania"},
  {"Code": "LU", "Name": "Luxembourg"},
  {"Code": "MO", "Name": "Macao"},
  {"Code": "MK", "Name": "Macedonia, the Former Yugoslav Republic of"},
  {"Code": "MG", "Name": "Madagascar"},
  {"Code": "MW", "Name": "Malawi"},
  {"Code": "MY", "Name": "Malaysia"},
  {"Code": "MV", "Name": "Maldives"},
  {"Code": "ML", "Name": "Mali"},
  {"Code": "MT", "Name": "Malta"},
  {"Code": "MH", "Name": "Marshall Islands"},
  {"Code": "MQ", "Name": "Martinique"},
  {"Code": "MR", "Name": "Mauritania"},
  {"Code": "MU", "Name": "Mauritius"},
  {"Code": "YT", "Name": "Mayotte"},
  {"Code": "MX", "Name": "Mexico"},
  {"Code": "FM", "Name": "Micronesia, Federated States of"},
  {"Code": "MD", "Name": "Moldova, Republic of"},
  {"Code": "MC", "Name": "Monaco"},
  {"Code": "MN", "Name": "Mongolia"},
  {"Code": "ME", "Name": "Montenegro"},
  {"Code": "MS", "Name": "Montserrat"},
  {"Code": "MA", "Name": "Morocco"},
  {"Code": "MZ", "Name": "Mozambique"},
  {"Code": "MM", "Name": "Myanmar"},
  {"Code": "NA", "Name": "Namibia"},
  {"Code": "NR", "Name": "Nauru"},
  {"Code": "NP", "Name": "Nepal"},
  {"Code": "NL", "Name": "Netherlands"},
  {"Code": "NC", "Name": "New Caledonia"},
  {"Code": "NZ", "Name": "New Zealand"},
  {"Code": "NI", "Name": "Nicaragua"},
  {"Code": "NE", "Name": "Niger"},
  {"Code": "NG", "Name": "Nigeria"},
  {"Code": "NU", "Name": "Niue"},
  {"Code": "NF", "Name": "Norfolk Island"},
  {"Code": "MP", "Name": "Northern Mariana Islands"},
  {"Code": "NO", "Name": "Norway"},
  {"Code": "OM", "Name": "Oman"},
  {"Code": "PK", "Name": "Pakistan"},
  {"Code": "PW", "Name": "Palau"},
  {"Code": "PS", "Name": "Palestine, State of"},
  {"Code": "PA", "Name": "Panama"},
  {"Code": "PG", "Name": "Papua New Guinea"},
  {"Code": "PY", "Name": "Paraguay"},
  {"Code": "PE", "Name": "Peru"},
  {"Code": "PH", "Name": "Philippines"},
  {"Code": "PN", "Name": "Pitcairn"},
  {"Code": "PL", "Name": "Poland"},
  {"Code": "PT", "Name": "Portugal"},
  {"Code": "PR", "Name": "Puerto Rico"},
  {"Code": "QA", "Name": "Qatar"},
  {"Code": "RE", "Name": "R\u00e9union"},
  {"Code": "RO", "Name": "Romania"},
  {"Code": "RU", "Name": "Russian Federation"},
  {"Code": "RW", "Name": "Rwanda"},
  {"Code": "BL", "Name": "Saint Barth\u00e9lemy"},
  {"Code": "SH", "Name": "Saint Helena, Ascension and Tristan da Cunha"},
  {"Code": "KN", "Name": "Saint Kitts and Nevis"},
  {"Code": "LC", "Name": "Saint Lucia"},
  {"Code": "MF", "Name": "Saint Martin (French part)"},
  {"Code": "PM", "Name": "Saint Pierre and Miquelon"},
  {"Code": "VC", "Name": "Saint Vincent and the Grenadines"},
  {"Code": "WS", "Name": "Samoa"},
  {"Code": "SM", "Name": "San Marino"},
  {"Code": "ST", "Name": "Sao Tome and Principe"},
  {"Code": "SA", "Name": "Saudi Arabia"},
  {"Code": "SN", "Name": "Senegal"},
  {"Code": "RS", "Name": "Serbia"},
  {"Code": "SC", "Name": "Seychelles"},
  {"Code": "SL", "Name": "Sierra Leone"},
  {"Code": "SG", "Name": "Singapore"},
  {"Code": "SX", "Name": "Sint Maarten (Dutch part)"},
  {"Code": "SK", "Name": "Slovakia"},
  {"Code": "SI", "Name": "Slovenia"},
  {"Code": "SB", "Name": "Solomon Islands"},
  {"Code": "SO", "Name": "Somalia"},
  {"Code": "ZA", "Name": "South Africa"},
  {"Code": "GS", "Name": "South Georgia and the South Sandwich Islands"},
  {"Code": "SS", "Name": "South Sudan"},
  {"Code": "ES", "Name": "Spain"},
  {"Code": "LK", "Name": "Sri Lanka"},
  {"Code": "SD", "Name": "Sudan"},
  {"Code": "SR", "Name": "Suriname"},
  {"Code": "SJ", "Name": "Svalbard and Jan Mayen"},
  {"Code": "SZ", "Name": "Swaziland"},
  {"Code": "SE", "Name": "Sweden"},
  {"Code": "CH", "Name": "Switzerland"},
  {"Code": "SY", "Name": "Syrian Arab Republic"},
  {"Code": "TW", "Name": "Taiwan, Province of China"},
  {"Code": "TJ", "Name": "Tajikistan"},
  {"Code": "TZ", "Name": "Tanzania, United Republic of"},
  {"Code": "TH", "Name": "Thailand"},
  {"Code": "TL", "Name": "Timor-Leste"},
  {"Code": "TG", "Name": "Togo"},
  {"Code": "TK", "Name": "Tokelau"},
  {"Code": "TO", "Name": "Tonga"},
  {"Code": "TT", "Name": "Trinidad and Tobago"},
  {"Code": "TN", "Name": "Tunisia"},
  {"Code": "TR", "Name": "Turkey"},
  {"Code": "TM", "Name": "Turkmenistan"},
  {"Code": "TC", "Name": "Turks and Caicos Islands"},
  {"Code": "TV", "Name": "Tuvalu"},
  {"Code": "UG", "Name": "Uganda"},
  {"Code": "UA", "Name": "Ukraine"},
  {"Code": "AE", "Name": "United Arab Emirates"},
  {"Code": "GB", "Name": "United Kingdom"},
  {"Code": "US", "Name": "United States"},
  {"Code": "UM", "Name": "United States Minor Outlying Islands"},
  {"Code": "UY", "Name": "Uruguay"},
  {"Code": "UZ", "Name": "Uzbekistan"},
  {"Code": "VU", "Name": "Vanuatu"},
  {"Code": "VE", "Name": "Venezuela, Bolivarian Republic of"},
  {"Code": "VN", "Name": "Viet Nam"},
  {"Code": "VG", "Name": "Virgin Islands, British"},
  {"Code": "VI", "Name": "Virgin Islands, U.S."},
  {"Code": "WF", "Name": "Wallis and Futuna"},
  {"Code": "EH", "Name": "Western Sahara"},
  {"Code": "YE", "Name": "Yemen"},
  {"Code": "ZM", "Name": "Zambia"},
  {"Code": "ZW", "Name": "Zimbabwe"}
];
