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
      home: const IconTest(),
    );
  }
}

final emoij = {
  'Averses': "🌦️",
  'Eclaircies': "🌤️",
  'Ensoleillé': "☀️",
  'Pluie': "🌧️",
  'Pluies éparses': "🌦️",
  'Rares averses': "🌦️",
  'Très nuageux': "☁️️",
};

class AxisTest1 extends StatelessWidget {
  const AxisTest1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        labelStyle: const TextStyle(
                            color: Colors.deepOrange,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500))))));
  }
}

class IconTest extends StatelessWidget {
  const IconTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                  labelStyle: const TextStyle(
                      color: Colors.deepOrange,
                      fontFamily: 'Roboto',
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500)),
              // primaryXAxis: CategoryAxis(
              //     labelPlacement: LabelPlacement.betweenTicks),
              annotations: <CartesianChartAnnotation>[
                CartesianChartAnnotation(
                  widget: Text(
                    emoij['Averses']!,
                    style: const TextStyle(
                        color: Color.fromRGBO(216, 225, 227, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  coordinateUnit: CoordinateUnit.point,
                  region: AnnotationRegion.chart,
                  x: 'apr',
                  y: 38,
                ),
                CartesianChartAnnotation(
                  widget: Text(
                    emoij['Ensoleillé']!,
                    style: const TextStyle(
                        color: Color.fromRGBO(216, 225, 227, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 80),
                  ),
                  coordinateUnit: CoordinateUnit.point,
                  region: AnnotationRegion.chart,
                  x: 'jun',
                  y: 54,
                )
              ],
              series: <ChartSeries<ChartData, String>>[
                LineSeries<ChartData, String>(
                    dataSource: <ChartData>[
                      ChartData('jan' + emoij['Averses']!, 21),
                      ChartData('feb', 24),
                      ChartData('mar', 36),
                      ChartData('apr', 38),
                      ChartData('may', 54),
                      ChartData('jun', 54),
                      ChartData('jul', 70),
                    ],
                    xValueMapper: (ChartData sales, _) => sales.year,
                    yValueMapper: (ChartData sales, _) => sales.sales),
              ],
            )));
  }
}

class ChartData {
  ChartData(this.year, this.sales);

  final String year;
  final double sales;
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    //  _SalesData('Apr', 32),
    _SalesData('Apr1', 32),
    _SalesData('Apr2', 32),
    _SalesData('Apr3', 32),
    _SalesData('May', 100)
  ];
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
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData_jg, int>>[
                // LineSeries<_SalesData, String>(
                //     dataSource: data,
                //     xValueMapper: (_SalesData sales, _) => sales.year,
                //     yValueMapper: (_SalesData sales, _) => sales.sales,
                //     name: 'Sales 1',
                //     // Enable data label
                //     dataLabelSettings: const DataLabelSettings(isVisible: true)),
                LineSeries<_SalesData_jg, int>(
                    dataSource: data2,
                    xValueMapper: (_SalesData_jg sales, _) => sales.year,
                    yValueMapper: (_SalesData_jg sales, _) => sales.sales,
                    name: 'Sales 2',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData_jg, int>>[
                // LineSeries<_SalesData, String>(
                //     dataSource: data,
                //     xValueMapper: (_SalesData sales, _) => sales.year,
                //     yValueMapper: (_SalesData sales, _) => sales.sales,
                //     name: 'Sales 1',
                //     // Enable data label
                //     dataLabelSettings: const DataLabelSettings(isVisible: true)),
                LineSeries<_SalesData_jg, int>(
                    dataSource: data2,
                    xValueMapper: (_SalesData_jg sales, _) => sales.year,
                    yValueMapper: (_SalesData_jg sales, _) => sales.sales,
                    name: 'Sales 2',
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: SfSparkLineChart.custom(
                //Enable the trackball
                trackball: const SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                //Enable marker
                marker: const SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].year,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 5,
              ),
            ),
          )
        ]));
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
