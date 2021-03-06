import 'package:covid19/utils/imports.dart';
import 'package:http/http.dart' as http;
class CountrySummary {
  static Future<CountryWiseStatistics> getCountrySummary() async {
    CountryWiseStatistics countryWiseStatistics;
    var response = await http.get("https://api.covid19api.com/summary");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      countryWiseStatistics = CountryWiseStatistics.fromMap(data);
    }
    return countryWiseStatistics;
  }
}
