// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Resume {

 String? get id; PersonalInfo get personalInfo; List<CareerEntry> get career; List<EducationEntry> get education; List<String> get keySkills; List<ProjectEntry> get projects; List<String> get interests; List<ReferenceEntry> get references; String? get selectedTemplateId;
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResumeCopyWith<Resume> get copyWith => _$ResumeCopyWithImpl<Resume>(this as Resume, _$identity);

  /// Serializes this Resume to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resume&&(identical(other.id, id) || other.id == id)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other.career, career)&&const DeepCollectionEquality().equals(other.education, education)&&const DeepCollectionEquality().equals(other.keySkills, keySkills)&&const DeepCollectionEquality().equals(other.projects, projects)&&const DeepCollectionEquality().equals(other.interests, interests)&&const DeepCollectionEquality().equals(other.references, references)&&(identical(other.selectedTemplateId, selectedTemplateId) || other.selectedTemplateId == selectedTemplateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,personalInfo,const DeepCollectionEquality().hash(career),const DeepCollectionEquality().hash(education),const DeepCollectionEquality().hash(keySkills),const DeepCollectionEquality().hash(projects),const DeepCollectionEquality().hash(interests),const DeepCollectionEquality().hash(references),selectedTemplateId);

@override
String toString() {
  return 'Resume(id: $id, personalInfo: $personalInfo, career: $career, education: $education, keySkills: $keySkills, projects: $projects, interests: $interests, references: $references, selectedTemplateId: $selectedTemplateId)';
}


}

/// @nodoc
abstract mixin class $ResumeCopyWith<$Res>  {
  factory $ResumeCopyWith(Resume value, $Res Function(Resume) _then) = _$ResumeCopyWithImpl;
@useResult
$Res call({
 String? id, PersonalInfo personalInfo, List<CareerEntry> career, List<EducationEntry> education, List<String> keySkills, List<ProjectEntry> projects, List<String> interests, List<ReferenceEntry> references, String? selectedTemplateId
});


$PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class _$ResumeCopyWithImpl<$Res>
    implements $ResumeCopyWith<$Res> {
  _$ResumeCopyWithImpl(this._self, this._then);

  final Resume _self;
  final $Res Function(Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? personalInfo = null,Object? career = null,Object? education = null,Object? keySkills = null,Object? projects = null,Object? interests = null,Object? references = null,Object? selectedTemplateId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,career: null == career ? _self.career : career // ignore: cast_nullable_to_non_nullable
as List<CareerEntry>,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>,keySkills: null == keySkills ? _self.keySkills : keySkills // ignore: cast_nullable_to_non_nullable
as List<String>,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntry>,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceEntry>,selectedTemplateId: freezed == selectedTemplateId ? _self.selectedTemplateId : selectedTemplateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Resume].
extension ResumePatterns on Resume {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resume value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resume value)  $default,){
final _that = this;
switch (_that) {
case _Resume():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resume value)?  $default,){
final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  PersonalInfo personalInfo,  List<CareerEntry> career,  List<EducationEntry> education,  List<String> keySkills,  List<ProjectEntry> projects,  List<String> interests,  List<ReferenceEntry> references,  String? selectedTemplateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.personalInfo,_that.career,_that.education,_that.keySkills,_that.projects,_that.interests,_that.references,_that.selectedTemplateId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  PersonalInfo personalInfo,  List<CareerEntry> career,  List<EducationEntry> education,  List<String> keySkills,  List<ProjectEntry> projects,  List<String> interests,  List<ReferenceEntry> references,  String? selectedTemplateId)  $default,) {final _that = this;
switch (_that) {
case _Resume():
return $default(_that.id,_that.personalInfo,_that.career,_that.education,_that.keySkills,_that.projects,_that.interests,_that.references,_that.selectedTemplateId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  PersonalInfo personalInfo,  List<CareerEntry> career,  List<EducationEntry> education,  List<String> keySkills,  List<ProjectEntry> projects,  List<String> interests,  List<ReferenceEntry> references,  String? selectedTemplateId)?  $default,) {final _that = this;
switch (_that) {
case _Resume() when $default != null:
return $default(_that.id,_that.personalInfo,_that.career,_that.education,_that.keySkills,_that.projects,_that.interests,_that.references,_that.selectedTemplateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resume implements Resume {
  const _Resume({this.id, required this.personalInfo, final  List<CareerEntry> career = const [], final  List<EducationEntry> education = const [], final  List<String> keySkills = const [], final  List<ProjectEntry> projects = const [], final  List<String> interests = const [], final  List<ReferenceEntry> references = const [], this.selectedTemplateId}): _career = career,_education = education,_keySkills = keySkills,_projects = projects,_interests = interests,_references = references;
  factory _Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);

@override final  String? id;
@override final  PersonalInfo personalInfo;
 final  List<CareerEntry> _career;
@override@JsonKey() List<CareerEntry> get career {
  if (_career is EqualUnmodifiableListView) return _career;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_career);
}

 final  List<EducationEntry> _education;
@override@JsonKey() List<EducationEntry> get education {
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_education);
}

 final  List<String> _keySkills;
@override@JsonKey() List<String> get keySkills {
  if (_keySkills is EqualUnmodifiableListView) return _keySkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keySkills);
}

 final  List<ProjectEntry> _projects;
@override@JsonKey() List<ProjectEntry> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

 final  List<String> _interests;
@override@JsonKey() List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

 final  List<ReferenceEntry> _references;
@override@JsonKey() List<ReferenceEntry> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

@override final  String? selectedTemplateId;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeCopyWith<_Resume> get copyWith => __$ResumeCopyWithImpl<_Resume>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResumeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resume&&(identical(other.id, id) || other.id == id)&&(identical(other.personalInfo, personalInfo) || other.personalInfo == personalInfo)&&const DeepCollectionEquality().equals(other._career, _career)&&const DeepCollectionEquality().equals(other._education, _education)&&const DeepCollectionEquality().equals(other._keySkills, _keySkills)&&const DeepCollectionEquality().equals(other._projects, _projects)&&const DeepCollectionEquality().equals(other._interests, _interests)&&const DeepCollectionEquality().equals(other._references, _references)&&(identical(other.selectedTemplateId, selectedTemplateId) || other.selectedTemplateId == selectedTemplateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,personalInfo,const DeepCollectionEquality().hash(_career),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_keySkills),const DeepCollectionEquality().hash(_projects),const DeepCollectionEquality().hash(_interests),const DeepCollectionEquality().hash(_references),selectedTemplateId);

@override
String toString() {
  return 'Resume(id: $id, personalInfo: $personalInfo, career: $career, education: $education, keySkills: $keySkills, projects: $projects, interests: $interests, references: $references, selectedTemplateId: $selectedTemplateId)';
}


}

/// @nodoc
abstract mixin class _$ResumeCopyWith<$Res> implements $ResumeCopyWith<$Res> {
  factory _$ResumeCopyWith(_Resume value, $Res Function(_Resume) _then) = __$ResumeCopyWithImpl;
@override @useResult
$Res call({
 String? id, PersonalInfo personalInfo, List<CareerEntry> career, List<EducationEntry> education, List<String> keySkills, List<ProjectEntry> projects, List<String> interests, List<ReferenceEntry> references, String? selectedTemplateId
});


@override $PersonalInfoCopyWith<$Res> get personalInfo;

}
/// @nodoc
class __$ResumeCopyWithImpl<$Res>
    implements _$ResumeCopyWith<$Res> {
  __$ResumeCopyWithImpl(this._self, this._then);

  final _Resume _self;
  final $Res Function(_Resume) _then;

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? personalInfo = null,Object? career = null,Object? education = null,Object? keySkills = null,Object? projects = null,Object? interests = null,Object? references = null,Object? selectedTemplateId = freezed,}) {
  return _then(_Resume(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,personalInfo: null == personalInfo ? _self.personalInfo : personalInfo // ignore: cast_nullable_to_non_nullable
as PersonalInfo,career: null == career ? _self._career : career // ignore: cast_nullable_to_non_nullable
as List<CareerEntry>,education: null == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<EducationEntry>,keySkills: null == keySkills ? _self._keySkills : keySkills // ignore: cast_nullable_to_non_nullable
as List<String>,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectEntry>,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceEntry>,selectedTemplateId: freezed == selectedTemplateId ? _self.selectedTemplateId : selectedTemplateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Resume
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<$Res> get personalInfo {
  
  return $PersonalInfoCopyWith<$Res>(_self.personalInfo, (value) {
    return _then(_self.copyWith(personalInfo: value));
  });
}
}

// dart format on
