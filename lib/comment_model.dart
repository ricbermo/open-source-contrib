import 'dart:convert';

class Comment {
  String email;
  String body;
  Comment({
    this.email,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
      email: map['email'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));
}
