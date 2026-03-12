import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_entry.freezed.dart';
part 'career_entry.g.dart';

@freezed
abstract class CareerEntry with _$CareerEntry {
  const factory CareerEntry({
    @Default('') String jobTitle,
    @Default('') String company,
    @Default('') String location,
    @Default('') String details,
    @Default('') String start,
    @Default('') String end,
  }) = _CareerEntry;

  factory CareerEntry.fromJson(Map<String, dynamic> json) =>
      _$CareerEntryFromJson(json);

  factory CareerEntry.empty() => const CareerEntry();
}
