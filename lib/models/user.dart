class UserInfos {
  final String email, name, city;

  UserInfos({this.email, this.name, this.city});

  fromJson(json) {
    return UserInfos(
      email: json['email'],
      name: json['name'],
      city: json['city'],
    );
  }
}
