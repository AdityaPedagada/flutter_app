import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/home_page.dart';
import 'package:flutter_app1/pages/lonin_page.dart';
import 'package:flutter_app1/utils/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: Constants.prefs?.getBool("loggedIn") == true
            ? HomePage()
            : LoginPage(),
        routes: {
          LoginPage.routerName: (context) => LoginPage(),
          HomePage.routerName: (context) => HomePage()
        });
  }
}
