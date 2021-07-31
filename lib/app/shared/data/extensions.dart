import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  double get constSize1 =>
      (MediaQuery.of(this).size.height) * 0.000981675392670157;
  double get height => (MediaQuery.of(this).size.height);
  double get width => (MediaQuery.of(this).size.width);
  double get statusBarHeight => (MediaQuery.of(this).padding.top);
}

extension DateTimeExtensions on DateTime {
  String get formatDate {
    try {
      var newDay = (day < 10) ? '0$day' : '$day';
      var newMonth = (month < 10) ? '0$month' : '$month';

      return '$year-$newMonth-$newDay';
    } catch (e) {
      return '0000-00-00';
    }
  }
}
