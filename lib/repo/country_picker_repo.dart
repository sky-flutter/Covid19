import 'dart:convert';

import 'package:covid19/modal/country.dart';
import 'package:http/http.dart' as http;

class CountryPickerRepo {
  static Future<List<Country>> getCountryPicker() async {
    List<Country> list;
    var response = await http.get("https://api.covid19api.com/countries");
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;

      list = data.map<Country>((data) => Country.fromMap(data)).toList();
    }
    return list;
  }
}
