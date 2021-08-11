import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medivault_app/src/common_module/models/data.dart';
import 'package:medivault_app/src/main_view.dart';
import 'package:medivault_app/src/tracker_module/views/inventory.dart';
import 'package:medivault_app/src/records_module/views/documents.dart';
import 'package:medivault_app/src/sos_module/views/sos.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:medivault_app/src/common_module/models/classes.dart';
import 'package:medivault_app/src/shop_module/views/shop_main_view.dart';

void main() {
  runApp(MyApp());
}

const appbartitle = ["Tracker", "Inventory", "Documents", "Sos"];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.indigo)),

        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        highlightColor: Color(0xFFD5D5FF),
        primarySwatch: Colors.indigo,
        primaryColorLight: Colors.indigo[300],
        accentColor: Colors.red,
        indicatorColor: Colors.white,
        secondaryHeaderColor: Colors.purple,
        backgroundColor: Color(0xFFF5F5FF),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            caption: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                wordSpacing: 1,
                height: 1.5,
                fontWeight: FontWeight.w500),
            headline4: TextStyle(color: Color(0xFFE2E2FD)),
            button: TextStyle(color: Color(0xFFE2E2FD))),
      ),
      home: MyMainView(),
      getPages: [
        GetPage(name: '/', page: () => MyMainView()),
        GetPage(name: '/inventory', page: () => Inventory()),
        GetPage(name: '/shop', page: () => ShopMainView()),
        GetPage(name: '/documents', page: () => Documents()),
        GetPage(name: '/sos', page: () => Sos()),
      ],
    );
  }
}
