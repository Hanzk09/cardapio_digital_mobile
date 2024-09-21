import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String name;
  String email;
  String? phone;
  DateTime? birthdate;
  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.birthdate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'birthdate': birthdate?.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      birthdate:
          map['birthdate'] != null ? DateTime.tryParse(map['birthdate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
