class GlobalData {
  int newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totaRecovered;

  GlobalData.fromMap(Map<String, dynamic> map)
      : newConfirmed = map["NewConfirmed"],
        totalConfirmed = map["TotalConfirmed"],
        newDeaths = map["NewDeaths"],
        totalDeaths = map["TotalDeaths"],
        newRecovered = map["NewRecovered"],
        totaRecovered = map["TotalRecovered"];
}
