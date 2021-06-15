import 'package:flutter/material.dart';
import 'package:medivault_app/src/business_logic/models/classes.dart';
import '../utils/custom_rect_tween.dart';
import '../widgets/sliver_app_bar.dart';

// This widget also serves as the form widget
class InventoryPopUpCard extends StatefulWidget {
  final Medicine medicine;
  final int index;
  InventoryPopUpCard({Key key, this.medicine, this.index}) : super(key: key);

  @override
  _InventoryPopUpCardState createState() => _InventoryPopUpCardState();
}

class _InventoryPopUpCardState extends State<InventoryPopUpCard> {
  @override
  void initState() {
    super.initState();
    _radioValue = widget.medicine.isTablet ? 0 : 1;
  }

  int _radioValue = 0;
  //widget.medicine.isTablet ? 0 : 1;

  _handleRadioOnChanged(index) {
    setState(() {
      _radioValue = index;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        getSliverAppBar(
            context: context,
            title: "Medicine Details",
            expandedHeight: 0,
            primaryPage: false),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 600,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        //borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text("Name",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          TextFormField(
                            initialValue: widget.medicine.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(), hintText: 'Name'),
                            validator: (value) {
                              if (value.isEmpty || value == null)
                                return 'please enter some text';
                            },
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text("Type",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: 0,
                                groupValue: _radioValue,
                                onChanged: _handleRadioOnChanged,
                              ),
                              Text("Tablet")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: _handleRadioOnChanged,
                              ),
                              Text("Syrup")
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Text("Quantity",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    // hintText: 'Quantity'
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: Text("Consumption",
                                style: Theme.of(context).textTheme.headline5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
