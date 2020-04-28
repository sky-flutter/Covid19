import 'package:covid19/utils/imports.dart';

import 'charts/bar_chart.dart';
import 'charts/stack_chart.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  var selectedCases = "Total Cases";
  var selectedDeaths = "Deaths";

  final scKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scKey,
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  Strings.totalCaseOfVirus,
                  style: CustomStyle.styleBold.copyWith(
                      color: CustomColors.COLORS_PRIMARY, fontSize: 16),
                )),
            SizedBox(
              height: 16,
            ),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  Strings.statisticsCaseDesc,
                  style: CustomStyle.styleNormal
                      .copyWith(color: Colors.black, fontSize: 14),
                )),
            SizedBox(
              height: 16,
            ),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          items: <String>[
                            "Total Cases",
                            "Deaths",
                            "Recoveries",
                            "Active Cases"
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              child: Container(
                                child: Text(value,
                                    style: CustomStyle.styleNormal
                                        .copyWith(color: Colors.black)),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              value: value,
                            );
                          }).toList(),
                          value: selectedCases,
                          isDense: true,
                          isExpanded: true,
                          underline: Container(),
                          icon: Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedCases = value;
                            });
                          },
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          items: <String>[
                            "Total Cases",
                            "Deaths",
                            "Recoveries",
                            "Active Cases"
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              child: Container(
                                child: Text(value,
                                    style: CustomStyle.styleNormal
                                        .copyWith(color: Colors.black)),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              value: value,
                            );
                          }).toList(),
                          value: selectedDeaths,
                          isDense: true,
                          isExpanded: true,
                          underline: Container(),
                          icon: Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedDeaths = value;
                            });
                          },
                        )),
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: StackedAreaCustomColorLineChart.withSampleData1(),
                height: 300,
                width: double.infinity),
            SizedBox(
              height: 16,
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  Strings.newCases,
                  style: CustomStyle.styleBold.copyWith(
                      color: CustomColors.COLORS_PRIMARY, fontSize: 16),
                )),
            SizedBox(
              height: 16,
            ),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  Strings.newCaseDesc,
                  style: CustomStyle.styleNormal
                      .copyWith(color: Colors.black, fontSize: 14),
                )),
            Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4)),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          items: <String>[
                            "Total Cases",
                            "Deaths",
                            "Recoveries",
                            "Active Cases"
                          ].map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              child: Container(
                                child: Text(value,
                                    style: CustomStyle.styleNormal
                                        .copyWith(color: Colors.black)),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                              ),
                              value: value,
                            );
                          }).toList(),
                          value: selectedCases,
                          isDense: true,
                          isExpanded: true,
                          underline: Container(),
                          icon: Container(
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedCases = value;
                            });
                          },
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: StatisticsLineChart.withSampleData(),
                height: 300,
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
