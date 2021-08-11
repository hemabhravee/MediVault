import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medivault_app/src/main_view_controller.dart';
import 'package:medivault_app/src/new_main_view_controller.dart';
import 'package:medivault_app/src/common_module/models/classes.dart';
import 'package:medivault_app/src/common_module/models/data.dart';
import 'package:medivault_app/src/tracker_module/views/inventory.dart';
import 'package:medivault_app/src/records_module/views/documents.dart';
import 'package:medivault_app/src/sos_module/views/sos.dart';
import 'package:medivault_app/src/shop_module/views/shop_main_view.dart';
import 'package:get/get.dart';

class MyMainView extends StatefulWidget {
  MyMainView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainViewState createState() => _MyMainViewState();
}

class _MyMainViewState extends State<MyMainView> {
  final List<Widget> _pages = [
    Inventory(key: PageStorageKey<String>("inventory")),
    Documents(key: PageStorageKey<String>("documents")),
    Sos(key: PageStorageKey<String>("sos")),
    ShopMainView(key: PageStorageKey<String>("shop")),
  ];
  Customer user;
  PageController pageController;
  GlobalKey<ConvexAppBarState> _appBarKey = GlobalKey<ConvexAppBarState>();

  var mainController = MainViewController();
  var newMainController = NewMainViewController();

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    user = Get.put(withData);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
    //_appBarKey.currentState.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(appbartitle[_selectedIndex]),
      // ),
      body: PageStorage(
        child: _pages[_selectedIndex],
        bucket: bucket,
      ),
      // PageView(
      //   children: _pages,
      //   controller: pageController,
      //   onPageChanged: _onTapped,
      // ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              backgroundColor: Theme.of(context).backgroundColor,
              child: Icon(
                Icons.add,
                color: Theme.of(context).primaryColorDark,
              ))
          : null, // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: ConvexAppBar(
        //top: -50,
        height: 60,
        curve: Curves.elasticInOut,
        curveSize: 100,
        activeColor: Theme.of(context).indicatorColor,
        key: _appBarKey,
        items: [
          TabItem(
            icon: Icons.timer,
            title: 'Tracker',
          ),
          TabItem(icon: Icons.file_copy_outlined, title: 'Documents'),
          TabItem(icon: Icons.healing_sharp, title: 'SoS'),
          TabItem(icon: Icons.shop, title: 'Shop'),
        ], //optional, default as 0
        onTap: _onTapped,
        backgroundColor: Theme.of(context).primaryColorDark,
        color: Theme.of(context).backgroundColor,
        initialActiveIndex: _selectedIndex,
      ),

      //     CurvedNavigationBar(
      //   key: _appBarKey,
      //   items: <Widget>[
      //     Icon(Icons.timer, size: 40),
      //     Icon(Icons.file_copy_outlined, size: 40),
      //     Icon(Icons.healing_sharp, size: 40),
      //   ],
      //   onTap: _onTapped,
      //   index: _selectedIndex,
      //   animationDuration: Duration(milliseconds: 100),
      //   backgroundColor: Colors.transparent,
      //   buttonBackgroundColor: Theme.of(context).primaryColorLight,
      //   color: Theme.of(context).primaryColor,
      //   height: 75,
      // ),

      // BottomAppBar(
      //   child: BottomNavigationBar(items: items)
      // )
    );
  }
}
