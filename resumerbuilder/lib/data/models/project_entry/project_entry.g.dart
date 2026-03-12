// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectEntry _$ProjectEntryFromJson(Map<String, dynamic> json) =>
    _ProjectEntry(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      features: json['features'] as String? ?? '',
      techUsed: json['techUsed'] as String? ?? '',
      githubLink: json['githubLink'] as String? ?? '',
      liveLink: json['liveLink'] as String? ?? '',
    );

Map<String, dynamic> _$ProjectEntryToJson(_ProjectEntry instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'features': instance.features,
      'techUsed': instance.techUsed,
      'githubLink': instance.githubLink,
      'liveLink': instance.liveLink,
    };
