// ignore_for_file: prefer_const_constructors

// import 'dart:html' as html;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker_web/image_picker_web.dart';
import 'package:theitsolution/AdminFiles/AdminCombinedFunctions.dart';
import 'package:theitsolution/AdminFiles/AdminStateController.dart';
import '../globals.dart';

class AddEditService extends StatelessWidget {
  bool edit = false;
  String documentIDToEdit = '';
  AddEditService({Key? key, required this.edit, required this.documentIDToEdit})
      : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController serviceName = TextEditingController();
  TextEditingController serviceDetails = TextEditingController();
  TextEditingController servicePricePerMonth = TextEditingController();
  AdminStateController adminStateController = Get.put(AdminStateController());
  CollectionReference services =
      FirebaseFirestore.instance.collection('Services');
  bool imagePicked = false;
  bool editDataLoaded = false;
  late DocumentSnapshot<Object?> editData;
  // File? fromPicker;
  Uint8List? fromPicker;

  String getFileType(String input) {
    String temp = input.split('.')[1];
    return temp;
  }

  void LoadEditData() {
    if (documentIDToEdit != '') {
      services.doc(documentIDToEdit).get().then((value) {
        editData = value;
        serviceName.text = editData['nameOfService'];
        serviceDetails.text = editData['serviceDetails'];
        servicePricePerMonth.text = editData['costPerMonth'];
        editDataLoaded = true;
        adminStateController.update();
      });
    }
  }

  Future uploadFile(Uint8List uploadImageFile, String fileName) async {
    String refString = '/servicePictures/$fileName';
    Reference storageReference =
        FirebaseStorage.instance.ref().child(refString);
    try {
      storageReference.putData(uploadImageFile).then((p0) {
        p0.ref.getDownloadURL().then((value) {
          services.doc(fileName).update({'photoURL': value});
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              fontSize: 16.0);
          EasyLoading.dismiss();
        });
      });
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (documentIDToEdit != '') {
      LoadEditData();
    } else {
      editDataLoaded = true;
    }
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
          return getDesktopLayout(context);
        } else {
          return getMobileLayout();
        }
      }),
    );
  }

  Widget getDesktopLayout(BuildContext context) {
    return GetBuilder<AdminStateController>(builder: (_) {
      return editDataLoaded
          ? Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                    child: Container(
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
                              edit == true ? 'Edit' : 'Add New Service',
                              minFontSize: 30,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: AutoSizeText(
                              'Max 300 KB',
                              minFontSize: 15,
                              style: GoogleFonts.montserrat(
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: (() async {
                              if (kIsWeb) {
                                fromPicker =
                                    await ImagePickerWeb.getImageAsBytes();
                                print(fromPicker!.lengthInBytes.toString());
                                if ((fromPicker!.lengthInBytes / 1024) > 300) {
                                  Fluttertoast.showToast(
                                      msg: 'Error: Incorrect File Size !',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.black,
                                      fontSize: 16.0);
                                } else {
                                  imagePicked = true;
                                  adminStateController.update();
                                }
                              } else {}
                            }),
                            child: Container(
                                width: Get.width * 0.2,
                                height: Get.height * 0.2,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: buttonColor),
                                child: GetBuilder<AdminStateController>(
                                    builder: (_) {
                                  return imagePicked
                                      ? Image.memory(fromPicker!)
                                      : Icon(
                                          Icons.add_a_photo,
                                          size: 50,
                                        );
                                })),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.length < 3) {
                                            return 'Enter more than 3 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: serviceName,
                                        readOnly: false,
                                        maxLines: 1,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.design_services_rounded,
                                              color: textColorInsideTextBox,
                                            ),
                                            errorStyle:
                                                TextStyle(color: Colors.white),
                                            hintText: 'Name of Service',
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.length < 10) {
                                            return 'Enter more than 10 characters';
                                          } else {
                                            return null;
                                          }
                                        },
                                        obscureText: false,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: serviceDetails,
                                        readOnly: false,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                            errorStyle:
                                                TextStyle(color: Colors.white),
                                            hintText: 'Service Details',
                                            prefixIcon: Icon(
                                              Icons.info_outlined,
                                              color: textColorInsideTextBox,
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 0),
                                      child: TextFormField(
                                        validator: (value) {},
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: servicePricePerMonth,
                                        readOnly: false,
                                        maxLines: 1,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          // for below version 2 use this
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                          // for version 2 and greater youcan also use this
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.price_change_rounded,
                                              color: textColorInsideTextBox,
                                            ),
                                            errorStyle:
                                                TextStyle(color: Colors.white),
                                            hintText: 'Cost/ Month',
                                            filled: true,
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Center(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: buttonColorTwo,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      shadowColor: Colors.grey.shade500,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 20, 10, 20)),
                                  onPressed: () {
                                    if (!edit) {
                                      EasyLoading.show(
                                        maskType: EasyLoadingMaskType.clear,
                                        status: 'Uploading',
                                      );
                                      services.add({
                                        'nameOfService': serviceName.text,
                                        'serviceDetails': serviceDetails.text,
                                        'costPerMonth':
                                            servicePricePerMonth.text,
                                        'createdOn': DateTime.now(),
                                        'photoURL': '',
                                        'active': true
                                      }).then((value) {
                                        if (imagePicked) {
                                          uploadFile(fromPicker!, value.id)
                                              .then((value) {
                                            EasyLoading.dismiss();
                                            Get.close(1);
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Uploaded under progress in background',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.black,
                                                fontSize: 16.0);
                                            Get.close(1);
                                          });
                                        } else {
                                          EasyLoading.dismiss();
                                          Fluttertoast.showToast(
                                              msg: 'Uploaded without Picture',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.black,
                                              fontSize: 16.0);
                                          Get.close(1);
                                        }
                                      });
                                    } else {
                                      EasyLoading.show(
                                        maskType: EasyLoadingMaskType.clear,
                                        status: 'Uploading',
                                      );
                                      services.doc(documentIDToEdit).update({
                                        'nameOfService': serviceName.text,
                                        'serviceDetails': serviceDetails.text,
                                        'costPerMonth':
                                            servicePricePerMonth.text,
                                      }).then((value) {
                                        if (imagePicked) {
                                          uploadFile(
                                                  fromPicker!, documentIDToEdit)
                                              .then((value) {
                                            EasyLoading.dismiss();
                                            Get.close(1);
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Uploaded under progress in background',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.black,
                                                fontSize: 16.0);
                                            Get.close(1);
                                          });
                                        } else {
                                          EasyLoading.dismiss();
                                          Fluttertoast.showToast(
                                              msg: 'Uploaded without Picture',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.black,
                                              fontSize: 16.0);
                                          Get.close(1);
                                        }
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: AutoSizeText(
                                          edit == true ? 'Save' : 'Add',
                                          minFontSize: 15,
                                          style: GoogleFonts.poppins(
                                              color: textColorInsideTextBox,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : SpinKitChasingDots(
              color: textColor,
              size: 50.0,
            );
    });
  }

  Widget getMobileLayout() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Center(
            child: Container(
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
                      edit == true ? 'Edit' : 'Add New Service',
                      minFontSize: 30,
                      style: GoogleFonts.montserrat(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: AutoSizeText(
                      'Max 300 KB',
                      minFontSize: 10,
                      style: GoogleFonts.montserrat(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: Get.width * 0.2,
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: buttonColor),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 3) {
                                    return 'Enter more than 3 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: serviceName,
                                readOnly: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.design_services_rounded,
                                      color: textColorInsideTextBox,
                                    ),
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Name of Service',
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
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.length < 10) {
                                    return 'Enter more than 10 characters';
                                  } else {
                                    return null;
                                  }
                                },
                                obscureText: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: serviceDetails,
                                readOnly: false,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Service Details',
                                    prefixIcon: Icon(
                                      Icons.info_outlined,
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                              child: TextFormField(
                                validator: (value) {},
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: serviceName,
                                readOnly: false,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  // for below version 2 use this
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                  // for version 2 and greater youcan also use this
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.price_change_rounded,
                                      color: textColorInsideTextBox,
                                    ),
                                    errorStyle: TextStyle(color: Colors.white),
                                    hintText: 'Cost/ Month',
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
                            )
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Center(
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: buttonColorTwo,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.grey.shade500,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20)),
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: AutoSizeText(
                                  edit == true ? 'Save' : 'Add',
                                  minFontSize: 15,
                                  style: GoogleFonts.poppins(
                                      color: textColorInsideTextBox,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
