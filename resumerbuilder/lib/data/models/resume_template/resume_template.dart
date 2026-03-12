import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'resume_template.freezed.dart';
part 'resume_template.g.dart';

@freezed
abstract class ResumeTemplate with _$ResumeTemplate {
  const factory ResumeTemplate({
    required String id,
    required String name,
    @ColorConverter() required Color accentColor,
    @Default(false) bool isPopular,
  }) = _ResumeTemplate;

  factory ResumeTemplate.fromJson(Map<String, dynamic> json) =>
      _$ResumeTemplateFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
