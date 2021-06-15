import 'package:flutter/material.dart';

Widget getSliverAppBar(
    {BuildContext context,
    String title,
    double expandedHeight,
    bool primaryPage}) {
  return SliverAppBar(
    pinned: true,
    elevation: 10,
    shadowColor: Theme.of(context).primaryColor,
    floating: true,
    expandedHeight: expandedHeight,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(left: primaryPage ? 20 : 50, bottom: 10),
      title: Text(
        title,
        style: TextStyle(fontSize: 28),
      ),

      background: Container(
          //color: Colors.red,
          height: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(" "),
            ],
          )),
      //FlutterLogo(),
      stretchModes: const <StretchMode>[
        StretchMode.zoomBackground,
        StretchMode.blurBackground,
        StretchMode.fadeTitle,
      ],
    ),
  );
}
