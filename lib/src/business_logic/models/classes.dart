import 'package:flutter/material.dart';

class Medicine {
  String name;
  bool isTablet;
  int quantity;
  String quantityUnit;
  int repeatEveryXdays;
  List<TimeOfDay> timings;
}

class Customer {
  List<Medicine> medicines;
}
