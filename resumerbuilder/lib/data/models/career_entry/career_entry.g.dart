// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerEntry _$CareerEntryFromJson(Map<String, dynamic> json) => _CareerEntry(
  jobTitle: json['jobTitle'] as String? ?? '',
  company: json['company'] as String? ?? '',
  location: json['location'] as String? ?? '',
  details: json['details'] as String? ?? '',
  start: json['start'] as String? ?? '',
  end: json['end'] as String? ?? '',
);

Map<String, dynamic> _$CareerEntryToJson(_CareerEntry instance) =>
    <String, dynamic>{
      'jobTitle': instance.jobTitle,
      'company': instance.company,
      'location': instance.location,
      'details': instance.details,
      'start': instance.start,
      'end': instance.end,
    };
