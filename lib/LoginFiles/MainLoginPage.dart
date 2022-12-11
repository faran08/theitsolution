// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/AdminFiles/AdminHomePage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/UserFiles/UserHomePage.dart';
import 'package:theitsolution/globals.dart';

class MainLoginPage extends StatelessWidget {
  MainLoginPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  var myGroup = AutoSizeGroup();
  bool _validateForm() {
    FormState form = formKey.currentState!;
    if (form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bannerColorOne,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.1,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/futurenet.png',
          width: 80,
        ),
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.height * 0.6,
                width: Get.width * 0.4,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                  color: colorOne,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        'LOGIN',
                        minFontSize: 30,
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (!EmailValidator.validate(value!)) {
                                    return 'Enter correct username';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: email,
                                readOnly: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: textColorInsideTextBox,
                                    ),
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return 'Enter correct password';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: passWord,
                                readOnly: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: textColorInsideTextBox,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Center(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: buttonColorTwo,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            shadowColor: Colors.grey.shade500,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20)),
                                        onPressed: () {
                                          Get.to(
                                            () => SignUpPage(),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Icon(
                                                Icons.add_box_rounded,
                                                color: textColorInsideTextBox,
                                                size: 25,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: AutoSizeText(
                                                'Sign Up',
                                                minFontSize: 15,
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        textColorInsideTextBox,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: Center(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: buttonColor,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            shadowColor: Colors.grey.shade500,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20)),
                                        onPressed: () {
                                          signInImplementation();
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Icon(
                                                Icons.login,
                                                color: textColor,
                                                size: 25,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 0, 20, 0),
                                              child: AutoSizeText(
                                                'Log In',
                                                minFontSize: 20,
                                                style: GoogleFonts.poppins(
                                                    color: textColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                            //   child: Center(
                            //     child: TextButton(
                            //         style: TextButton.styleFrom(
                            //             backgroundColor: Colors.blueGrey,
                            //             elevation: 2,
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(10)),
                            //             shadowColor: Colors.grey.shade500,
                            //             padding: EdgeInsets.fromLTRB(
                            //                 10, 20, 10, 20)),
                            //         onPressed: () {
                            //           signInImplementationForAdmin();
                            //         },
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: [
                            //             Padding(
                            //               padding:
                            //                   EdgeInsets.fromLTRB(10, 0, 0, 0),
                            //               child: Icon(
                            //                 Icons.admin_panel_settings_rounded,
                            //                 color: textColor,
                            //                 size: 25,
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding:
                            //                   EdgeInsets.fromLTRB(20, 0, 20, 0),
                            //               child: AutoSizeText(
                            //                 'Admin',
                            //                 minFontSize: 20,
                            //                 style: GoogleFonts.poppins(
                            //                     color: textColor,
                            //                     fontWeight: FontWeight.w600),
                            //               ),
                            //             )
                            //           ],
                            //         )),
                            //   ),
                            // )
                          ],
                        ))
                  ],
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: Get.height * 0.8,
                width: Get.width * 0.95,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                  color: colorOne,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        'LOGIN',
                        minFontSize: 30,
                        style: GoogleFonts.montserrat(
                            color: textColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (!EmailValidator.validate(value!)) {
                                    return 'Enter correct email';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: email,
                                readOnly: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: textColorInsideTextBox,
                                    ),
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return 'Enter correct password';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: passWord,
                                readOnly: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: textColorInsideTextBox,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  child: Center(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: buttonColorTwo,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            shadowColor: Colors.grey.shade500,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20)),
                                        onPressed: () {
                                          Get.to(
                                            () => SignUpPage(),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Icon(
                                                Icons.add_box_rounded,
                                                color: textColorInsideTextBox,
                                                size: 25,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 20, 0),
                                              child: AutoSizeText(
                                                'Sign Up',
                                                minFontSize: 15,
                                                style: GoogleFonts.poppins(
                                                    color:
                                                        textColorInsideTextBox,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: Center(
                                    child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: buttonColor,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            shadowColor: Colors.grey.shade500,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20)),
                                        onPressed: () {
                                          signInImplementation();
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Icon(
                                                Icons.login,
                                                color: textColor,
                                                size: 25,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 20, 0),
                                              child: AutoSizeText(
                                                'Log In',
                                                minFontSize: 20,
                                                style: GoogleFonts.poppins(
                                                    color: textColor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                    //   child: Center(
                    //     child: TextButton(
                    //         style: TextButton.styleFrom(
                    //             backgroundColor: Colors.blueGrey,
                    //             elevation: 2,
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10)),
                    //             shadowColor: Colors.grey.shade500,
                    //             padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                    //         onPressed: () {
                    //           signInImplementationForAdmin();
                    //         },
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Padding(
                    //               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    //               child: Icon(
                    //                 Icons.admin_panel_settings_rounded,
                    //                 color: textColor,
                    //                 size: 25,
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    //               child: AutoSizeText(
                    //                 'Admin',
                    //                 minFontSize: 20,
                    //                 style: GoogleFonts.poppins(
                    //                     color: textColor,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         )),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signInImplementationForAdmin() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Loading',
    );
    users
        .where('email', isEqualTo: email.text)
        .where('password', isEqualTo: passWord.text)
        .where('role', isEqualTo: 'admin')
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        EasyLoading.dismiss();
        globalUserName = value.docs.first['userName'];
        globalEmailAddress = value.docs.first['email'];
        Get.to(
          () => AdminHomePage(),
        );
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: 'Error in username/ password.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: colorOne,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: colorOne,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void signInImplementation() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Loading',
    );
    auth
        .signInWithEmailAndPassword(email: email.text, password: passWord.text)
        .then((value) {})
        .onError((error, stackTrace) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: 'Error in username/ password.$error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: colorOne,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    // users
    //     .where('email', isEqualTo: email.text)
    //     .where('password', isEqualTo: passWord.text)
    //     .where('role', isEqualTo: 'user')
    //     .limit(1)
    //     .get()
    //     .then((value) {
    //   if (value.docs.isNotEmpty) {
    //     EasyLoading.dismiss();
    //     globalUserName = value.docs.first['userName'];
    //     globalEmailAddress = value.docs.first['email'];
    //     Get.to(
    //       () => UserHomePage(),
    //     );
    //   } else {
    //     EasyLoading.dismiss();
    //     Fluttertoast.showToast(
    //         msg: 'Error in username/ password.',
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 2,
    //         backgroundColor: colorOne,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   }
    // }).onError((error, stackTrace) {
    //   EasyLoading.dismiss();
    //   Fluttertoast.showToast(
    //       msg: error.toString(),
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM,
    //       timeInSecForIosWeb: 2,
    //       backgroundColor: colorOne,
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // });
  }
}
