import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info.freezed.dart';
part 'personal_info.g.dart';

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    @Default('') String name,
    @Default('') String email,
    @Default('') String jobTitle,
    @Default('') String phone,
    @Default('') String address,
    @Default('') String website,
    @Default('') String personalStatement,
    String? photoPath,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  factory PersonalInfo.empty() => const PersonalInfo();
}
