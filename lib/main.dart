import 'package:flutter/material.dart';
import './src/views/pages/home_page.dart';
import './src/views/pages/inventory.dart';
import './src/views/pages/tracker.dart';
import './src/views/pages/documents.dart';
import './src/views/pages/sos.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMainPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/inventory': (context) => Inventory(),
        '/tracker': (context) => Tracker(),
      },
    );
  }
}

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final List<Widget> _pages = [Tracker(), Inventory(), Documents(), Sos()];
  PageController pageController;
  GlobalKey<ConvexAppBarState> _appBarKey = GlobalKey<ConvexAppBarState>();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
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
    _appBarKey.currentState.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("MediVault"),
      ),
      body: PageView(
        children: _pages,
        controller: pageController,
        onPageChanged: _onTapped,
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Increment',
              child: Icon(Icons.add),
            )
          : null, // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: ConvexAppBar(
        key: _appBarKey,
        items: [
          TabItem(icon: Icons.timer, title: 'Tracker'),
          TabItem(icon: Icons.inventory_rounded, title: 'Inventory'),
          TabItem(icon: Icons.file_copy_outlined, title: 'Documents'),
          TabItem(icon: Icons.healing_sharp, title: 'SoS'),
        ], //optional, default as 0
        onTap: _onTapped,
        backgroundColor: Theme.of(context).primaryColor,
        initialActiveIndex: _selectedIndex,
      ),
    );
  }
}
