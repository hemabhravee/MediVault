import './classes.dart';
import 'package:flutter/material.dart';

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

Customer newcus = new Customer(name: "", medicines: <Medicine>[]);
Customer withData = new Customer(name: "Test Name", medicines: meds);
