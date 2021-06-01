import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Container(
          child: Text(num.toString()),
        ),
        FloatingActionButton(
            onPressed: () {
              _test();
            },
            child: Icon(Icons.add))
      ],
    );
  }
}
