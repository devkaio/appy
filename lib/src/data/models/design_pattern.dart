import 'dart:convert';

class DesignPattern {
  final String id;
  final String title;
  final String description;
  final String route;

  DesignPattern({
    required this.id,
    required this.title,
    required this.description,
    required this.route,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'route': route,
    };
  }

  factory DesignPattern.fromMap(Map<String, dynamic> map) {
    return DesignPattern(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      route: map['route'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DesignPattern.fromJson(String source) =>
      DesignPattern.fromMap(json.decode(source) as Map<String, dynamic>);
}
