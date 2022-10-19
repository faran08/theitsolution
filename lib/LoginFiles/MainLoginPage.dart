// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/UserFiles/UserHomePage.dart';
import 'package:theitsolution/globals.dart';

class MainLoginPage extends StatelessWidget {
  MainLoginPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
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
          'futurenet.png',
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
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
                                    if (value!.length < 3) {
                                      return 'Enter correct username';
                                    } else {
                                      return null;
                                    }
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: userName,
                                  readOnly: false,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: textColorInsideTextBox,
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      hintText: 'Username',
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
                                      errorStyle:
                                          TextStyle(color: Colors.white),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                      BorderRadius.circular(
                                                          10)),
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
                                                      BorderRadius.circular(
                                                          10)),
                                              shadowColor: Colors.grey.shade500,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 20, 10, 20)),
                                          onPressed: () {
                                            Get.to(
                                              () => UserHomePage(),
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
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
