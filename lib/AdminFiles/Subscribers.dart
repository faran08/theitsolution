// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/AdminFiles/AdminCombinedFunctions.dart';
import 'package:theitsolution/AdminFiles/AdminStateController.dart';
import 'package:theitsolution/UserFiles/UserCombinedFunctions.dart';
import '../MainPage/MainPage.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../globals.dart';
import 'package:intl/intl.dart';

class Subscribers extends StatelessWidget {
  Subscribers({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AdminStateController adminStateController = Get.put(AdminStateController());
  final ScrollController controllerOne = ScrollController();
  final ScrollController controllerTwo = ScrollController();
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  void _handleSendPressed(types.PartialText message) {}
  String SubscribersText = '';
  CollectionReference subscribedPlans =
      FirebaseFirestore.instance.collection('subscribedPlans');
  late QuerySnapshot<Object?> allSubscribers;
  bool dataLoaded = false;
  List<Map> activeSubscribers = [];
  List<Map> inactiveSubscribers = [];

  void getSubscribedUsers() {
    subscribedPlans.get().then((value) {
      allSubscribers = value;
      activeSubscribers.clear();
      inactiveSubscribers.clear();
      for (var element in allSubscribers.docs) {
        if (element['active'] == true) {
          activeSubscribers.add((element.data() as Map));
        } else {
          inactiveSubscribers.add((element.data() as Map));
        }
      }
      dataLoaded = true;
      adminStateController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    getSubscribedUsers();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: bannerColorOne,
        endDrawer: getDrawerForAdmin(context),
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
        }));
  }

  Widget getDesktopLayout() {
    return GetBuilder<AdminStateController>(builder: (_) {
      return dataLoaded
          ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.9,
                    width: Get.width * 0.8,
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: AutoSizeText(
                            'Active Subscribers',
                            minFontSize: 30,
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
                                    itemCount: activeSubscribers.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        style: ListTileStyle.list,
                                        trailing: AutoSizeText(
                                          DateFormat('dd MMM yyyy').format(
                                              (activeSubscribers[index]
                                                          ['subscribedOn']
                                                      as Timestamp)
                                                  .toDate()),
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: AutoSizeText(
                                          activeSubscribers[index]['email'],
                                          minFontSize: 20,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          activeSubscribers[index]['planName'],
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      );
                                    })))),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: AutoSizeText(
                            'UnSub Users',
                            minFontSize: 30,
                            style: GoogleFonts.montserrat(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                            child: Scrollbar(
                                thumbVisibility: true,
                                trackVisibility: true,
                                controller: controllerTwo,
                                child: ListView.builder(
                                    controller: controllerTwo,
                                    itemCount: inactiveSubscribers.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        style: ListTileStyle.list,
                                        trailing: AutoSizeText(
                                          DateFormat('dd MMM yyyy').format(
                                              (inactiveSubscribers[index]
                                                          ['subscribedOn']
                                                      as Timestamp)
                                                  .toDate()),
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: AutoSizeText(
                                          inactiveSubscribers[index]['email'],
                                          minFontSize: 20,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          inactiveSubscribers[index]
                                              ['planName'],
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      );
                                    }))))
                      ],
                    ),
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
    return GetBuilder<AdminStateController>(builder: (_) {
      return dataLoaded
          ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * 0.9,
                    width: Get.width * 0.8,
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: AutoSizeText(
                            'Active Subscribers',
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
                                    itemCount: activeSubscribers.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        style: ListTileStyle.list,
                                        title: AutoSizeText(
                                          activeSubscribers[index]['email'],
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          activeSubscribers[index]['planName'],
                                          minFontSize: 10,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      );
                                    })))),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: AutoSizeText(
                            'UnSub Users',
                            minFontSize: 20,
                            style: GoogleFonts.montserrat(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Flexible(
                            child: Scrollbar(
                                thumbVisibility: true,
                                trackVisibility: true,
                                controller: controllerTwo,
                                child: ListView.builder(
                                    controller: controllerTwo,
                                    itemCount: inactiveSubscribers.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {},
                                        style: ListTileStyle.list,
                                        title: AutoSizeText(
                                          inactiveSubscribers[index]['email'],
                                          minFontSize: 12,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          inactiveSubscribers[index]
                                              ['planName'],
                                          minFontSize: 10,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      );
                                    }))))
                      ],
                    ),
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
}
