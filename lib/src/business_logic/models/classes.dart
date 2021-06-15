import 'package:flutter/material.dart';

class Medicine {
  String name;
  bool isTablet;
  int quantity;
  String quantityUnit;
  int repeatEveryXdays;
  List<String> timings;

  Medicine(
      {@required String name,
      @required bool isTablet,
      @required int quantity,
      @required int repeatEveryXdays,
      @required List<String> timings}) {
    this.name = name;
    this.isTablet = isTablet;
    this.quantity = quantity;
    this.repeatEveryXdays = repeatEveryXdays;
    this.timings = timings;
    this.quantityUnit = isTablet ? "tabs" : "mL";
  }
}

class Customer {
  List<Medicine> medicines;
  String name;
  Set<String> uniqueTimings = <String> {};

  Customer({List<Medicine> medicines, name}) {
    this.name = name;
    this.medicines = medicines;
    if (medicines != null) {
      medicines.forEach((element) {
        uniqueTimings.addAll(element.timings);
      });
    }
    sortUniqueTimings();
  }

  addMedicines(List<Medicine> medicines) {
    if (medicines.length > 0) {
      this.medicines.addAll(medicines);
      medicines.forEach((element) {
        uniqueTimings.addAll(element.timings);
      });
      sortUniqueTimings();
    }
  }

  sortUniqueTimings() {
    List<String> temp = uniqueTimings?.toList();
    temp?.sort();
    uniqueTimings = temp?.toSet();
  }
  //User types bhi isi mein?

}
