import 'package:flutter/material.dart';
import 'package:flutter_app1/pages/home_page.dart';
import 'package:flutter_app1/pages/lonin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: LoginPage(),
        routes: {
          LoginPage.routerName: (context) => LoginPage(),
          HomePage.routerName: (context) => HomePage()
        });
  }
}
