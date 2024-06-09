// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:theitsolution/UserFiles/UserStateController.dart';

import '../MainPage/MainPage.dart';
import '../globals.dart';
import 'UserCombinedFunctions.dart';

class AvailableSolutions extends StatelessWidget {
  AvailableSolutions({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late QuerySnapshot<Object?> servicesData;
  bool servicesLoaded = false;
  UserStateController userStateController = Get.put(UserStateController());
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  CollectionReference subscribedPlans =
      FirebaseFirestore.instance.collection('subscribedPlans');
  CollectionReference services =
      FirebaseFirestore.instance.collection('Services');
  late List<Image> loadedImages;

  void getServices() {
    services.where('active', isEqualTo: true).get().then((value) {
      servicesData = value;
      servicesLoaded = true;
      loadedImages = List.filled(
          servicesData.docs.length, Image.asset('assets/loading.gif'),
          growable: false);
      loadAllImages();
      userStateController.update();
    });
  }

  Future<Image?> getImageFile(String url) async {
    final httpsReference = FirebaseStorage.instance.refFromURL(url);
    try {
      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await httpsReference.getData(oneMegabyte);
      return Image.memory(data!);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          msg: 'Error: $e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
      return null;
    }
  }

  void loadAllImages() {
    for (var i = 0; i < servicesData.docs.length; i++) {
      if (servicesData.docs[i]['photoURL'] != '') {
        getImageFile(servicesData.docs[i]['photoURL']).then((value) {
          loadedImages[i] = value!;
          userStateController.update();
        });
      } else {
        loadedImages[i] = Image.asset('assets/banner.png');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getServices();
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

  void implementSubscribeButton(int index) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.clear,
      status: 'Loading Data',
    );
    subscribedPlans
        .where('email', isEqualTo: auth.currentUser!.email)
        .where('planID', isEqualTo: servicesData.docs[index].id)
        .limit(1)
        .get()
        .then((value) {
      EasyLoading.dismiss();
      if (value.docs.isEmpty) {
        EasyLoading.show(
          maskType: EasyLoadingMaskType.clear,
          status: 'Subscribing to Plan',
        );
        subscribedPlans.add({
          'email': auth.currentUser!.email,
          'planID': servicesData.docs[index].id,
          'subscribedOn': DateTime.now(),
          'active': true,
          'planName': servicesData.docs[index]['nameOfService'],
        }).then((value) {
          EasyLoading.dismiss();
          Fluttertoast.showToast(
              msg: 'Subscribtion Successful',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              fontSize: 16.0);
        });
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg: 'Already Subscribed',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.grey,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(
          msg: 'Error: $error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  Widget getDesktopLayout() {
    return GetBuilder<UserStateController>(builder: (_) {
      return Center(
        child: servicesLoaded
            ? Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Get.height * 0.35, crossAxisCount: 3),
                    itemCount: servicesData.docs.length,
                    itemBuilder: (context, index) {
                      return TransparentImageCard(
                        width: Get.width * 0.3,
                        height: Get.height * 0.3,
                        imageProvider: loadedImages[index].image,
                        footer: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: buttonColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              implementSubscribeButton(index);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: AutoSizeText(
                                    'Subscribe',
                                    style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                        title: AutoSizeText(
                          servicesData.docs[index]['nameOfService'],
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        description: AutoSizeText(
                          servicesData.docs[index]['serviceDetails'],
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      );
                    }),
              )
            : SpinKitChasingDots(
                color: textColor,
                size: 50.0,
              ),
      );
    });
  }

  Widget getMobileLayout() {
    return GetBuilder<UserStateController>(builder: (_) {
      return Center(
        child: servicesLoaded
            ? Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: Get.height * 0.45, crossAxisCount: 2),
                    itemCount: servicesData.docs.length,
                    itemBuilder: (context, index) {
                      return TransparentImageCard(
                        width: Get.width * 0.4,
                        height: Get.height * 0.4,
                        imageProvider: loadedImages[index].image,
                        footer: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: buttonColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.grey.shade500,
                            ),
                            onPressed: () {
                              implementSubscribeButton(index);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: AutoSizeText(
                                    'Subscribe',
                                    style: GoogleFonts.poppins(
                                        color: textColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                        title: AutoSizeText(
                          servicesData.docs[index]['nameOfService'],
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.bold),
                        ),
                        description: AutoSizeText(
                          servicesData.docs[index]['serviceDetails'],
                          style: GoogleFonts.poppins(
                              color: textColor, fontWeight: FontWeight.normal),
                        ),
                      );
                    }),
              )
            : SpinKitChasingDots(
                color: textColor,
                size: 50.0,
              ),
      );
    });
  }
}
