
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
class MyChart extends StatelessWidget {
  final List<ChartData> data;

  const MyChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container ();
  }
}

// Define your data class
class ChartData {
  final double x;
  final double y;

  const ChartData(this.x, this.y);
}