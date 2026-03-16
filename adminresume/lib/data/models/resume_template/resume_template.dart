import 'package:flutter/material.dart';

class ResumeTemplate {
  const ResumeTemplate({
    required this.id,
    required this.name,
    required this.accentColor,
    this.isPopular = false,
    this.createdAt,
    this.thumbnailUrl,
  });

  final String id;
  final String name;
  final Color accentColor;
  final bool isPopular;
  final DateTime? createdAt;
  final String? thumbnailUrl;

  ResumeTemplate copyWith({
    String? id,
    String? name,
    Color? accentColor,
    bool? isPopular,
    DateTime? createdAt,
    String? thumbnailUrl,
  }) {
    return ResumeTemplate(
      id: id ?? this.id,
      name: name ?? this.name,
      accentColor: accentColor ?? this.accentColor,
      isPopular: isPopular ?? this.isPopular,
      createdAt: createdAt ?? this.createdAt,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  factory ResumeTemplate.fromMap(String id, Map<String, dynamic> map) {
    return ResumeTemplate(
      id: id,
      name: map['name'] as String? ?? '',
      accentColor: Color(
        int.parse(
          (map['accentColorHex'] as String? ?? '#000000').replaceFirst(
            '#',
            '0xFF',
          ),
        ),
      ),
      isPopular: map['isPopular'] as bool? ?? false,
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? ''),
      thumbnailUrl: map['thumbnailUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'accentColorHex':
        '#${accentColor.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
    'isPopular': isPopular,
    'createdAt': (createdAt ?? DateTime.now()).toIso8601String(),
    'thumbnailUrl': thumbnailUrl,
  };
}
