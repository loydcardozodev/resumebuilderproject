// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResumeTemplate _$ResumeTemplateFromJson(Map<String, dynamic> json) =>
    _ResumeTemplate(
      id: json['id'] as String,
      name: json['name'] as String,
      accentColor: const ColorConverter().fromJson(
        (json['accentColor'] as num).toInt(),
      ),
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$ResumeTemplateToJson(_ResumeTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accentColor': const ColorConverter().toJson(instance.accentColor),
      'isPopular': instance.isPopular,
    };
