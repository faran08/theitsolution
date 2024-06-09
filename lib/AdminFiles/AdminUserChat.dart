// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:theitsolution/AdminFiles/AdminCombinedFunctions.dart';
import 'package:theitsolution/AdminFiles/AdminStateController.dart';
import 'package:theitsolution/UserFiles/UserCombinedFunctions.dart';
import '../MainPage/MainPage.dart';
import '../globals.dart';

class AdminUserChat extends StatelessWidget {
  AdminUserChat({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'admin');
  AdminStateController adminStateController = Get.put(AdminStateController());
  late Stream<QuerySnapshot> senderChatStream;
  late Stream<QuerySnapshot> receiverChatStream;
  CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('Chats');
  CollectionReference chatHistory =
      FirebaseFirestore.instance.collection('ChatsHistory');
  CollectionReference awaitedUser =
      FirebaseFirestore.instance.collection('ChatsUserList');
  late QuerySnapshot<Object?> availableUsers;
  bool usersLoaded = false;
  bool chatyLoaded = false;
  late ChatUser connectedUser = ChatUser(id: 'nil');
  // late QuerySnapshot<Object?> senderMessages;
  // late QuerySnapshot<Object?> receiverMessages;
  List<Map> allMessages = [];
  List<Map> senderMessages = [];
  List<Map> receiverMessages = [];

  ///Dash Chat 2.0 Variables///

  List<ChatMessage> messages = <ChatMessage>[];

  void getAvailableUsers() {
    awaitedUser
        .where('status', isEqualTo: false)
        .where('connectedWith', isEqualTo: '')
        .where('chatRequestDateTime',
            isGreaterThan: DateTime.now().subtract(Duration(hours: 1)))
        .orderBy('chatRequestDateTime', descending: true)
        .get()
        .then((value) {
      availableUsers = value;

      usersLoaded = true;
      adminStateController.update();
      // getSenderReceiverChats();
    });
  }

  void getSenderReceiverChats() {
    senderChatStream = chatCollection
        .where('author', isEqualTo: auth.currentUser!.email)
        .where('receiver', isEqualTo: connectedUser.id)
        .snapshots();
    receiverChatStream = chatCollection
        .where('author', isEqualTo: connectedUser.id)
        .where('receiver', isEqualTo: auth.currentUser!.email)
        .snapshots();

    senderChatStream.forEach((element) {
      senderMessages.clear();
      for (var item in element.docs) {
        Map temp = item.data() as Map;
        temp['author'] = auth.currentUser!.email;
        senderMessages.add(temp);
      }
      compileChatStreams();
    });
    receiverChatStream.forEach((element) {
      receiverMessages.clear();
      for (var item in element.docs) {
        Map temp = item.data() as Map;
        temp['author'] = connectedUser.id;
        receiverMessages.add(temp);
      }
      compileChatStreams();
    });
  }

  List<Map<dynamic, dynamic>> getLatestChat(
      List<Map<dynamic, dynamic>> allMessages) {
    List<Map<dynamic, dynamic>> returnMessages = [];
    for (var element in allMessages) {
      if ((element['createdAt'] as Timestamp)
              .toDate()
              .difference(DateTime.now())
              .inMinutes <
          60) {
        returnMessages.add(element);
      }
    }
    return returnMessages;
  }

  void compileChatStreams() {
    allMessages.clear();
    messages.clear();
    // List<types.Message> _messagesList = [];

    allMessages = senderMessages + receiverMessages;
    // allMessages.sort(((a, b) => (a['createdAt'] as Timestamp)
    //     .toDate()
    //     .isBefore((b['createdAt'] as Timestamp).toDate())));
    allMessages.sort(((a, b) {
      return (b['createdAt'] as Timestamp)
          .toDate()
          .compareTo((a['createdAt'] as Timestamp).toDate());
    }));

    for (var element in allMessages) {
      messages.add(ChatMessage(
        text: element['message'],
        user: ChatUser(
          id: element['author'],
          firstName: element['author'],
        ),
        createdAt: (element['createdAt'] as Timestamp).toDate(),
      ));

      // _messages.add(types.TextMessage(
      //   author: types.User(id: element['author']),
      //   createdAt: (element['createdAt'] as Timestamp).millisecondsSinceEpoch,
      //   id: element['author'],
      //   text: element['message'],
      // ));
    }
    chatyLoaded = true;

    adminStateController.update();
  }

  void load() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Waiting For Agent To Connect',
    );
  }

  void _addMessage(types.Message message) {
    // _messages.insert(0, message);
  }

  void _handleSendPressed(ChatMessage message) {
    // final textMessage = types.TextMessage(
    //   author: _user,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: 'admin',
    //   text: message.text,
    // );

    // _addMessage(textMessage);
    chatCollection.add({
      'author': auth.currentUser!.email,
      'receiver': connectedUser.id,
      'createdAt': DateTime.now(),
      'message': message.text
    });
    adminStateController.update();
    awaitedUser.doc(availableUsers.docs.first.id).update({'isConnected': true});
  }

  @override
  Widget build(BuildContext context) {
    getAvailableUsers();
    messages.add(
      ChatMessage(
        text: 'Welcome, Please connect to users to start helping!',
        user: ChatUser(
          id: auth.currentUser!.email!,
          firstName: auth.currentUser!.email,
        ),
        createdAt: DateTime.now(),
      ),
    );
    return GetBuilder<AdminStateController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
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
    });
  }

  Widget getDesktopLayout() {
    return Stack(
      children: [
        DashChat(
          inputOptions: InputOptions(
              sendOnEnter: true,
              inputDecoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.chat,
                    color: textColorInsideTextBox,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  hintText: 'Write a message ...',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)))),
          currentUser: ChatUser(
            id: auth.currentUser!.email!,
            firstName: auth.currentUser!.email,
          ),
          onSend: (ChatMessage m) {
            // messages.insert(0, m);
            _handleSendPressed(m);
            adminStateController.update();
          },
          messages: messages,
        ),
        SizedBox(
            height: Get.height * 0.2,
            child: Row(
              children: [
                usersLoaded
                    ? Flexible(
                        child: ListView.builder(
                            itemCount: availableUsers.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Stack(
                                fit: StackFit.passthrough,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width: Get.width * 0.1,
                                    height: Get.height * 0.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 0
                                          ? Colors.green.shade300
                                          : Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AutoSizeText(
                                            availableUsers.docs[index]
                                                ['userName'],
                                            textAlign: TextAlign.center,
                                            minFontSize: 10,
                                            style: GoogleFonts.poppins(
                                              color: textColorInsideTextBox,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Waiting Since\n${DateTime.now().difference((availableUsers.docs[index]['chatRequestDateTime'] as Timestamp).toDate()).inMinutes} Minutes',
                                            textAlign: TextAlign.center,
                                            minFontSize: 5,
                                            style: GoogleFonts.poppins(
                                              color: textColorInsideTextBox,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          availableUsers.docs[index]['email'] !=
                                                  connectedUser.id
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 5),
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              buttonColorTwo,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          shadowColor: Colors
                                                              .grey.shade500,
                                                          padding: EdgeInsets
                                                              .fromLTRB(5, 10,
                                                                  5, 10)),
                                                      onPressed: () {
                                                        EasyLoading.show(
                                                          maskType:
                                                              EasyLoadingMaskType
                                                                  .clear,
                                                          status: 'Connecting',
                                                        );
                                                        awaitedUser
                                                            .doc(availableUsers
                                                                .docs[index].id)
                                                            .update({
                                                          'connectedAt':
                                                              DateTime.now(),
                                                          'connectedWith': auth
                                                              .currentUser!
                                                              .email
                                                        }).then((value) {
                                                          EasyLoading.dismiss();
                                                          connectedUser =
                                                              ChatUser(
                                                            id: availableUsers
                                                                    .docs[index]
                                                                ['email'],
                                                            firstName:
                                                                availableUsers
                                                                            .docs[
                                                                        index]
                                                                    ['email'],
                                                          );
                                                          getSenderReceiverChats();
                                                          // adminStateController.update();
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 0),
                                                            child: AutoSizeText(
                                                              'Connect',
                                                              minFontSize: 10,
                                                              style: GoogleFonts.poppins(
                                                                  color:
                                                                      textColorInsideTextBox,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 5),
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              buttonColorTwo,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          shadowColor: Colors
                                                              .grey.shade500,
                                                          padding: EdgeInsets
                                                              .fromLTRB(5, 10,
                                                                  5, 10)),
                                                      onPressed: () {
                                                        EasyLoading.show(
                                                          maskType:
                                                              EasyLoadingMaskType
                                                                  .clear,
                                                          status: 'Saving Chat',
                                                        );
                                                        chatHistory.add({
                                                          'admin': auth
                                                              .currentUser!
                                                              .email!,
                                                          'user':
                                                              connectedUser.id,
                                                          'finishDate':
                                                              DateTime.now(),
                                                          'chatCopy':
                                                              getLatestChat(
                                                                  allMessages)
                                                        }).then((value) {
                                                          EasyLoading.show(
                                                            maskType:
                                                                EasyLoadingMaskType
                                                                    .clear,
                                                            status:
                                                                'Updating Chat Status',
                                                          );
                                                          awaitedUser
                                                              .doc(
                                                                  availableUsers
                                                                      .docs[
                                                                          index]
                                                                      .id)
                                                              .update({
                                                            'status': true
                                                          }).then((value) {
                                                            EasyLoading
                                                                .dismiss();
                                                            messages.clear();
                                                            connectedUser =
                                                                ChatUser(
                                                                    id: 'nil');
                                                            getAvailableUsers();
                                                          });
                                                        }).onError((error,
                                                            stackTrace) {
                                                          EasyLoading.dismiss();
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 0),
                                                            child: AutoSizeText(
                                                              'Finish Chat',
                                                              minFontSize: 10,
                                                              style: GoogleFonts.poppins(
                                                                  color:
                                                                      textColorInsideTextBox,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  availableUsers.docs[index]['email'] ==
                                          connectedUser.id
                                      ? Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade300),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            })))
                    : Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text('Loading Users',
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
              ],
            )),
      ],
    );
  }

  Widget getMobileLayout() {
    return Stack(
      children: [
        DashChat(
          inputOptions: InputOptions(
              sendOnEnter: true,
              inputDecoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.chat,
                    color: textColorInsideTextBox,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  hintText: 'Write a message ...',
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)))),
          currentUser: ChatUser(
            id: auth.currentUser!.email!,
            firstName: auth.currentUser!.email,
          ),
          onSend: (ChatMessage m) {
            // messages.insert(0, m);
            _handleSendPressed(m);
            adminStateController.update();
          },
          messages: messages,
        ),
        SizedBox(
            height: Get.height * 0.2,
            child: Row(
              children: [
                usersLoaded
                    ? Flexible(
                        child: ListView.builder(
                            itemCount: availableUsers.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              return Stack(
                                fit: StackFit.passthrough,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    width: Get.width * 0.4,
                                    height: Get.height * 0.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 0
                                          ? Colors.green.shade300
                                          : Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AutoSizeText(
                                            availableUsers.docs[index]
                                                ['userName'],
                                            textAlign: TextAlign.center,
                                            minFontSize: 10,
                                            style: GoogleFonts.poppins(
                                              color: textColorInsideTextBox,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'Waiting Since\n${DateTime.now().difference((availableUsers.docs[index]['chatRequestDateTime'] as Timestamp).toDate()).inMinutes} Minutes',
                                            textAlign: TextAlign.center,
                                            minFontSize: 5,
                                            style: GoogleFonts.poppins(
                                              color: textColorInsideTextBox,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          availableUsers.docs[index]['email'] !=
                                                  connectedUser.id
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 5),
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              buttonColorTwo,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          shadowColor: Colors
                                                              .grey.shade500,
                                                          padding: EdgeInsets
                                                              .fromLTRB(5, 10,
                                                                  5, 10)),
                                                      onPressed: () {
                                                        EasyLoading.show(
                                                          maskType:
                                                              EasyLoadingMaskType
                                                                  .clear,
                                                          status: 'Connecting',
                                                        );
                                                        awaitedUser
                                                            .doc(availableUsers
                                                                .docs[index].id)
                                                            .update({
                                                          'connectedAt':
                                                              DateTime.now(),
                                                          'connectedWith': auth
                                                              .currentUser!
                                                              .email
                                                        }).then((value) {
                                                          EasyLoading.dismiss();
                                                          connectedUser =
                                                              ChatUser(
                                                            id: availableUsers
                                                                    .docs[index]
                                                                ['email'],
                                                            firstName:
                                                                availableUsers
                                                                            .docs[
                                                                        index]
                                                                    ['email'],
                                                          );
                                                          getSenderReceiverChats();
                                                          // adminStateController.update();
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 0),
                                                            child: AutoSizeText(
                                                              'Connect',
                                                              minFontSize: 10,
                                                              style: GoogleFonts.poppins(
                                                                  color:
                                                                      textColorInsideTextBox,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 5),
                                                  child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              buttonColorTwo,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          shadowColor: Colors
                                                              .grey.shade500,
                                                          padding: EdgeInsets
                                                              .fromLTRB(5, 10,
                                                                  5, 10)),
                                                      onPressed: () {
                                                        EasyLoading.show(
                                                          maskType:
                                                              EasyLoadingMaskType
                                                                  .clear,
                                                          status: 'Saving Chat',
                                                        );
                                                        chatHistory.add({
                                                          'admin': auth
                                                              .currentUser!
                                                              .email!,
                                                          'user':
                                                              connectedUser.id,
                                                          'finishDate':
                                                              DateTime.now(),
                                                          'chatCopy':
                                                              getLatestChat(
                                                                  allMessages)
                                                        }).then((value) {
                                                          EasyLoading.show(
                                                            maskType:
                                                                EasyLoadingMaskType
                                                                    .clear,
                                                            status:
                                                                'Updating Chat Status',
                                                          );
                                                          awaitedUser
                                                              .doc(
                                                                  availableUsers
                                                                      .docs[
                                                                          index]
                                                                      .id)
                                                              .update({
                                                            'status': true
                                                          }).then((value) {
                                                            EasyLoading
                                                                .dismiss();
                                                            messages.clear();
                                                            connectedUser =
                                                                ChatUser(
                                                                    id: 'nil');
                                                            getAvailableUsers();
                                                          });
                                                        }).onError((error,
                                                            stackTrace) {
                                                          EasyLoading.dismiss();
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    20, 0),
                                                            child: AutoSizeText(
                                                              'Finish Chat',
                                                              minFontSize: 10,
                                                              style: GoogleFonts.poppins(
                                                                  color:
                                                                      textColorInsideTextBox,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  availableUsers.docs[index]['email'] ==
                                          connectedUser.id
                                      ? Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade300),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.green,
                                            size: 30,
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            })))
                    : Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text('Loading Users',
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontWeight: FontWeight.normal,
                            )),
                      ),
              ],
            )),
      ],
    );
  }
}
