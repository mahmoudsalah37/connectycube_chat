import 'package:flutter/material.dart';

class Responsive {
  Responsive(BuildContext context) {
    size = MediaQuery.of(context).size;
  }
  late final Size size;

  ///0 => 100
  double getHeight(double precentage) => size.height * (precentage / 100);
  double getWidth(double precentage) => size.width * (precentage / 100);
}
