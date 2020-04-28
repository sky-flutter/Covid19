import 'package:covid19/utils/imports.dart';

import 'charts/pie_chart.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("Covid 19 Global Cases",
                  style: CustomStyle.styleBold.copyWith(color: Colors.black)),
              Container(
                height: 150,
                child: DonutPieChart.withSampleData(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
