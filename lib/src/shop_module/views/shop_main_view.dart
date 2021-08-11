import 'package:flutter/material.dart';
import 'package:medivault_app/src/common_module/widgets/sliver_app_bar.dart';

class ShopMainView extends StatelessWidget {
  const ShopMainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      getSliverAppBar(
          context: context, title: "Shop", expandedHeight: 0, primaryPage: true),
      SliverToBoxAdapter(
          child: SizedBox(
              child: Center(child: Container(child: Text("Something"))))),
    ]);
  }
}
