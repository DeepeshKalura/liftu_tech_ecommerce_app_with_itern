import 'dart:convert';

import 'package:collection/collection.dart';

class Categories {
  final int? id;
  final String? name;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  const Categories({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Categories(id: $id, name: $name, image: $image, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  factory Categories.fromMap(Map<String, dynamic> data) => Categories(
        id: data['id'] as int?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        creationAt: data['creationAt'] == null
            ? null
            : DateTime.parse(data['creationAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'creationAt': creationAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Categories].
  factory Categories.fromJson(String data) {
    return Categories.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Categories] to a JSON string.
  String toJson() => json.encode(toMap());

  Categories copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) {
    return Categories(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      creationAt: creationAt ?? this.creationAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Categories) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      creationAt.hashCode ^
      updatedAt.hashCode;
}
