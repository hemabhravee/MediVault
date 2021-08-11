import 'package:flutter/material.dart';
import 'package:medivault_app/src/common_module/models/classes.dart';
import '../utils/hero_dialog_route.dart';
import '../utils/custom_rect_tween.dart';

// makeInventoryCard(BuildContext ctx, Medicine medicine, int index) => Hero(
//       tag: "medicine" + index.toString(),
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//         elevation: 1.0,
//         color: Theme.of(ctx).primaryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: InkWell(
//           splashColor: Theme.of(ctx).primaryColorDark,
//           onTap: () {
//             // Navigator.of(ctx).push(HeroDialogRoute(builder: (context) {
//             //   return popUpCard(index, context);
//             // }));
//             showDialog(
//               context: ctx,
//               builder: (BuildContext ctx) => popUpCard(medicine, index, ctx),
//             );
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(medicine.name, style: Theme.of(ctx).textTheme.headline4),
//                 Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                   Text(
//                     medicine.quantity.toString() +
//                         " " +
//                         medicine.quantityUnit +
//                         " " +
//                         "remaining",
//                     style: Theme.of(ctx).textTheme.subtitle1,
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

popUpCard(Medicine medicine, int index, BuildContext ctx) {
  return Hero(
    tag: "medicine" + index.toString(),
    createRectTween: (begin, end) {
      return CustomRectTween(begin: begin, end: end);
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(ctx).primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Medicine Name'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      "Introduction to Driving",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(" Intermediate", style: TextStyle(color: Colors.white))
      ],
    ),
    trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
