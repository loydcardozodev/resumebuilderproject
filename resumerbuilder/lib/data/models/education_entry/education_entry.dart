import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_entry.freezed.dart';
part 'education_entry.g.dart';

@freezed
abstract class EducationEntry with _$EducationEntry {
  const factory EducationEntry({
    @Default('') String institute,
    @Default('') String qualification,
    @Default('') String start,
    @Default('') String end,
  }) = _EducationEntry;

  factory EducationEntry.fromJson(Map<String, dynamic> json) =>
      _$EducationEntryFromJson(json);

  factory EducationEntry.empty() => const EducationEntry();
}
