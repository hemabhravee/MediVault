import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medivault_app/src/common_module/models/classes.dart';
import 'package:medivault_app/src/common_module/models/data.dart';
import 'package:medivault_app/src/views/widgets/inventory_card.dart';
import 'package:medivault_app/src/common_module/widgets/sliver_app_bar.dart';

class Inventory extends StatefulWidget {
  Inventory({Key key}) : super(key: key);

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  Customer cus;

  int count = 0;
  @override
  void initState() {
    cus = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        getSliverAppBar(
            context: context,
            title: "Tracker",
            expandedHeight: 50,
            primaryPage: true),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 100,
          child: Center(
            child: Text(
              //'This is where you can add,\n or edit your medicine info',
              'You have not missed a medicine in 12 days!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        )),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return InventoryCard(medicine: cus.medicines[index], index: index);
        }, childCount: cus.medicines.length)),
      ],
    );
  }
}

// return Container(
//         color: Theme.of(context).backgroundColor,
//         child: Stack(
//           children: [
//             Container(
//               height: 200,
//               width: 800,
//               color: Theme.of(context).primaryColorDark,
//               child: Text("Someything"),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 180),
//               child: ListView.builder(
//                   itemCount: widget.customer.medicines.length,
//                   itemBuilder: (ctx, index) {
//                     return InventoryCard(
//                         medicine: widget.customer.medicines[index],
//                         index: index);
//                   }),
//             ),
//           ],
//         ));
