class CountryData {
  String country, slug, iso2;
  int newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totaRecovered;
  String date;
  CountryData.fromMap(Map<String, dynamic> map)
      : country = map["Country"],
        slug = map["Slug"],
        iso2 = map["CountryCode"],
        newConfirmed = map["NewConfirmed"],
        totalConfirmed = map["TotalConfirmed"],
        newDeaths = map["NewDeaths"],
        totalDeaths = map["TotalDeaths"],
        newRecovered = map["NewRecovered"],
        date = map['Date'],
        totaRecovered = map["TotalRecovered"];
}

// "Global": {
//     "NewConfirmed": 70272,
//     "TotalConfirmed": 3039914,
//     "NewDeaths": 4620,
//     "TotalDeaths": 211113,
//     "NewRecovered": 28234,
//     "TotalRecovered": 893322
// },
// "Countries": [
//     {
//         "Country": "ALA Aland Islands",
//         "CountryCode": "AX",
//         "Slug": "ala-aland-islands",
//         "NewConfirmed": 0,
//         "TotalConfirmed": 0,
//         "NewDeaths": 0,
//         "TotalDeaths": 0,
//         "NewRecovered": 0,
//         "TotalRecovered": 0,
//         "Date": "2020-04-28T05:02:33Z"
//     },
