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