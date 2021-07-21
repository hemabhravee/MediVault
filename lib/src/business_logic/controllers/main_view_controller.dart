import 'package:medivault_app/src/business_logic/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var night = new TimeOfDay(hour: 22, minute: 0).toString();
var noon = new TimeOfDay(hour: 14, minute: 0).toString();

var med1 = new Medicine(
    name: "Bcosule",
    isTablet: true,
    quantity: 15,
    repeatEveryXdays: 1,
    timings: [night]);

var med2 = new Medicine(
    name: "Levocet",
    isTablet: true,
    quantity: 10,
    repeatEveryXdays: 1,
    timings: [noon, night]);

var meds = [med1, med2, med1, med1, med2, med1, med1, med2, med1];

class MainViewController extends GetxController {
  List<Medicine> medicines = <Medicine>[].obs;
  String name;
  Set<String> uniqueTimings = <String>{};

  MainViewController({List<Medicine> medicines, name}) {
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
}
