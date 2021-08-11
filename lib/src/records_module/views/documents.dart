import 'package:flutter/material.dart';
import 'package:medivault_app/src/common_module/widgets/sliver_app_bar.dart';

class Documents extends StatelessWidget {
  const Documents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      getSliverAppBar(
          context: context,
          title: "Documents",
          expandedHeight: 0,
          primaryPage: true),
      SliverToBoxAdapter(
          child: SizedBox(
              child: Center(child: Container(child: Text("Somethign"))))),
    ]);
  }
}
