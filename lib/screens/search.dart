import 'package:covid19/modal/country_data.dart';
import 'package:covid19/repo/all_country_wise_data.dart';
import 'package:covid19/utils/imports.dart';
import 'package:covid19/utils/utils.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<CountryData> listCountry = List();
  List<CountryData> listCountryDuplicate = List();
  TextEditingController searchController = TextEditingController();
  Future _future;
  FilterType filterType = FilterType.TotalConfimed;
  var scKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _future = CountrySummary.getCountrySummary().then((result) {
      setState(() {
        listCountry.addAll(result.listData);
        listCountryDuplicate.addAll(result.listData);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scKey,
      backgroundColor: Colors.grey.shade100,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 32, left: 16, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.white),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.search, color: CustomColors.COLORS_PRIMARY),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (str) {
                        if (str.length > 0) {
                          listCountry.clear();
                          print("SIZE : ${listCountryDuplicate.length} , $str");
                          listCountryDuplicate.forEach((f) {
                            if (f.country
                                .toLowerCase()
                                .contains(str.toLowerCase())) {
                              print("RESULT : ${f.country}");
                              setState(() {
                                listCountry.add(f);
                              });
                            }
                          });
                        } else {
                          listCountry.clear();
                          listCountry.addAll(listCountryDuplicate);
                          setState(() {});
                        }
                      },
                      decoration: InputDecoration(
                          border: border(),
                          focusedBorder: border(),
                          enabledBorder: border(),
                          hintText: "Search regions",
                          hintStyle: CustomStyle.styleSemiBold
                              .copyWith(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        scKey.currentState.showBottomSheet(
                            (context) => showFilterBottomSheet());
                      },
                      child: Icon(Icons.filter_list,
                          color: CustomColors.COLORS_PRIMARY)),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        searchController.clear();
                        setState(() {
                          listCountry.clear();
                          listCountry.addAll(listCountryDuplicate);
                        });
                      },
                      child: Icon(Icons.close,
                          color: CustomColors.COLORS_PRIMARY)),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 16, top: 24, bottom: 8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Corona Affected Countries",
                    style: CustomStyle.styleSemiBold
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 16, top: 24, bottom: 8, right: 16),
                    alignment: Alignment.centerRight,
                    child: Text(
                      getCasesHeaderText(),
                      style: CustomStyle.styleNormal
                          .copyWith(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            listCountry.length > 0
                ? Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return listItem(index);
                        },
                        padding: EdgeInsets.all(0),
                        itemCount: listCountry.length),
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  getCasesHeaderText() {
    if (filterType == FilterType.NewConfirmed) {
      return "New Confirmed Cases";
    } else if (filterType == FilterType.NewDeaths) {
      return "New Deaths Cases";
    } else if (filterType == FilterType.NewRecovered) {
      return "New Recovered Cases";
    } else if (filterType == FilterType.TotalConfimed) {
      return "Total Confirmed Cases";
    } else if (filterType == FilterType.TotalDeath) {
      return "New Deaths Cases";
    } else {
      return "New Recovered Cases";
    }
  }

  showFilterBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.NewConfirmed;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 32, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "New Confirmed Cases",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.NewDeaths;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 8, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "New Deaths",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.NewRecovered;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 8, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "New Recovered Cases",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.TotalConfimed;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 8, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "Total Confirmed Cases",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.TotalDeath;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 8, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "Total Deaths",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  filterType = FilterType.TotalRecovered;
                });
                Navigator.pop(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 8, right: 24, left: 24),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Text(
                  "Total Recovered Cases",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  listItem(index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          Text(
            localToEmoji(listCountry[index].iso2),
            style: CustomStyle.styleBold.copyWith(fontSize: 28),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  listCountry[index].country,
                  style: CustomStyle.styleBold
                      .copyWith(color: CustomColors.COLORS_PRIMARY),
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  getCasesValue(index),
                  style: CustomStyle.styleBold
                      .copyWith(color: CustomColors.COLORS_TEAL_DARK),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCasesValue(index) {
    if (filterType == FilterType.NewConfirmed) {
      return listCountry[index].newConfirmed.toString();
    } else if (filterType == FilterType.NewDeaths) {
      return listCountry[index].newDeaths.toString();
    } else if (filterType == FilterType.NewRecovered) {
      return listCountry[index].newRecovered.toString();
    } else if (filterType == FilterType.TotalConfimed) {
      return listCountry[index].totalConfirmed.toString();
    } else if (filterType == FilterType.TotalDeath) {
      return listCountry[index].totalDeaths.toString();
    } else {
      return listCountry[index].totaRecovered.toString();
    }
  }

  border() {
    return UnderlineInputBorder(
        borderSide: BorderSide(width: 0, color: Colors.transparent));
  }
}

enum FilterType {
  TotalConfimed,
  TotalDeath,
  TotalRecovered,
  NewConfirmed,
  NewDeaths,
  NewRecovered,
}
