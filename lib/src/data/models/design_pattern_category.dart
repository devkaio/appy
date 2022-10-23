import 'dart:convert';

import 'design_pattern.dart';

class DesignPatternCategory {
  final String id;
  final String title;
  final int color;
  final List<DesignPattern> patterns;

  DesignPatternCategory({
    required this.id,
    required this.title,
    required this.color,
    required this.patterns,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'color': color,
      'patterns': patterns.map((x) => x.toMap()).toList(),
    };
  }

  factory DesignPatternCategory.fromMap(Map<String, dynamic> map) {
    return DesignPatternCategory(
      id: map['id'] as String,
      title: map['title'] as String,
      color: int.parse(map['color']),
      patterns: List<DesignPattern>.from(
        (map['patterns'] as List).map<DesignPattern>(
          (x) => DesignPattern.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DesignPatternCategory.fromJson(String source) =>
      DesignPatternCategory.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
