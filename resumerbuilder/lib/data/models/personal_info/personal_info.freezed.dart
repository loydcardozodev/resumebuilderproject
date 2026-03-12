// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalInfo {

 String get name; String get email; String get jobTitle; String get phone; String get address; String get website; String get personalStatement; String? get photoPath;
/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalInfoCopyWith<PersonalInfo> get copyWith => _$PersonalInfoCopyWithImpl<PersonalInfo>(this as PersonalInfo, _$identity);

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.website, website) || other.website == website)&&(identical(other.personalStatement, personalStatement) || other.personalStatement == personalStatement)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,jobTitle,phone,address,website,personalStatement,photoPath);

@override
String toString() {
  return 'PersonalInfo(name: $name, email: $email, jobTitle: $jobTitle, phone: $phone, address: $address, website: $website, personalStatement: $personalStatement, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class $PersonalInfoCopyWith<$Res>  {
  factory $PersonalInfoCopyWith(PersonalInfo value, $Res Function(PersonalInfo) _then) = _$PersonalInfoCopyWithImpl;
@useResult
$Res call({
 String name, String email, String jobTitle, String phone, String address, String website, String personalStatement, String? photoPath
});




}
/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._self, this._then);

  final PersonalInfo _self;
  final $Res Function(PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? jobTitle = null,Object? phone = null,Object? address = null,Object? website = null,Object? personalStatement = null,Object? photoPath = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,personalStatement: null == personalStatement ? _self.personalStatement : personalStatement // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalInfo].
extension PersonalInfoPatterns on PersonalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalInfo value)  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String jobTitle,  String phone,  String address,  String website,  String personalStatement,  String? photoPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.name,_that.email,_that.jobTitle,_that.phone,_that.address,_that.website,_that.personalStatement,_that.photoPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String jobTitle,  String phone,  String address,  String website,  String personalStatement,  String? photoPath)  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo():
return $default(_that.name,_that.email,_that.jobTitle,_that.phone,_that.address,_that.website,_that.personalStatement,_that.photoPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String jobTitle,  String phone,  String address,  String website,  String personalStatement,  String? photoPath)?  $default,) {final _that = this;
switch (_that) {
case _PersonalInfo() when $default != null:
return $default(_that.name,_that.email,_that.jobTitle,_that.phone,_that.address,_that.website,_that.personalStatement,_that.photoPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalInfo implements PersonalInfo {
  const _PersonalInfo({this.name = '', this.email = '', this.jobTitle = '', this.phone = '', this.address = '', this.website = '', this.personalStatement = '', this.photoPath});
  factory _PersonalInfo.fromJson(Map<String, dynamic> json) => _$PersonalInfoFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String jobTitle;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String address;
@override@JsonKey() final  String website;
@override@JsonKey() final  String personalStatement;
@override final  String? photoPath;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalInfoCopyWith<_PersonalInfo> get copyWith => __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.website, website) || other.website == website)&&(identical(other.personalStatement, personalStatement) || other.personalStatement == personalStatement)&&(identical(other.photoPath, photoPath) || other.photoPath == photoPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,jobTitle,phone,address,website,personalStatement,photoPath);

@override
String toString() {
  return 'PersonalInfo(name: $name, email: $email, jobTitle: $jobTitle, phone: $phone, address: $address, website: $website, personalStatement: $personalStatement, photoPath: $photoPath)';
}


}

/// @nodoc
abstract mixin class _$PersonalInfoCopyWith<$Res> implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(_PersonalInfo value, $Res Function(_PersonalInfo) _then) = __$PersonalInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String jobTitle, String phone, String address, String website, String personalStatement, String? photoPath
});




}
/// @nodoc
class __$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(this._self, this._then);

  final _PersonalInfo _self;
  final $Res Function(_PersonalInfo) _then;

/// Create a copy of PersonalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? jobTitle = null,Object? phone = null,Object? address = null,Object? website = null,Object? personalStatement = null,Object? photoPath = freezed,}) {
  return _then(_PersonalInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,personalStatement: null == personalStatement ? _self.personalStatement : personalStatement // ignore: cast_nullable_to_non_nullable
as String,photoPath: freezed == photoPath ? _self.photoPath : photoPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
