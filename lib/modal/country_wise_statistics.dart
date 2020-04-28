import 'package:covid19/modal/country_data.dart';
import 'package:covid19/modal/global_data.dart';

class CountryWiseStatistics {
  GlobalData globalData;
  List<CountryData> listData;
  CountryWiseStatistics.fromMap(Map<String, dynamic> map)
      : globalData = GlobalData.fromMap(map['Global']),
        listData = (map['Countries'] as List)
            .map((f) => CountryData.fromMap(f))
            .toList();
}
