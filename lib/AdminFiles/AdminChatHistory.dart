// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/AdminFiles/AdminCombinedFunctions.dart';
import 'package:theitsolution/AdminFiles/AdminStateController.dart';
import 'package:theitsolution/UserFiles/UserCombinedFunctions.dart';
import 'package:theitsolution/UserFiles/UserStateController.dart';
import '../MainPage/MainPage.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../globals.dart';
import 'package:intl/intl.dart';

class AdminChatHistory extends StatelessWidget {
  AdminChatHistory({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AdminStateController adminStateController = Get.put(AdminStateController());
  final ScrollController controllerOne = ScrollController();
  final List<types.Message> _messages = [];
  CollectionReference chatHistory =
      FirebaseFirestore.instance.collection('ChatsHistory');
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');
  void _handleSendPressed(types.PartialText message) {}
  String AdminChatHistoryText = '';
  bool chatHistoryLoaded = false;
  List<ChatMessage> chatToShow = [];
  late QuerySnapshot<Object?> allChats;
  void getChat() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Loading Chats',
    );
    chatHistory
        .where('admin', isEqualTo: auth.currentUser!.email)
        .orderBy('finishDate', descending: true)
        .get()
        .then((value) {
      EasyLoading.dismiss();
      chatHistoryLoaded = true;
      allChats = value;
      adminStateController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    getChat();
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
      }),
    );
  }

  Widget getDesktopLayout() {
    return GetBuilder<AdminStateController>(builder: (_) {
      return chatHistoryLoaded
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: AutoSizeText(
                            'Chat History',
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
                                    itemCount: allChats.docs.length,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                        onTap: () {
                                          chatToShow.clear();
                                          for (var element in allChats
                                              .docs[index]['chatCopy']) {
                                            chatToShow.add(ChatMessage(
                                                text: element['message'],
                                                user: ChatUser(
                                                    id: element['author']),
                                                createdAt: (element['createdAt']
                                                        as Timestamp)
                                                    .toDate()));
                                          }

                                          // AdminChatHistoryText = index.toString();
                                          adminStateController.update();
                                        },
                                        style: ListTileStyle.list,
                                        title: AutoSizeText(
                                          allChats.docs[index]['user'],
                                          minFontSize: 20,
                                          style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: AutoSizeText(
                                          '${(allChats.docs[index]['finishDate'] as Timestamp).toDate()}',
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
                      color: colorOne,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GetBuilder<AdminStateController>(builder: (_) {
                      return Center(
                        child: DashChat(
                            inputOptions: InputOptions(
                                alwaysShowSend: false,
                                sendOnEnter: false,
                                inputDisabled: true),
                            currentUser: ChatUser(id: auth.currentUser!.email!),
                            onSend: (m) {},
                            messages: chatToShow),
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
    return GetBuilder<AdminStateController>(builder: (_) {
      return SingleChildScrollView(
        child: chatHistoryLoaded
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: AutoSizeText(
                        'Chat History',
                        minFontSize: 12,
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.15,
                      width: Get.width * 0.9,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      decoration: BoxDecoration(
                        color: colorOne,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Scrollbar(
                          controller: controllerOne,
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: ListView.builder(
                              controller: controllerOne,
                              scrollDirection: Axis.horizontal,
                              itemCount: allChats.docs.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: (() {
                                    chatToShow.clear();
                                    for (var element in allChats.docs[index]
                                        ['chatCopy']) {
                                      chatToShow.add(ChatMessage(
                                          text: element['message'],
                                          user: ChatUser(id: element['author']),
                                          createdAt: (element['createdAt']
                                                  as Timestamp)
                                              .toDate()));
                                    }

                                    // AdminChatHistoryText = index.toString();
                                    adminStateController.update();
                                  }),
                                  child: Container(
                                    width: Get.width * 0.4,
                                    margin: EdgeInsets.fromLTRB(10, 10, 5, 20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: textColor)),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AutoSizeText(
                                            allChats.docs[index]['user'],
                                            textAlign: TextAlign.center,
                                            minFontSize: 10,
                                            style: GoogleFonts.montserrat(
                                                color: textColorInsideTextBox,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: AutoSizeText(
                                              DateFormat('hh:mm a; dd MMM yyyy')
                                                  .format((allChats.docs[index]
                                                              ['finishDate']
                                                          as Timestamp)
                                                      .toDate()),
                                              textAlign: TextAlign.center,
                                              minFontSize: 8,
                                              style: GoogleFonts.montserrat(
                                                  color: textColorInsideTextBox,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))),
                    ),
                    Container(
                      height: Get.height * 0.6,
                      width: Get.width * 0.95,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 20),
                      decoration: BoxDecoration(
                        color: colorOne,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GetBuilder<AdminStateController>(builder: (_) {
                        return Center(
                          child: DashChat(
                              inputOptions: InputOptions(
                                  alwaysShowSend: false,
                                  sendOnEnter: false,
                                  inputDisabled: true),
                              currentUser:
                                  ChatUser(id: auth.currentUser!.email!),
                              onSend: (m) {},
                              messages: chatToShow),
                        );
                      }),
                    )
                  ],
                ),
              )
            : SpinKitChasingDots(
                color: textColor,
                size: 50.0,
              ),
      );
    });
  }
}
