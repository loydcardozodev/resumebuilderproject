// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resume _$ResumeFromJson(Map<String, dynamic> json) => _Resume(
  id: json['id'] as String?,
  personalInfo: PersonalInfo.fromJson(
    json['personalInfo'] as Map<String, dynamic>,
  ),
  career:
      (json['career'] as List<dynamic>?)
          ?.map((e) => CareerEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  education:
      (json['education'] as List<dynamic>?)
          ?.map((e) => EducationEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  keySkills:
      (json['keySkills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  projects:
      (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  interests:
      (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => ReferenceEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  selectedTemplateId: json['selectedTemplateId'] as String?,
);

Map<String, dynamic> _$ResumeToJson(_Resume instance) => <String, dynamic>{
  'id': instance.id,
  'personalInfo': instance.personalInfo,
  'career': instance.career,
  'education': instance.education,
  'keySkills': instance.keySkills,
  'projects': instance.projects,
  'interests': instance.interests,
  'references': instance.references,
  'selectedTemplateId': instance.selectedTemplateId,
};
