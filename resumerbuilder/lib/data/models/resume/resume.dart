import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resumerbuilder/data/models/personal_info/personal_info.dart';
import 'package:resumerbuilder/data/models/career_entry/career_entry.dart';
import 'package:resumerbuilder/data/models/education_entry/education_entry.dart';
import 'package:resumerbuilder/data/models/project_entry/project_entry.dart';
import 'package:resumerbuilder/data/models/reference_entry/reference_entry.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
abstract class Resume with _$Resume {
  const factory Resume({
    String? id,
    required PersonalInfo personalInfo,
    @Default([]) List<CareerEntry> career,
    @Default([]) List<EducationEntry> education,
    @Default([]) List<String> keySkills,
    @Default([]) List<ProjectEntry> projects,
    @Default([]) List<String> interests,
    @Default([]) List<ReferenceEntry> references,
    String? selectedTemplateId,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

  factory Resume.empty() => Resume(personalInfo: PersonalInfo.empty());
}
