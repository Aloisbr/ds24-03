class User {
  final String email, name;

  User({this.email, this.name});

  fromJson(json) {
    return User(
      email: json['email'],
      name: json['name'],
    );
  }
}

class ItemArguments {
  final String text;

  ItemArguments({this.text});
}
