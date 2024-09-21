import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  int? id;
  String name;
  double price;
  String image;
  DateTime? publishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? idUserCreated;
  int? idUserEdited;
  Product({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.idUserCreated,
    this.idUserEdited,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'publishedAt': publishedAt?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'idUserCreated': idUserCreated,
      'idUserEdited': idUserEdited,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      price: double.parse(map['price'].toString()),
      image: map['image'] as String,
      publishedAt: map['publishedAt'] != null
          ? DateTime.tryParse(map['publishedAt'])
          : null,
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      updatedAt:
          map['updatedAt'] != null ? DateTime.tryParse(map['updatedAt']) : null,
      idUserCreated:
          map['idUserCreated'] != null ? map['idUserCreated'] as int : null,
      idUserEdited:
          map['idUserEdited'] != null ? map['idUserEdited'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
