// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:theitsolution/UserFiles/UserCombinedFunctions.dart';
import 'package:theitsolution/UserFiles/UserStateController.dart';
import '../MainPage/MainPage.dart';
import '../globals.dart';

class ChatWithAgent extends StatelessWidget {
  ChatWithAgent({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<types.Message> _messages = [];
  final _user = types.User(id: auth.currentUser!.email!);
  bool agentAvailable = false;
  DateTime latestRequestDateTime = DateTime.now();
  UserStateController userStateController = Get.put(UserStateController());
  CollectionReference chatCollection =
      FirebaseFirestore.instance.collection('Chats');
  CollectionReference awaitedUser =
      FirebaseFirestore.instance.collection('ChatsUserList');
  late Stream<QuerySnapshot> senderChatStream;
  late Stream<QuerySnapshot> receiverChatStream;
  late Stream<QuerySnapshot> userConnectionStream;
  List<ChatMessage> messages = <ChatMessage>[];
  late QueryDocumentSnapshot<Object?> userDetails;
  late ChatUser connectedUser = ChatUser(id: 'nil');
  List<Map> allMessages = [];
  List<Map> senderMessages = [];
  List<Map> receiverMessages = [];

  void chatHelp() {
    awaitedUser
        .where('email', isEqualTo: auth.currentUser!.email)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isEmpty) {
        awaitedUser.add({
          'userName': auth.currentUser!.displayName,
          'email': auth.currentUser!.email,
          'chatRequestDateTime': DateTime.now(),
          'status': false,
          'connectedWith': '',
          'connectedAt': ''
        }).then((value) {
          latestRequestDateTime = DateTime.now();
          prepareUserChatStream();
        });
      } else {
        awaitedUser.doc(value.docs.first.id).update({
          'userName': auth.currentUser!.displayName,
          'email': auth.currentUser!.email,
          'chatRequestDateTime': DateTime.now(),
          'status': false,
          'connectedWith': '',
          'connectedAt': ''
        }).then((value) {
          latestRequestDateTime = DateTime.now();
          prepareUserChatStream();
        });
      }
    });
  }

  void prepareUserChatStream() {
    userConnectionStream = awaitedUser
        .where('email', isEqualTo: auth.currentUser!.email)
        .snapshots();
    userConnectionStream.forEach((element) {
      userDetails = element.docs.first;
      Map temp = userDetails.data() as Map;
      if (temp['status'] == true) {
        Get.off(1);
      }
      if (temp['connectedWith'] != '') {
        agentAvailable = true;
        connectedUser = ChatUser(
          id: temp['connectedWith'],
          firstName: temp['connectedWith'],
        );
        getSenderReceiverChats();
      }
    });
  }

  void getSenderReceiverChats() {
    senderChatStream = chatCollection
        .where('author', isEqualTo: auth.currentUser!.email)
        .where('createdAt', isGreaterThan: latestRequestDateTime)
        .where('receiver', isEqualTo: connectedUser.id)
        .snapshots();
    receiverChatStream = chatCollection
        .where('author', isEqualTo: connectedUser.id)
        .where('receiver', isEqualTo: auth.currentUser!.email)
        .where('createdAt', isGreaterThan: latestRequestDateTime)
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
    }
    userStateController.update();
  }

  void load() {
    // EasyLoading.show(
    //   maskType: EasyLoadingMaskType.clear,
    //   status: 'Waiting For Agent To Connect',
    // );
  }

  void _addMessage(types.Message message) {
    _messages.insert(0, message);
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
    userStateController.update();
  }

  @override
  Widget build(BuildContext context) {
    chatHelp();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bannerColorOne,
      endDrawer: getDrawer(context),
      appBar: AppBar(
        leadingWidth: Get.width * 0.3,
        leading: GetBuilder<UserStateController>(builder: (_) {
          return agentAvailable
              ? Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      JelloIn(
                          child: Icon(
                        Icons.done_outline_rounded,
                        size: 30,
                        color: textColorInsideTextBox,
                      )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Connected with\n${connectedUser.id}',
                          style: TextStyle(color: textColorInsideTextBox),
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    children: [
                      SpinKitChasingDots(
                        color: textColorInsideTextBox,
                        size: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Awaiting\nAgent',
                          style: TextStyle(color: textColorInsideTextBox),
                        ),
                      )
                    ],
                  ),
                );
        }),
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
      return DashChat(
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
          userStateController.update();
        },
        messages: messages,
      );
    });
  }

  Widget getMobileLayout() {
    return GetBuilder<UserStateController>(builder: (_) {
      return DashChat(
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
          userStateController.update();
        },
        messages: messages,
      );
    });
  }
}
