class Country {
  String country, slug, iso2;
  Country.fromMap(Map<String, dynamic> map)
      : country = map["Country"],
        slug = map["Slug"],
        iso2 = map["ISO2"];
}
