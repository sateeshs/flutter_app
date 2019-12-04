class CountryResponse {
  final String name;
  CountryResponse({this.name});
  CountryResponse copyWith(Map<String, dynamic> json) {
    return CountryResponse(
        name: json["name"] ?? this.name);
  }
  CountryResponse.fromJson(Map<String, dynamic> json)
      : name = json["name"];
}


class Country {
  const Country({this.country, this.label});

  final String country;
  final String label;
}

const List<Country> countries = const <Country>[
  const Country(country: 'United Kingdom', label: "UK"),
  const Country(country: 'United States', label: "USA"),
  const Country(country: 'Other', label: "Other"),
  const Country(country: 'All', label: "All"),
];
