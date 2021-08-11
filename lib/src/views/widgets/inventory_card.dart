import 'package:flutter/material.dart';
import 'package:medivault_app/src/common_module/models/classes.dart';
import 'package:medivault_app/src/views/utils/custom_splash_factory.dart';
import './inventory_pop_up_card.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class InventoryCard extends StatefulWidget {
  Medicine medicine;
  int index;
  InventoryCard({Key key, this.medicine, this.index}) : super(key: key);

  @override
  _InventoryCardState createState() => _InventoryCardState();
}

class _InventoryCardState extends State<InventoryCard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "medicine" + widget.index.toString(),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 6.0,
        shadowColor: Theme.of(context).primaryColorDark,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.medicine.name,
                  style: Theme.of(context).textTheme.headline4),
              Container(
                //width: 220,
                child: Center(
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            widget.medicine.quantity.toString() +
                                " " +
                                widget.medicine.quantityUnit +
                                " " +
                                "remaining",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 120),
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.edit,
                                color: Theme.of(context).highlightColor),

                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(1),

                                //padding: MaterialStateProperty.all<EdgeInsets>(
                                //EdgeInsets.all(15)),
                                // foregroundColor: MaterialStateProperty.all<Color>(
                                //     Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context).primaryColorDark),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  // side: BorderSide(color: Colors.white)
                                ))),
                            label: Text(
                              "edit",
                              style: Theme.of(context).textTheme.button,
                            ),
                            // child: Text(
                            //   "edit",
                            //   style: Theme.of(context).textTheme.button,
                            // ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 300),
                                      // transitionsBuilder: (BuildContext context,
                                      //     Animation<double> animation,
                                      //     Animation<double> secAnimation,
                                      //     Widget child) {
                                      //   animation = CurvedAnimation(
                                      //       parent: animation,
                                      //       curve: Curves.elasticInOut);
                                      //   return ScaleTransition(
                                      //     scale: animation,
                                      //     child: child,
                                      //     alignment: Alignment.center,
                                      //   );
                                      // },
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation) {
                                        return InventoryPopUpCard(
                                          medicine: widget.medicine,
                                          index: widget.index,
                                        );
                                      }));
                            },
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MaterialPageRoute(
//                                       builder: (context) => InventoryPopUpCard(
//                                           medicine: widget.medicine,
//                                           index: widget.index))
