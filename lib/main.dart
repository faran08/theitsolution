import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theitsolution/LoginFiles/MainLoginPage.dart';
import 'package:theitsolution/LoginFiles/SignUpPage.dart';
import 'package:theitsolution/MainPage/MainPage.dart';
import 'package:theitsolution/UserFiles/UserHomePage.dart';

void main() {
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
      theme: ThemeData(),
      initialRoute: '/',
      onGenerateRoute: generateRoute,
      // home: const MainPage(),
      // routes: {
      //   '/': (context) => const MainPage(),
      //   '/MainLoginPage': (context) => MainLoginPage(),
      //   '/SignUpPage': (context) => SignUpPage(),
      // },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case '/MainLoginPage\$':
        return MaterialPageRoute(builder: (_) => MainLoginPage());
      case '/SignUpPage\$':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/UserHomePage\$':
        return MaterialPageRoute(builder: (_) => UserHomePage());
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
