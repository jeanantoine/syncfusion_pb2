import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData_jg> data2 = [
    _SalesData_jg(1930, 135),
    _SalesData_jg(1931, 134),
    _SalesData_jg(1932, 137),
    _SalesData_jg(1933, 132),
    _SalesData_jg(1934, 138),
    _SalesData_jg(1935, 134),
    _SalesData_jg(1935, 132),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Column(children: [
          //Initialize the chart widget
          SfCartesianChart(
              // annotations: annotations(data2),
              annotations: <CartesianChartAnnotation>[
                CartesianChartAnnotation(
                    widget: Container(child: const Text('Annotation')),
                    // coordinateUnit: CoordinateUnit.point,
                    coordinateUnit: CoordinateUnit.point,
                    region: AnnotationRegion.chart,
                    x: 1932,
                    y: 135)
              ],
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData_jg, int>>[
                LineSeries<_SalesData_jg, int>(
                    dataSource: data2,
                    xValueMapper: (_SalesData_jg sales, _) => sales.year,
                    yValueMapper: (_SalesData_jg sales, _) => sales.sales,
                    name: 'Sales 2',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
        ]));
  }

  List<CartesianChartAnnotation> annotations(List<_SalesData_jg> data) {
    List<CartesianChartAnnotation> annotations = <CartesianChartAnnotation>[];
    for (int i = 0; i < data.length; i++) {
      print("${data[i].year} ${data[i].sales}");
      annotations.add(CartesianChartAnnotation(
        // coordinateUnit: CoordinateUnit.point,
        // yAxisName: 'Y',
        coordinateUnit: CoordinateUnit.point,
        region: AnnotationRegion.chart,
        x: data[i].year,
        y: data[i].sales,
      ));
    }
    return annotations;
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _SalesData_jg {
  _SalesData_jg(this.year, this.sales);

  final int year;
  final double sales;
}
