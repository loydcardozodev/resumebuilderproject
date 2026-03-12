// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferenceEntry _$ReferenceEntryFromJson(Map<String, dynamic> json) =>
    _ReferenceEntry(
      name: json['name'] as String? ?? '',
      jobTitle: json['jobTitle'] as String? ?? '',
      company: json['company'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );

Map<String, dynamic> _$ReferenceEntryToJson(_ReferenceEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'jobTitle': instance.jobTitle,
      'company': instance.company,
      'email': instance.email,
      'phone': instance.phone,
    };
