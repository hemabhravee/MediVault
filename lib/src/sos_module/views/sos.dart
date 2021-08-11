import 'package:flutter/material.dart';
import 'package:medivault_app/src/common_module/widgets/sliver_app_bar.dart';

class Sos extends StatelessWidget {
  const Sos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      getSliverAppBar(
          context: context, title: "SOS", expandedHeight: 0, primaryPage: true),
      SliverToBoxAdapter(
          child: SizedBox(
              child: Center(child: Container(child: Text("Something"))))),
    ]);
  }
}
