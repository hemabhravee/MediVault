import 'package:flutter/material.dart';
import '../widgets/sliver_app_bar.dart';

class Tracker extends StatefulWidget {
  const Tracker({Key key}) : super(key: key);

  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> with AutomaticKeepAliveClientMixin {
  int num = 0;

  _test() {
    setState(() {
      num++;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(slivers: <Widget>[
      getSliverAppBar(
          context: context,
          title: "Tracker",
          expandedHeight: 0,
          primaryPage: true),
      SliverToBoxAdapter(
          child: SizedBox(
              child: Center(child: Container(child: Text("Something"))))),
    ]);
  }
}
