class LoginResponse {
  final double id;
  final String firstName, lastName, mobile, username, code;
  LoginResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.code,
    this.mobile,
  });
  LoginResponse copyWith(Map<String, dynamic> json) {
    return LoginResponse(
        id: json["ID"] ?? this.id,
        firstName: json["FNAME"] ?? this.firstName,
        lastName: json["LNAME"] ?? this.lastName,
        username: json["RETAILERNAME"] ?? this.username,
        code: json["RETAILERCODE"] ?? this.code,
        mobile: json["MOBILENO"] ?? this.mobile);
  }
  LoginResponse.fromJson(Map<String, dynamic> json)
      : id = json["ID"],
        firstName = json["FNAME"],
        lastName = json["LNAME"],
        username = json["RETAILERNAME"],
        code = json["RETAILERCODE"],
        mobile = json["MOBILENO"];
}