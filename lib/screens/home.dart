import 'package:charts_flutter/flutter.dart';
import 'package:covid19/modal/country_data.dart';
import 'package:covid19/modal/global_data.dart';
import 'package:covid19/repo/all_country_wise_data.dart';
import 'package:covid19/screens/search.dart';
import 'package:covid19/screens/statistics.dart';
import 'package:covid19/utils/imports.dart';

import 'charts/bar_chart.dart';
import 'charts/stack_chart.dart';
import 'country_picker.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var scKey = GlobalKey<ScaffoldState>();
  Widget currentWidget;
  bool selectedTheme = false;
  var selectedCases = "Total Cases";
  var selectedDeaths = "Deaths";
  GlobalData globalData;
  String appbarTitle = "Global";
  Widget stackCharts;
  List<CountryData> listCountry = List();
  Future<CountryWiseStatistics> _future;

  String newConfirmed = "",
      totalConfirmed = "",
      newDeaths = "",
      totalDeaths = "",
      newRecovered = "",
      totaRecovered = "";

  String strWorldData = "Global";

  @override
  void initState() {
    super.initState();
    CountrySummary.getCountrySummary().then((result) {
      setState(() {
        listCountry = result.listData;
        globalData = result.globalData;
        newConfirmed = globalData.newConfirmed.toString();
        totalConfirmed = globalData.totalConfirmed.toString();
        newDeaths = globalData.newDeaths.toString();
        totalDeaths = globalData.totalDeaths.toString();
        newRecovered = globalData.newRecovered.toString();
        totaRecovered = globalData.totaRecovered.toString();
        createCharts();
        currentWidget = global();
      });
    });
  }

  createCharts() {
    // stackCharts = StackedAreaCustomColorLineChart.withSampleData(
    //         getMobileData(), getStackChartTabletData());
    stackCharts = StatisticsLineChart.withSampleData1(getMobileData(),
        getStackChartTabletData(), selectedCases, selectedDeaths);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              scKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.black),
          ),
          title: Text(
            appbarTitle,
            style: CustomStyle.styleSemiBold
                .copyWith(color: Colors.black, fontSize: 14),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          elevation: 8,
          child: Container(
            color: CustomColors.COLORS_TEAL_DARK,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 72, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(Strings.appName,
                          style: CustomStyle.styleSemiBold.copyWith(
                              color: CustomColors.COLORS_WHITE, fontSize: 20)),
                      Text("CoronaVirus Tracking App",
                          style: CustomStyle.styleSemiBold
                              .copyWith(color: CustomColors.COLORS_WHITE))
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(top: 24, left: 24),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top:16),
                              alignment: Alignment.centerLeft,
                              child: Text("Menus",
                                  style: CustomStyle.styleSemiBold.copyWith(
                                      color: Colors.white, fontSize: 18)),
                            ),
                            SizedBox(height: 16),
                            drawerMenu("Global", widget: global()),
                            SizedBox(height: 16),
                            drawerMenu("Stay Updated", widget: Statistics()),
                            SizedBox(height: 16),
                            drawerMenu("Search Regions", widget: Search()),
                            // SizedBox(height: 16),
                            // drawerMenu("Notifications"),
                            // SizedBox(height: 16),
                            // drawerMenu("Report a case"),
                            // SizedBox(height: 16),
                            // drawerMenu("Contact Us"),
                          ],
                        )),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 24, right: 24),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Text("Dark Theme",
                //           style: CustomStyle.styleNormal
                //               .copyWith(color: Colors.white)),
                //       Switch(
                //           value: selectedTheme,
                //           onChanged: (checked) {
                //             setState(() {
                //               selectedTheme = checked;
                //             });
                //           })
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade100,
        body: currentWidget != null
            ? currentWidget
            : Container(
                child: Center(child: CircularProgressIndicator()),
              ));
  }

  drawerMenu(text, {icon, widget}) {
    return GestureDetector(
      onTap: () {
        if (widget != null) {
          setState(() {
            currentWidget = widget;
            appbarTitle = text;
            Navigator.pop(context);
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.grain,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: CustomStyle.styleNormal.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  detailsCard(totalNumber, title, {isHelpEnabled: false, helpText: ""}) {
    return Container(
      margin: EdgeInsets.only(right: 8, top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.topRight,
              child: isHelpEnabled
                  ? Icon(
                      Icons.help,
                      size: 18,
                      color: CustomColors.COLORS_PRIMARY,
                    )
                  : Container(height: 18)),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              totalNumber,
              style: CustomStyle.styleBold
                  .copyWith(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: CustomStyle.styleSemiBold
                    .copyWith(color: CustomColors.COLORS_ACCENT)),
          )
        ],
      ),
    );
  }

  global() {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: <Widget>[
                    Text(
                      strWorldData,
                      style: CustomStyle.styleBold
                          .copyWith(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: scKey.currentContext,
                          builder: (context) => CountryPicker(listCountry),
                          elevation: 5,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                        ).then((result) {
                          setState(() {
                            CountryData countryData = listCountry[result];
                            strWorldData = countryData.country;
                            newConfirmed = countryData.newConfirmed.toString();
                            totalConfirmed =
                                countryData.totalConfirmed.toString();
                            newDeaths = countryData.newDeaths.toString();
                            totalDeaths = countryData.totalDeaths.toString();
                            newRecovered = countryData.newRecovered.toString();
                            totaRecovered =
                                countryData.totaRecovered.toString();
                            createCharts();
                            currentWidget = global();
                          });
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: CustomColors.COLORS_ACCENT)),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: CustomColors.COLORS_ACCENT,
                          )),
                    )
                  ],
                )),
            SizedBox(
              height: 16,
            ),
            Container(
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
                              createCharts();
                              currentWidget = global();
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
                              createCharts();
                              currentWidget = global();
                            });
                          },
                        )),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 8),
            Container(
                margin: EdgeInsets.only(left: 16),
                child: stackCharts != null ? stackCharts : Container(),
                height: 300,
                width: double.infinity),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 8, bottom: 8),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.6),
                children: <Widget>[
                  detailsCard(newConfirmed, "New Confirmed Cases"),
                  detailsCard(totalConfirmed, "Total Confirmed Cases"),
                  detailsCard(newDeaths, "New Deaths Cases"),
                  detailsCard(totalDeaths, "Total Deaths Cases"),
                  detailsCard(newRecovered, "New Recovered Cases"),
                  detailsCard(totaRecovered, "Total Recovered Cases"),
                ],
                padding: EdgeInsets.all(0),
                primary: false,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  getMobileData() {
    if (selectedCases == "Total Cases") {
      return int.parse(totalConfirmed);
    } else if (selectedCases == "Deaths") {
      return int.parse(totalDeaths);
    } else {
      return int.parse(totaRecovered);
    }
  }

  getStackChartTabletData() {
    if (selectedDeaths == "Total Cases") {
      return int.parse(totalConfirmed);
    } else if (selectedDeaths == "Deaths") {
      return int.parse(totalDeaths);
    } else {
      return int.parse(totaRecovered);
    }
  }
}
