import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  double get constSize1 =>
      (MediaQuery.of(this).size.height) * 0.000981675392670157;
  double get height => (MediaQuery.of(this).size.height);
  double get width => (MediaQuery.of(this).size.width);
  double get statusBarHeight => (MediaQuery.of(this).padding.top);
}
