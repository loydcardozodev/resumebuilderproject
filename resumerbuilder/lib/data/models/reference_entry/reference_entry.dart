import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_entry.freezed.dart';
part 'reference_entry.g.dart';

@freezed
abstract class ReferenceEntry with _$ReferenceEntry {
  const factory ReferenceEntry({
    @Default('') String name,
    @Default('') String jobTitle,
    @Default('') String company,
    @Default('') String email,
    @Default('') String phone,
  }) = _ReferenceEntry;

  factory ReferenceEntry.fromJson(Map<String, dynamic> json) =>
      _$ReferenceEntryFromJson(json);

  factory ReferenceEntry.empty() => const ReferenceEntry();
}
