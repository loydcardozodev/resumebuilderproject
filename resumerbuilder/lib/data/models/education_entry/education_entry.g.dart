// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EducationEntry _$EducationEntryFromJson(Map<String, dynamic> json) =>
    _EducationEntry(
      institute: json['institute'] as String? ?? '',
      qualification: json['qualification'] as String? ?? '',
      start: json['start'] as String? ?? '',
      end: json['end'] as String? ?? '',
    );

Map<String, dynamic> _$EducationEntryToJson(_EducationEntry instance) =>
    <String, dynamic>{
      'institute': instance.institute,
      'qualification': instance.qualification,
      'start': instance.start,
      'end': instance.end,
    };
