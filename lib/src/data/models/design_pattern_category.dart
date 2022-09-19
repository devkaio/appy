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

  factory DesignPatternCategory.fromJson(Map<String, dynamic> json) {
    return DesignPatternCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      color: int.parse(json['color']),
      patterns: List<DesignPattern>.from(
        (json['patterns'] as List<dynamic>).map<DesignPattern>(
          (x) => DesignPattern.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
