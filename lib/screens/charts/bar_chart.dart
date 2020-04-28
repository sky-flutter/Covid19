import 'package:covid19/utils/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticsLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  StatisticsLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory StatisticsLineChart.withSampleData() {
    return new StatisticsLineChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
  factory StatisticsLineChart.withSampleData1(x, y, labelX, labelY) {
    return new StatisticsLineChart(
      createSampleData1(x, y, labelX, labelY),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> createSampleData() {
    var myFakeMobileData = [
      new LinearSales("0", 15),
      new LinearSales("1/26", 75),
      new LinearSales("2/1", 300),
      new LinearSales("2/7", 225),
      new LinearSales("2/13", 125),
      new LinearSales("2/19", 15),
      new LinearSales("2/25", 25),
      new LinearSales("3/2", 50),
      new LinearSales("3/8", 20),
      new LinearSales("3/14", 8),
      new LinearSales("3/20", 18),
      new LinearSales("3/26", 28),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Mobile',
        // colorFn specifies that the line will be green.
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        // areaColorFn specifies that the area skirt will be light green.
        areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }

  static List<charts.Series<LinearSales, String>> createSampleData1(
      x, y, labelX, labelY) {
    var myFakeMobileData = [
      new LinearSales(labelX, x),
      new LinearSales(labelY, y),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Mobile',
        // colorFn specifies that the line will be green.
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        // areaColorFn specifies that the area skirt will be light green.
        areaColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String year;
  final int sales;

  LinearSales(this.year, this.sales);
}
