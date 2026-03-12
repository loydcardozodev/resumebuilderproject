// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) =>
    _PersonalInfo(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      jobTitle: json['jobTitle'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      website: json['website'] as String? ?? '',
      personalStatement: json['personalStatement'] as String? ?? '',
      photoPath: json['photoPath'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(_PersonalInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'jobTitle': instance.jobTitle,
      'phone': instance.phone,
      'address': instance.address,
      'website': instance.website,
      'personalStatement': instance.personalStatement,
      'photoPath': instance.photoPath,
    };
