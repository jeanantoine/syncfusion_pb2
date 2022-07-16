import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IconTest(),
    );
  }
}

class IconTest extends StatelessWidget {
  const IconTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SfCartesianChart(
      primaryXAxis: NumericAxis(
        minimum: 3,
        maximum: 5,
      ),
      annotations: get_annotations(data),
      series: <ChartSeries<ChartData, int>>[
        LineSeries<ChartData, int>(
            dataSource: data,
            xValueMapper: (ChartData sales, _) => sales.year,
            yValueMapper: (ChartData sales, _) => sales.sales),
      ],
    )));
  }

  List<CartesianChartAnnotation> get_annotations(List<ChartData> data) {
    List<CartesianChartAnnotation> annotations = <CartesianChartAnnotation>[];
    String weatherIconLocalPath = "images/p1j.svg";
    for (int i = 0; i < data.length; i++) {
      annotations.add(CartesianChartAnnotation(
        widget: SvgPicture.asset(
                    weatherIconLocalPath,
                    width: 60,
                    height: 60,
                  ),
        coordinateUnit: CoordinateUnit.point,
        // region: AnnotationRegion.plotArea,
        region: AnnotationRegion.chart,
        x: data[i].year,
        y: data[i].sales,
      ));
    }
    return annotations;
  }
}

var data = <ChartData>[
  // ChartData(0, 21),
  // ChartData(1, 21),
  // ChartData(2, 24),
  ChartData(3, 36),
  ChartData(4, 38),
  ChartData(5, 54),
  ChartData(6, 54),
  // ChartData(7, 70),
];

class ChartData {
  ChartData(this.year, this.sales);

  final int year;
  final double sales;
}
