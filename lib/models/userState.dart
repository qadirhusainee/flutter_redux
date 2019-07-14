class User {
  String token;
  String id;

  User({
    this.token,
    this.id,
  });

  User copyWith({String token, String id}) {
    return User(
      token: token ?? this.token,
      id: id ?? this.id,
    );
  }

  User.initialState()
      : token = null,
        id = null;

  Map<String, dynamic> toJSON() =>
      <String, dynamic>{'token': this.token, 'id': this.id};

  factory User.fromJSON(Map<String, dynamic> json) => User(
        token: json["token"],
        id: json["id"],
      );

  @override
  String toString() {
    return '{token: $token, id: $id}';
  }
}
