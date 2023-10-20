import 'dart:convert';

import 'package:collection/collection.dart';

class HeroProduct {
  String? title;
  String? subtitle;
  String? imageUrl;
  String? color;

  HeroProduct({this.title, this.subtitle, this.imageUrl, this.color});

  @override
  String toString() {
    return 'HeroProduct(title: $title, subtitle: $subtitle, imageUrl: $imageUrl, color: $color)';
  }

  factory HeroProduct.fromMap(Map<String, dynamic> data) => HeroProduct(
        title: data['title'] as String?,
        subtitle: data['subtitle'] as String?,
        imageUrl: data['imageUrl'] as String?,
        color: data['color'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'subtitle': subtitle,
        'imageUrl': imageUrl,
        'color': color,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HeroProduct].
  factory HeroProduct.fromJson(String data) {
    return HeroProduct.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HeroProduct] to a JSON string.
  String toJson() => json.encode(toMap());

  HeroProduct copyWith({
    String? title,
    String? subtitle,
    String? imageUrl,
    String? color,
  }) {
    return HeroProduct(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      imageUrl: imageUrl ?? this.imageUrl,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! HeroProduct) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      title.hashCode ^ subtitle.hashCode ^ imageUrl.hashCode ^ color.hashCode;
}
