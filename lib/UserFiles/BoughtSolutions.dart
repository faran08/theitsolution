// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:intl/intl.dart';
import '../MainPage/MainPage.dart';
import '../globals.dart';
import 'UserCombinedFunctions.dart';
import 'UserStateController.dart';

class BoughtSolutions extends StatelessWidget {
  BoughtSolutions({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController controllerOne = ScrollController();
  UserStateController userStateController = Get.put(UserStateController());
  late QuerySnapshot<Object?> allSubscribedPlans;
  bool plansLoaded = false;
  CollectionReference subscribedPlans =
      FirebaseFirestore.instance.collection('subscribedPlans');
  CollectionReference services =
      FirebaseFirestore.instance.collection('Services');
  Widget detailWidget = Center(
    child: AutoSizeText(
      'Select to see details',
      style: TextStyle(
          fontSize: 30, color: textColor, fontWeight: FontWeight.bold),
    ),
  );

  void getSubscribedPlans() {
    subscribedPlans
        .where('email', isEqualTo: auth.currentUser!.email)
        .get()
        .then((value) {
      allSubscribedPlans = value;
      plansLoaded = true;
      userStateController.update();
    });
  }

  Future<Widget> updateData(String documentID) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Loading Data',
    );
    var value = await services.doc(documentID).get();
    EasyLoading.dismiss();
    return Column(
      children: [
        AutoSizeText(
          value['nameOfService'],
          style: TextStyle(
              fontSize: 30, color: textColor, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: AutoSizeText(
            value['serviceDetails'],
            style: TextStyle(fontSize: 20, color: textColor),
          ),
        ),
        Container(
          height: Get.height * 0.4,
          width: Get.width * 0.6,
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          decoration: BoxDecoration(
            color: buttonColorTwo,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: GetBuilder<UserStateController>(builder: (_) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                children: [
                  AutoSizeText(
                    'Details',
                    style: TextStyle(
                        fontSize: 30,
                        color: textColorInsideTextBox,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: AutoSizeText(
                      '<More Details can be added as per desire>',
                      style: TextStyle(
                          fontSize: 20, color: textColorInsideTextBox),
                    ),
                  )
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    getSubscribedPlans();
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
    return GetBuilder<UserStateController>(builder: (_) {
      return plansLoaded
          ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.9,
                    width: Get.width * 0.2,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(
                      color: colorOne,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: AutoSizeText(
                            'Subscribed Plans',
                            minFontSize: 20,
                            style: GoogleFonts.montserrat(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                            child: Scrollbar(
                                thumbVisibility: true,
                                trackVisibility: true,
                                controller: controllerOne,
                                child: ListView.builder(
                                    controller: controllerOne,
                                    itemCount: allSubscribedPlans.docs.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {
                                          updateData(allSubscribedPlans
                                                  .docs[index]['planID'])
                                              .then((value) {
                                            detailWidget = value!;
                                            userStateController.update();
                                          });
                                        },
                                        style: ListTileStyle.list,
                                        title: AutoSizeText(
                                          allSubscribedPlans.docs[index]
                                              ['planName'],
                                          minFontSize: 20,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          'Subscribed On ${DateFormat('dd MMM yyyy').format((allSubscribedPlans.docs[index]['subscribedOn'] as Timestamp).toDate())}',
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      );
                                    }))))
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.9,
                    width: Get.width * 0.75,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.asset('DSL.jpg').image,
                          fit: BoxFit.cover,
                          opacity: 0.5),
                      // color: colorOne,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GetBuilder<UserStateController>(builder: (_) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: detailWidget,
                      );
                    }),
                  )
                ],
              ),
            )
          : SpinKitChasingDots(
              color: textColor,
              size: 50.0,
            );
    });
  }

  Widget getMobileLayout() {
    return GetBuilder<UserStateController>(builder: (_) {
      return plansLoaded
          ? SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: AutoSizeText(
                        'Subscribed Plans',
                        minFontSize: 20,
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.9,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      decoration: BoxDecoration(
                        color: colorOne,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Scrollbar(
                          thumbVisibility: true,
                          trackVisibility: true,
                          controller: controllerOne,
                          child: ListView.builder(
                              controller: controllerOne,
                              itemCount: allSubscribedPlans.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: (() {
                                    updateData(allSubscribedPlans.docs[index]
                                            ['planID'])
                                        .then((value) {
                                      detailWidget = value!;
                                      userStateController.update();
                                    });
                                  }),
                                  child: Container(
                                    width: Get.width * 0.2,
                                    margin: EdgeInsets.fromLTRB(10, 10, 5, 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: textColor)),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            allSubscribedPlans.docs[index]
                                                ['planName'],
                                            textAlign: TextAlign.center,
                                            minFontSize: 10,
                                            style: GoogleFonts.montserrat(
                                                color: textColorInsideTextBox,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          AutoSizeText(
                                            DateFormat('dd MMM yyyy').format(
                                                (allSubscribedPlans.docs[index]
                                                            ['subscribedOn']
                                                        as Timestamp)
                                                    .toDate()),
                                            textAlign: TextAlign.center,
                                            minFontSize: 10,
                                            style: GoogleFonts.montserrat(
                                                color: textColorInsideTextBox,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))),
                    ),
                    Container(
                      height: Get.height * 0.95,
                      width: Get.width * 0.75,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset('DSL.jpg').image,
                            fit: BoxFit.cover,
                            opacity: 0.5),
                        // color: colorOne,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GetBuilder<UserStateController>(builder: (_) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: detailWidget,
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
          : SpinKitChasingDots(
              color: textColor,
              size: 50.0,
            );
    });
  }
}
