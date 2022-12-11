import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:theitsolution/AdminFiles/AddEditService.dart';
import 'package:theitsolution/AdminFiles/AdminChatHistory.dart';
import 'package:theitsolution/AdminFiles/AdminHomePage.dart';
import 'package:theitsolution/AdminFiles/AdminUserChat.dart';
import 'package:theitsolution/AdminFiles/ManageITServices.dart';
import 'package:theitsolution/AdminFiles/Subscribers.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/UserFiles/About.dart';
import 'package:theitsolution/UserFiles/AvailableSolutions.dart';
import 'package:theitsolution/UserFiles/ChatHistory.dart';
import 'package:theitsolution/UserFiles/ChatWithAgent.dart';
import 'package:theitsolution/UserFiles/Contact.dart';
import 'package:theitsolution/UserFiles/UserHomePage.dart';
import 'package:theitsolution/globals.dart';

import 'UserFiles/BoughtSolutions.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The IT Solutions',
      theme: ThemeData(
          scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(buttonColor),
      )),
      initialRoute: '/',
      builder: EasyLoading.init(),
      onGenerateRoute: generateRoute,
      // home: const MainPage(),
      // routes: {
      //   '/': (context) => const MainPage(),
      //   '/MainLoginPage': (context) => MainLoginPage(),
      //   '/SignUpPage': (context) => SignUpPage(),
      // },
    );
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.hourGlass
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/MainPage\$':
        return MaterialPageRoute(builder: (_) => MainPage());
      case '/MainLoginPage\$':
        return MaterialPageRoute(builder: (_) => MainLoginPage());
      case '/SignUpPage\$':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/UserHomePage\$':
        return MaterialPageRoute(builder: (_) => UserHomePage());
      case '/ChatWithAgent\$':
        return MaterialPageRoute(builder: (_) => ChatWithAgent());
      case '/ChatHistory\$':
        return MaterialPageRoute(builder: (_) => ChatHistory());
      case '/AvailableSolutions\$':
        return MaterialPageRoute(builder: (_) => AvailableSolutions());
      case '/BoughtSolutions\$':
        return MaterialPageRoute(builder: (_) => BoughtSolutions());
      case '/Contact\$':
        return MaterialPageRoute(builder: (_) => Contact());
      case '/About\$':
        return MaterialPageRoute(builder: (_) => About());
      case '/AdminHomePage\$':
        return MaterialPageRoute(builder: (_) => AdminHomePage());
      case '/AdminUserChat\$':
        return MaterialPageRoute(builder: (_) => AdminUserChat());
      case '/AdminChatHistory\$':
        return MaterialPageRoute(builder: (_) => AdminChatHistory());
      case '/ManageITServices\$':
        return MaterialPageRoute(builder: (_) => ManageITServices());
      case '/Subscribers\$':
        return MaterialPageRoute(builder: (_) => Subscribers());
      case '/AddEditService\$':
        return MaterialPageRoute(
            builder: (_) => AddEditService(
                  edit: false,
                  documentIDToEdit: '',
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
