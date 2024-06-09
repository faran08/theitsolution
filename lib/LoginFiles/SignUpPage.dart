// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:dropdown_selection/dropdown_selection.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theitsolution/LoginFiles/LoginFilesStateController.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/globals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController email = TextEditingController();
  LoginFilesStateController loginFilesStateController =
      Get.put(LoginFilesStateController());
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  DropdownEditingController<String> profession = DropdownEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late AuthCredential credential;
  String selectedCountry = 'Pakistan';
  TextEditingController country = TextEditingController();
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
          width: 100,
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return getDesktopLayout(context);
        } else {
          return getMobileLayout(context);
        }
      }),
    );
  }

  Widget getDesktopLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Center(
          child: Container(
            height: Get.height * 0.6,
            width: Get.width * 0.4,
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
                    'SIGN UP',
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
                                return 'More than 3 characters required';
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
                                errorStyle: TextStyle(color: Colors.white),
                                hintText: 'Full Name',
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
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                hintText: 'Email Address',
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
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: TextDropdownFormField(
                            controller: profession,
                            options: professions_list,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                labelText: 'Profession',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(
                                  Icons.work_rounded,
                                  color: textColorInsideTextBox,
                                ),
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
                                    borderRadius: BorderRadius.circular(10))),
                            dropdownHeight: 120,
                          ),
                        ),
                        GetBuilder<LoginFilesStateController>(builder: (_) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownFullScreen: false,
                                isDense: true,
                                itemPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                buttonPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                buttonDecoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                isExpanded: false,
                                hint: Text(
                                  'Select Country',
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: countryList2
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item['Name'],
                                          child: Text(
                                            item['Name'],
                                            style: const TextStyle(),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedCountry,
                                onChanged: (value) {
                                  selectedCountry = value as String;
                                  loginFilesStateController.update();
                                },
                                buttonHeight: 50,
                                buttonWidth:
                                    MediaQuery.of(context).size.width * 0.5,
                                // itemHeight: 50,
                                // dropdownMaxHeight:
                                //     MediaQuery.of(context).size.height * 0.8,
                                // dropdownWidth:
                                //     MediaQuery.of(context).size.width,
                                searchController: country,
                                searchInnerWidget: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    controller: country,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.flag_circle_outlined,
                                        color: textColorInsideTextBox,
                                      ),
                                      // isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      hintText: 'Search for your country',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return (item.value
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchValue.toLowerCase()));
                                },
                                //This to clear the search value when you close the menu
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    country.clear();
                                  }
                                },
                              ),
                            ),
                          );
                        }),
                      ],
                    )),
                Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColorTwo,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {
                        loginImplementation();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Process',
                              minFontSize: 15,
                              style: GoogleFonts.poppins(
                                  color: textColorInsideTextBox,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Center(
          child: Container(
            height: Get.height * 0.9,
            width: Get.width * 0.95,
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
                    'SIGN UP',
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
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'More than 3 characters required';
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
                                errorStyle: TextStyle(color: Colors.white),
                                hintText: 'Full name',
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
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                hintText: 'Email Address',
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
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextDropdownFormField(
                            controller: profession,
                            options: professions_list,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.white),
                                labelText: 'Profession',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Icon(
                                  Icons.work_rounded,
                                  color: textColorInsideTextBox,
                                ),
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
                                    borderRadius: BorderRadius.circular(10))),
                            dropdownHeight: 120,
                          ),
                        ),
                        GetBuilder<LoginFilesStateController>(builder: (_) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                dropdownFullScreen: false,
                                isDense: true,
                                itemPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                buttonPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                buttonDecoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                isExpanded: false,
                                hint: Text(
                                  'Select Country',
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: countryList2
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item['Name'],
                                          child: Text(
                                            item['Name'],
                                            style: const TextStyle(),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedCountry,
                                onChanged: (value) {
                                  selectedCountry = value as String;
                                  loginFilesStateController.update();
                                },
                                buttonHeight: 50,
                                buttonWidth: Get.width * 0.95,
                                // itemHeight: 50,
                                // dropdownMaxHeight:
                                //     MediaQuery.of(context).size.height * 0.8,
                                // dropdownWidth:
                                //     MediaQuery.of(context).size.width,
                                searchController: country,
                                searchInnerWidget: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    controller: country,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.flag_circle_outlined,
                                        color: textColorInsideTextBox,
                                      ),
                                      // isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      hintText: 'Search for your country',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return (item.value
                                      .toString()
                                      .toLowerCase()
                                      .contains(searchValue.toLowerCase()));
                                },
                                //This to clear the search value when you close the menu
                                onMenuStateChange: (isOpen) {
                                  if (!isOpen) {
                                    country.clear();
                                  }
                                },
                              ),
                            ),
                          );
                        }),
                      ],
                    )),
                Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: buttonColorTwo,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.grey.shade500,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                      onPressed: () {
                        loginImplementation();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: AutoSizeText(
                              'Process',
                              minFontSize: 15,
                              style: GoogleFonts.poppins(
                                  color: textColorInsideTextBox,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginImplementation() async {
    print(userName.text);
    if (_validateForm() && profession.value! != '' && selectedCountry != '') {
      EasyLoading.show(
        maskType: EasyLoadingMaskType.clear,
        status: 'Loading',
      );
      auth
          .createUserWithEmailAndPassword(
              email: email.text, password: passWord.text)
          .then((value) {
        auth
            .signInWithEmailAndPassword(
                email: email.text, password: passWord.text)
            .then((value) {
          auth.currentUser!.updateDisplayName(userName.text);
          users.add({
            'userName': userName.text,
            'email': email.text,
            'password': passWord.text,
            'profession': profession.value,
            'country': selectedCountry,
            'role': 'user',
            'createdOn': DateTime.now()
          }).then((value) {
            EasyLoading.dismiss();
            Fluttertoast.showToast(
                msg: 'User registered. Signing in automatically.',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: colorOne,
                textColor: Colors.white,
                fontSize: 16.0);
            // Get.to(() => MainLoginPage());
          });
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
  }
}
