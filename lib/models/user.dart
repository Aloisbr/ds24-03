class UserInfos {
  final String email, name, firstName, city;

  UserInfos({this.email, this.name, this.firstName, this.city});

  fromJson(json) {
    return UserInfos(
      email: json['email'],
      name: json['name'],
      firstName: json['firstName'],
      city: json['city'],
    );
  }
}
