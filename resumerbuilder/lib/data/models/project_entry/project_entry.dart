import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_entry.freezed.dart';
part 'project_entry.g.dart';

@freezed
abstract class ProjectEntry with _$ProjectEntry {
  const factory ProjectEntry({
    @Default('') String title,
    @Default('') String description,
    @Default('') String features,
    @Default('') String techUsed,
    @Default('') String githubLink,
    @Default('') String liveLink,
  }) = _ProjectEntry;

  factory ProjectEntry.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntryFromJson(json);

  factory ProjectEntry.empty() => const ProjectEntry();
}
